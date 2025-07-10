#!/bin/bash

# Stride AI Website Deployment Script for Supabase
# This script automates the deployment process to Supabase

set -e

echo "🚀 Starting Stride AI website deployment to Supabase..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Supabase CLI is installed
check_supabase_cli() {
    if ! command -v supabase &> /dev/null; then
        print_error "Supabase CLI is not installed. Please install it first:"
        echo "npm install -g supabase"
        echo "or"
        echo "brew install supabase/tap/supabase"
        exit 1
    fi
    print_success "Supabase CLI is installed"
}

# Check if user is logged in to Supabase
check_supabase_login() {
    if ! supabase status &> /dev/null; then
        print_warning "You are not logged in to Supabase. Please run:"
        echo "supabase login"
        exit 1
    fi
    print_success "Logged in to Supabase"
}

# Initialize Supabase project if not already done
init_supabase_project() {
    if [ ! -f "supabase/config.toml" ]; then
        print_status "Initializing Supabase project..."
        supabase init
        print_success "Supabase project initialized"
    else
        print_status "Supabase project already initialized"
    fi
}

# Create Edge Function for serving the website
create_edge_function() {
    if [ ! -d "supabase/functions/serve-website" ]; then
        print_status "Creating Edge Function for website serving..."
        supabase functions new serve-website
        
        # Create the function code
        cat > supabase/functions/serve-website/index.ts << 'EOF'
import { serve } from "https://deno.land/std@0.168.0/http/server.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  const url = new URL(req.url)
  let filePath = url.pathname

  if (filePath === '/') {
    filePath = '/index.html'
  }

  try {
    const file = await Deno.readFile(`./public${filePath}`)
    const contentType = getContentType(filePath)
    
    return new Response(file, {
      headers: {
        ...corsHeaders,
        'Content-Type': contentType,
        'Cache-Control': 'public, max-age=3600',
      },
    })
  } catch {
    return new Response('File not found', { status: 404, headers: corsHeaders })
  }
})

function getContentType(path: string): string {
  if (path.endsWith('.html')) return 'text/html'
  if (path.endsWith('.css')) return 'text/css'
  if (path.endsWith('.js')) return 'application/javascript'
  if (path.endsWith('.png')) return 'image/png'
  if (path.endsWith('.jpg') || path.endsWith('.jpeg')) return 'image/jpeg'
  if (path.endsWith('.svg')) return 'image/svg+xml'
  if (path.endsWith('.ico')) return 'image/x-icon'
  return 'text/plain'
}
EOF
        
        print_success "Edge Function created"
    else
        print_status "Edge Function already exists"
    fi
}

# Copy website files to the Edge Function public directory
copy_website_files() {
    print_status "Copying website files to Edge Function..."
    
    # Create public directory if it doesn't exist
    mkdir -p supabase/functions/serve-website/public
    
    # Copy website files
    cp index.html supabase/functions/serve-website/public/
    cp styles.css supabase/functions/serve-website/public/
    cp script.js supabase/functions/serve-website/public/
    
    # Copy images directory (coaches, screenshots, etc.)
    if [ -d "images" ]; then
        cp -r images supabase/functions/serve-website/public/
        print_status "Images directory copied"
    else
        print_warning "Images directory not found - creating placeholder"
        mkdir -p supabase/functions/serve-website/public/images
    fi
    
    # Copy any additional assets if they exist
    if [ -d "assets" ]; then
        cp -r assets supabase/functions/serve-website/public/
    fi
    
    print_success "Website files copied to Edge Function"
}

# Deploy the Edge Function
deploy_function() {
    print_status "Deploying Edge Function to Supabase..."
    supabase functions deploy serve-website
    print_success "Edge Function deployed successfully"
}

# Get the deployment URL
get_deployment_url() {
    print_status "Getting deployment URL..."
    
    # Get project reference from config
    if [ -f "supabase/config.toml" ]; then
        PROJECT_REF=$(grep "project_id" supabase/config.toml | cut -d'"' -f2)
        if [ ! -z "$PROJECT_REF" ]; then
            DEPLOYMENT_URL="https://${PROJECT_REF}.supabase.co/functions/v1/serve-website"
            print_success "Your website is deployed at:"
            echo -e "${GREEN}${DEPLOYMENT_URL}${NC}"
            echo ""
            print_status "You can also access it at:"
            echo -e "${GREEN}https://${PROJECT_REF}.supabase.co/functions/v1/serve-website/index.html${NC}"
        else
            print_warning "Could not determine project reference. Please check your Supabase dashboard for the deployment URL."
        fi
    else
        print_warning "Could not find Supabase config. Please check your Supabase dashboard for the deployment URL."
    fi
}

# Main deployment process
main() {
    echo "🏃‍♂️ Stride AI Website Deployment"
    echo "================================"
    echo ""
    
    check_supabase_cli
    check_supabase_login
    init_supabase_project
    create_edge_function
    copy_website_files
    deploy_function
    get_deployment_url
    
    echo ""
    print_success "Deployment completed successfully! 🎉"
    echo ""
    print_status "Next steps:"
    echo "1. Test your website at the deployment URL"
    echo "2. Set up a custom domain in your Supabase dashboard"
    echo "3. Configure analytics and monitoring"
    echo ""
    print_status "For more information, see the README.md file"
}

# Run the main function
main "$@" 