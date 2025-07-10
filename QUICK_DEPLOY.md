# 🚀 Quick Deploy Guide - Stride AI Website

Get your Stride AI website live quickly with multiple deployment options!

## 🎯 Deployment Options

### Option 1: GitHub Pages (Recommended)
1. **Push to GitHub**: Upload your website files to a GitHub repository
2. **Enable Pages**: Go to Settings → Pages → Source → Deploy from branch
3. **Select Branch**: Choose `main` or `master` branch
4. **Access**: Your site will be live at `https://YOUR_USERNAME.github.io/YOUR_REPO`

### Option 2: Netlify
1. **Sign up**: Create account at [netlify.com](https://netlify.com)
2. **Drag & Drop**: Drag your website folder to Netlify's deploy area
3. **Access**: Get instant deployment URL
4. **Custom Domain**: Add your domain in site settings

### Option 3: Vercel
1. **Sign up**: Create account at [vercel.com](https://vercel.com)
2. **Import Project**: Connect your GitHub repository
3. **Deploy**: Automatic deployment on every push
4. **Custom Domain**: Add domain in project settings

### Option 4: Firebase Hosting
1. **Install Firebase CLI**: `npm install -g firebase-tools`
2. **Login**: `firebase login`
3. **Initialize**: `firebase init hosting`
4. **Deploy**: `firebase deploy`

## 📁 Website Structure

Your website includes:
- `index.html` - Main landing page
- `support.html` - Support page for app store
- `styles.css` - Styling
- `script.js` - Interactive features
- `images/` - Screenshots and assets

## 🌐 Custom Domain Setup

### GitHub Pages
1. Go to repository Settings → Pages
2. Add custom domain in "Custom domain" field
3. Update DNS settings with your domain provider

### Netlify/Vercel
1. Go to site/project settings
2. Add custom domain
3. Follow DNS configuration instructions

## 📊 Monitoring

- **GitHub Pages**: Check repository Actions tab
- **Netlify**: Monitor in site dashboard
- **Vercel**: Check deployment logs in project dashboard
- **Firebase**: Monitor in Firebase console

## 🆘 Troubleshooting

### "Page not found"
- Ensure all files are in the correct directory
- Check file permissions
- Verify deployment completed successfully

### "Styles not loading"
- Check file paths in HTML
- Ensure CSS file is included in deployment
- Verify CDN links are accessible

### "Images not showing"
- Check image file paths
- Ensure images are included in deployment
- Verify file extensions are correct

## 📞 Need Help?

- [GitHub Pages Documentation](https://pages.github.com/)
- [Netlify Documentation](https://docs.netlify.com/)
- [Vercel Documentation](https://vercel.com/docs)
- [Firebase Documentation](https://firebase.google.com/docs/hosting)

## 🎉 Support Page

The website includes a comprehensive support page (`support.html`) that's perfect for app store requirements, featuring:
- FAQ section
- Troubleshooting guides
- Contact information
- Search functionality

---

**Your Stride AI website is ready to deploy! 🚀**

Choose your preferred deployment method and get your AI-powered running coach website live in minutes. 