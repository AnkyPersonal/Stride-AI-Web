# Stride AI Website

A modern, responsive landing page for the Stride AI-powered running coach application.

## 🚀 Features

- **Modern Design**: Clean, professional startup-style landing page
- **Responsive**: Works perfectly on desktop, tablet, and mobile devices
- **Interactive**: Smooth animations, hover effects, and dynamic content
- **Performance Optimized**: Fast loading with optimized assets
- **SEO Ready**: Proper meta tags and semantic HTML structure

## 📁 File Structure

```
website/
├── index.html              # Main HTML file
├── styles.css              # CSS styles and responsive design
├── script.js               # JavaScript for interactivity
├── supabase.json           # Supabase hosting configuration
├── import_map.json         # Edge Function dependencies
├── deploy.sh               # Automated deployment script
├── setup-screenshots.sh    # Screenshot setup helper
├── package.json            # Project management
├── .gitignore              # Git ignore rules
├── QUICK_DEPLOY.md         # Quick deployment guide
├── SCREENSHOTS_GUIDE.md    # Detailed screenshot guide
├── images/                 # App images and screenshots
│   ├── screenshots/
│   │   ├── iphone/         # iPhone app screenshots
│   │   └── apple-watch/    # Watch app screenshots
│   └── coaches/            # AI coach images
└── README.md               # This file
```

## 🎨 Design Features

### Sections
1. **Hero Section**: Eye-catching introduction with app mockup
2. **Features**: Key benefits and capabilities
3. **AI Coaches**: Showcase of available AI coaches with real images
4. **App Screenshots**: Gallery of app interface screenshots
5. **How It Works**: Simple 3-step process
6. **Demo**: Video placeholder for product demonstration
7. **Pricing**: Three-tier pricing structure
8. **Call-to-Action**: Download buttons and trial offer
9. **Footer**: Links and company information

### Interactive Elements
- Smooth scrolling navigation
- Mobile-responsive hamburger menu
- Animated counters for statistics
- Hover effects on cards and buttons
- Parallax scrolling effects
- Typing animation for hero subtitle

## 🛠️ Setup Instructions

### Local Development
1. Clone or download the website files
2. Open `index.html` in your web browser
3. The website will load with all styles and functionality

### Web Server (Recommended)
For the best experience, serve the files through a web server:

```bash
# Using Python 3
python -m http.server 8000

# Using Node.js (if you have http-server installed)
npx http-server

# Using PHP
php -S localhost:8000
```

Then visit `http://localhost:8000` in your browser.

## 🚀 Deployment on Supabase

### Prerequisites
- A Supabase account (free tier available)
- Git installed on your local machine
- Supabase CLI (optional but recommended)

### Method 1: Using Supabase Dashboard (Easiest)

