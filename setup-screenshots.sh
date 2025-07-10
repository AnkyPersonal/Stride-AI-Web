#!/bin/bash

# Screenshot Setup Script for Stride AI Website
# This script helps set up the directory structure for app screenshots

set -e

echo "📱 Setting up screenshot directories for Stride AI website..."

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Create directory structure
create_directories() {
    print_status "Creating screenshot directory structure..."
    
    # Create main directories
    mkdir -p images/screenshots/iphone
    mkdir -p images/screenshots/apple-watch
    mkdir -p images/coaches
    
    print_success "Directory structure created"
}

# Create placeholder files
create_placeholders() {
    print_status "Creating placeholder files..."
    
    # Create placeholder files for iPhone screenshots
    cat > images/screenshots/iphone/README.md << 'EOF'
# iPhone Screenshots

Place your iPhone app screenshots here with the following naming convention:

- dashboard.png - Main app dashboard with active coach
- coach-selection.png - Grid view of available coaches
- workout-session.png - Active workout with real-time metrics
- profile-setup.png - User profile creation flow
- workout-history.png - List of completed workouts
- settings.png - App settings and preferences
- voice-coaching.png - Screenshot showing voice interaction
- heart-rate-zones.png - Real-time heart rate monitoring
- workout-summary.png - Post-workout statistics
- coach-chat.png - AI coach conversation interface

## Screenshot Guidelines:
- Resolution: 1170 x 2532px (iPhone 13 Pro)
- Format: PNG or JPEG
- Quality: High resolution, clear and crisp
- Content: Show realistic data, not placeholder text
EOF

    # Create placeholder files for Apple Watch screenshots
    cat > images/screenshots/apple-watch/README.md << 'EOF'
# Apple Watch Screenshots

Place your Apple Watch app screenshots here with the following naming convention:

- watch-main.png - Main watch interface
- watch-workout.png - Active workout on watch
- watch-metrics.png - Real-time metrics on watch face

## Screenshot Guidelines:
- Resolution: 198 x 242px (Series 7)
- Format: PNG or JPEG
- Quality: High resolution, clear and crisp
EOF

    # Create placeholder for coaches
    cat > images/coaches/README.md << 'EOF'
# Coach Images

Coach images are already copied from your app assets:
- alex-coach.png - Alex (Motivational Coach)
- nova-coach.png - Nova (Technical Coach)
- taylor-coach.png - Taylor (Supportive Coach)

These images are used in the "Meet Your AI Coaches" section.
EOF

    print_success "Placeholder files created"
}

# Show instructions
show_instructions() {
    echo ""
    print_status "📸 Screenshot Setup Complete!"
    echo ""
    echo "Next steps to add real screenshots:"
    echo ""
    echo "1. 📱 Take iPhone Screenshots:"
    echo "   - Open your app in iOS Simulator"
    echo "   - Navigate to key screens"
    echo "   - Press Cmd+S to take screenshots"
    echo "   - Save them to images/screenshots/iphone/"
    echo ""
    echo "2. ⌚ Take Apple Watch Screenshots:"
    echo "   - Open Watch app in Xcode"
    echo "   - Take screenshots using Cmd+S"
    echo "   - Save them to images/screenshots/apple-watch/"
    echo ""
    echo "3. 🔄 Update Website:"
    echo "   - Replace placeholder images in index.html"
    echo "   - Uncomment the <img> tags in the HTML"
    echo "   - Test the website locally"
    echo ""
    echo "4. 🚀 Deploy:"
    echo "   - Run ./deploy.sh to deploy with screenshots"
    echo ""
    echo "📁 Directory Structure Created:"
    echo "   images/"
    echo "   ├── screenshots/"
    echo "   │   ├── iphone/          (iPhone app screenshots)"
    echo "   │   └── apple-watch/     (Watch app screenshots)"
    echo "   └── coaches/             (Coach images - already populated)"
    echo ""
    print_warning "See SCREENSHOTS_GUIDE.md for detailed instructions"
}

# Main execution
main() {
    echo "🏃‍♂️ Stride AI Screenshot Setup"
    echo "=============================="
    echo ""
    
    create_directories
    create_placeholders
    show_instructions
}

# Run the main function
main "$@" 