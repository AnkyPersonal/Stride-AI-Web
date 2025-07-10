# 📱 Screenshots Guide - Stride AI Website

This guide helps you add real screenshots from your SmartRunningCoach app to make the website more authentic and compelling.

## 📸 Required Screenshots

### 1. App Store Screenshots (iPhone)
Create these screenshots using the iOS Simulator or a real device:

#### Main Screenshots (Required)
- **Dashboard View**: Main app dashboard with active coach
- **Coach Selection**: Grid view of available coaches (Alex, Nova, Taylor, etc.)
- **Workout Session**: Active workout with real-time metrics
- **Profile Setup**: User profile creation flow
- **Workout History**: List of completed workouts
- **Settings**: App settings and preferences

#### Recommended Screenshots
- **Voice Coaching**: Screenshot showing voice interaction
- **Heart Rate Zones**: Real-time heart rate monitoring
- **Workout Summary**: Post-workout statistics
- **Coach Chat**: AI coach conversation interface

### 2. Apple Watch Screenshots
- **Watch App**: Main watch interface
- **Workout Session**: Active workout on watch
- **Metrics Display**: Real-time metrics on watch face

## 🛠️ How to Take Screenshots

### Using iOS Simulator
1. Open your SmartRunningCoach app in Xcode
2. Run the app in iOS Simulator
3. Navigate to the screen you want to capture
4. Press `Cmd + S` to take a screenshot
5. Screenshots are saved to Desktop by default

### Using Real Device
1. Navigate to the desired screen in your app
2. Press `Power + Volume Up` (iPhone X and later)
3. Press `Power + Home` (iPhone 8 and earlier)
4. Screenshots are saved to Photos app

### Using Apple Watch Simulator
1. Open Watch app in Xcode
2. Run the watch app in simulator
3. Take screenshots using `Cmd + S`

## 📁 File Organization

Place your screenshots in the following structure:

```
website/images/
├── screenshots/
│   ├── iphone/
│   │   ├── dashboard.png
│   │   ├── coach-selection.png
│   │   ├── workout-session.png
│   │   ├── profile-setup.png
│   │   ├── workout-history.png
│   │   ├── settings.png
│   │   ├── voice-coaching.png
│   │   ├── heart-rate-zones.png
│   │   ├── workout-summary.png
│   │   └── coach-chat.png
│   └── apple-watch/
│       ├── watch-main.png
│       ├── watch-workout.png
│       └── watch-metrics.png
├── coaches/
│   ├── alex-coach.png
│   ├── nova-coach.png
│   ├── taylor-coach.png
│   └── jamie-coach.png
└── app-icon.png
```

## 🎨 Screenshot Guidelines

### Image Specifications
- **iPhone Screenshots**: 1170 x 2532px (iPhone 13 Pro resolution)
- **Apple Watch Screenshots**: 198 x 242px (Series 7 resolution)
- **Format**: PNG or JPEG
- **Quality**: High resolution, clear and crisp

### Content Guidelines
- **Show Real Data**: Use realistic workout data, not placeholder text
- **Consistent Design**: Ensure all screenshots follow the same design language
- **Good Lighting**: Avoid dark or blurry screenshots
- **No Personal Info**: Remove any personal data or sensitive information
- **App State**: Show the app in an active, engaging state

### Recommended Scenarios
1. **Dashboard**: Show active coach with recent workout stats
2. **Workout Session**: Display real-time metrics (pace, heart rate, distance)
3. **Coach Selection**: Show multiple coaches with different personalities
4. **Profile**: Display a complete user profile with realistic data

## 🔄 Updating the Website

After adding screenshots, update the website files:

### 1. Update HTML
Replace placeholder images in `index.html` with real screenshots:

```html
<!-- Replace the phone mockup with real screenshots -->
<div class="phone-mockup">
    <img src="images/screenshots/iphone/dashboard.png" alt="Stride AI Dashboard">
</div>
```

### 2. Update CSS
Adjust styles in `styles.css` to accommodate real screenshots:

```css
.phone-mockup img {
    width: 100%;
    height: auto;
    border-radius: 20px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.1);
}
```

### 3. Add Screenshot Gallery
Create a new section showcasing multiple app screens:

```html
<section class="app-screenshots">
    <div class="container">
        <h2>See Stride AI in Action</h2>
        <div class="screenshot-gallery">
            <img src="images/screenshots/iphone/dashboard.png" alt="Dashboard">
            <img src="images/screenshots/iphone/workout-session.png" alt="Workout Session">
            <img src="images/screenshots/iphone/coach-selection.png" alt="Coach Selection">
        </div>
    </div>
</section>
```

## 🚀 Quick Implementation

### Step 1: Take Screenshots
1. Open your app in iOS Simulator
2. Navigate through key screens
3. Take screenshots of each important view

### Step 2: Organize Files
1. Create the directory structure above
2. Save screenshots with descriptive names
3. Optimize images for web (compress if needed)

### Step 3: Update Website
1. Replace placeholder images in HTML
2. Update CSS for proper display
3. Test on different screen sizes

### Step 4: Deploy
1. Run the deployment script: `./deploy.sh`
2. Verify screenshots display correctly
3. Test on mobile devices

## 📱 Screenshot Checklist

- [ ] Dashboard with active coach
- [ ] Coach selection grid
- [ ] Active workout session
- [ ] Profile setup flow
- [ ] Workout history
- [ ] Settings screen
- [ ] Apple Watch interface
- [ ] Voice coaching interaction
- [ ] Heart rate monitoring
- [ ] Post-workout summary

## 🎯 Best Practices

1. **Consistency**: Use the same device orientation and size
2. **Quality**: Ensure high-resolution, clear images
3. **Relevance**: Show features that highlight your app's unique value
4. **Diversity**: Include different coaches and workout types
5. **Realism**: Use realistic data and scenarios

## 🔧 Tools for Screenshots

- **iOS Simulator**: Built into Xcode
- **Sketch**: For creating mockups
- **Figma**: For design and prototyping
- **Photoshop**: For image editing and optimization
- **TinyPNG**: For image compression

---

**Next Steps**: Take screenshots of your app's key features and replace the placeholder images in the website for a more authentic and compelling presentation! 