1. **Create a Supabase Project**
   - Go to [supabase.com](https://supabase.com)
   - Sign up or log in to your account
   - Click "New Project"
   - Choose your organization
   - Enter project name (e.g., "stride-ai-website")
   - Set a database password
   - Choose a region close to your users
   - Click "Create new project"

2. **Enable Edge Functions**
   - In your Supabase dashboard, go to "Settings" → "API"
   - Note down your project URL and anon key (you'll need these later)

3. **Deploy Static Files**
   - In your Supabase dashboard, go to "Storage"
   - Create a new bucket called "public"
   - Set the bucket to public
   - Upload all your website files (index.html, styles.css, script.js) to the bucket

4. **Configure Custom Domain (Optional)**
   - Go to "Settings" → "General"
   - Add your custom domain
   - Update your DNS settings as instructed

### Method 2: Using Supabase CLI (Advanced)

1. **Install Supabase CLI**
   ```bash
   # Using npm
   npm install -g supabase

   # Using Homebrew (macOS)
   brew install supabase/tap/supabase
   ```

2. **Login to Supabase**
   ```bash
   supabase login
   ```

3. **Initialize Supabase in your project**
   ```bash
   cd website
   supabase init
   ```

4. **Link to your Supabase project**
   ```bash
   supabase link --project-ref YOUR_PROJECT_REF
   ```

5. **Deploy your website**
   ```bash
   supabase functions deploy
   ```

### Method 3: Using Supabase Edge Functions (Most Flexible)

1. **Create an Edge Function**
   ```bash
   supabase functions new serve-website
   ```

2. **Create the function code** in `supabase/functions/serve-website/index.ts`:
   ```typescript
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
     return 'text/plain'
   }
   ```

3. **Create a public folder** and copy your website files there:
   ```bash
   mkdir -p supabase/functions/serve-website/public
   cp index.html styles.css script.js supabase/functions/serve-website/public/
   ```

4. **Deploy the function**
   ```bash
   supabase functions deploy serve-website
   ```

5. **Access your website**
   Your website will be available at:
   `https://YOUR_PROJECT_REF.supabase.co/functions/v1/serve-website`

## 🔧 Configuration Files

### supabase.json (for CLI deployment)
```json
{
  "functions": {
    "serve-website": {
      "import_map": "./import_map.json",
      "verify_jwt": false
    }
  }
}
```

### import_map.json
```json
{
  "imports": {
    "std/": "https://deno.land/std@0.168.0/"
  }
}
```

## 🌐 Custom Domain Setup

1. **In Supabase Dashboard**
   - Go to "Settings" → "General"
   - Add your custom domain
   - Copy the CNAME record

2. **In Your DNS Provider**
   - Add a CNAME record pointing to the provided Supabase URL
   - Wait for DNS propagation (can take up to 48 hours)

3. **SSL Certificate**
   - Supabase automatically provides SSL certificates
   - No additional configuration needed

## 📊 Performance Optimization

### For Supabase Hosting
1. **Enable CDN**: Supabase automatically provides global CDN
2. **Compress Files**: Minify CSS and JavaScript for production
3. **Optimize Images**: Use WebP format and appropriate sizes
4. **Cache Headers**: Set appropriate cache headers for static assets

### Production Build
```bash
# Minify CSS (if you have a build process)
npx cssnano styles.css -o styles.min.css

# Minify JavaScript (if you have a build process)
npx terser script.js -o script.min.js
```

## 🔒 Security Considerations

1. **CORS Configuration**: Properly configure CORS headers
2. **Content Security Policy**: Add CSP headers for security
3. **HTTPS**: Supabase automatically provides SSL certificates
4. **Rate Limiting**: Consider implementing rate limiting for API calls

## 📈 Analytics and Monitoring

### Supabase Analytics
- Monitor function invocations in the Supabase dashboard
- Track performance metrics
- Set up alerts for errors

### Google Analytics
Add Google Analytics to your website by including the tracking code in your HTML:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

## 🚨 Troubleshooting

### Common Issues

1. **Function Not Found (404)**
   - Ensure the function is deployed correctly
   - Check the function name in the URL
   - Verify the project reference

2. **CORS Errors**
   - Check that CORS headers are properly set
   - Verify the origin is allowed

3. **File Not Found**
   - Ensure all files are in the correct directory
   - Check file permissions
   - Verify file paths in the function

4. **Performance Issues**
   - Enable Supabase CDN
   - Optimize file sizes
   - Use appropriate cache headers

### Getting Help
- [Supabase Documentation](https://supabase.com/docs)
- [Supabase Community](https://github.com/supabase/supabase/discussions)
- [Supabase Discord](https://discord.supabase.com)

## 📱 Adding Real Screenshots

### Quick Setup
1. **Run the setup script**:
   ```bash
   cd website
   ./setup-screenshots.sh
   ```

2. **Take screenshots** using iOS Simulator:
   - Open your SmartRunningCoach app in Xcode
   - Navigate to key screens (dashboard, coach selection, workout session)
   - Press `Cmd + S` to take screenshots
   - Save them to `images/screenshots/iphone/`

3. **Update the website**:
   - Replace placeholder images in `index.html`
   - Uncomment the `<img>` tags
   - Test locally with `npm start`

4. **Deploy with screenshots**:
   ```bash
   ./deploy.sh
   ```

### Screenshot Requirements
- **iPhone**: 1170 x 2532px (iPhone 13 Pro resolution)
- **Apple Watch**: 198 x 242px (Series 7 resolution)
- **Format**: PNG or JPEG
- **Content**: Show realistic data, not placeholder text

See `SCREENSHOTS_GUIDE.md` for detailed instructions.

## 🎯 Customization

### Colors
The website uses a modern blue gradient theme. To change colors, update these CSS variables in `styles.css`:

```css
/* Primary colors */
--primary-blue: #2563eb;
--primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
```

### Content
- Update text content in `index.html`
- Modify pricing in the pricing section
- Change statistics in the hero section
- Update contact information in the footer

### Images
- Replace the phone mockup with actual app screenshots
- Add your company logo
- Include real demo videos
- Add team photos or testimonials

## 📱 Mobile Optimization

The website is fully responsive and includes:
- Mobile-first design approach
- Touch-friendly navigation
- Optimized layouts for small screens
- Fast loading on mobile networks

## 🔧 Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)
- Mobile browsers (iOS Safari, Chrome Mobile)

## 📈 Performance

- Optimized images and assets
- Minified CSS and JavaScript (for production)
- Fast loading times
- SEO-friendly structure

## 🎨 Design System

### Typography
- **Font**: Inter (Google Fonts)
- **Headings**: Bold weights (600-700)
- **Body**: Regular weight (400)

### Spacing
- Consistent 8px grid system
- Responsive padding and margins
- Proper visual hierarchy

### Colors
- **Primary**: Blue gradient (#667eea to #764ba2)
- **Secondary**: Blue (#2563eb)
- **Text**: Dark gray (#1e293b)
- **Background**: Light gray (#f8fafc)

## 📞 Support

For questions or customization requests, please contact the development team.

## 📄 License

This website template is created for Stride AI. All rights reserved.

---

**Stride AI** - Your AI-powered running coach that adapts to your performance in real-time. 