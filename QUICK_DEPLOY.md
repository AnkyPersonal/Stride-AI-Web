# 🚀 Quick Deploy Guide - Stride AI Website

Get your Stride AI website live on Supabase in under 5 minutes!

## Prerequisites

1. **Supabase Account**: Sign up at [supabase.com](https://supabase.com) (free)
2. **Supabase CLI**: Install with `npm install -g supabase` or `brew install supabase/tap/supabase`

## ⚡ Quick Start (3 Steps)

### Step 1: Login to Supabase
```bash
supabase login
```

### Step 2: Run the Deployment Script
```bash
cd website
./deploy.sh
```

### Step 3: Access Your Website
The script will show you the deployment URL. Your website will be live at:
```
https://YOUR_PROJECT_REF.supabase.co/functions/v1/serve-website
```

## 🎯 What the Script Does

The `deploy.sh` script automatically:
- ✅ Checks if Supabase CLI is installed
- ✅ Verifies you're logged in
- ✅ Initializes the Supabase project
- ✅ Creates an Edge Function to serve your website
- ✅ Copies all website files
- ✅ Deploys everything to Supabase
- ✅ Shows you the live URL

## 🔧 Manual Deployment (Alternative)

If you prefer to deploy manually:

1. **Initialize Supabase**:
   ```bash
   supabase init
   ```

2. **Create Edge Function**:
   ```bash
   supabase functions new serve-website
   ```

3. **Copy the function code** from the README.md to `supabase/functions/serve-website/index.ts`

4. **Copy website files**:
   ```bash
   mkdir -p supabase/functions/serve-website/public
   cp index.html styles.css script.js supabase/functions/serve-website/public/
   ```

5. **Deploy**:
   ```bash
   supabase functions deploy serve-website
   ```

## 🌐 Custom Domain Setup

1. Go to your Supabase dashboard
2. Navigate to Settings → General
3. Add your custom domain
4. Update your DNS settings as instructed

## 📊 Monitoring

- **Function Logs**: Check in Supabase dashboard under Functions
- **Performance**: Monitor in the Analytics section
- **Errors**: Set up alerts in the dashboard

## 🆘 Troubleshooting

### "Command not found: supabase"
```bash
npm install -g supabase
```

### "Not logged in"
```bash
supabase login
```

### "Function deployment failed"
- Check your internet connection
- Verify you're in the correct directory
- Try running `supabase functions deploy serve-website` manually

### "File not found" on website
- Ensure all files are copied to the public directory
- Check file permissions
- Verify the function code is correct

## 📞 Need Help?

- [Supabase Documentation](https://supabase.com/docs)
- [Supabase Community](https://github.com/supabase/supabase/discussions)
- [Supabase Discord](https://discord.supabase.com)

---

**Your Stride AI website is now live! 🎉**

Visit your deployment URL to see your AI-powered running coach website in action. 