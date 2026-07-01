# Digital License - Installation & Setup Guide

## 📱 How to Get This App on Your Phone

### **Option 1: Android (Easiest)**

#### **Step 1: Install Flutter**
```bash
# Download Flutter SDK from https://flutter.dev/docs/get-started/install
# Extract it and add to PATH
```

#### **Step 2: Clone & Setup**
```bash
git clone https://github.com/Datwigga/Vicroad-digital-license-.git
cd Vicroad-digital-license-
flutter pub get
```

#### **Step 3: Connect Your Phone**
- Enable USB Debugging on your Android phone (Settings > Developer Options > USB Debugging)
- Connect phone via USB cable
- Verify connection:
```bash
flutter devices
```

#### **Step 4: Run the App**
```bash
flutter run
```

✅ App launches automatically!

---

### **Option 2: iOS (Mac Required)**

```bash
# Same setup as Android, but:
flutter run -d <device_id>

# Or use Xcode:
open ios/Runner.xcworkspace
# Then press play in Xcode
```

---

### **Option 3: Build APK (Android Standalone)**

#### **Without Installing Flutter:**
1. Download the APK file directly from GitHub Releases
2. Transfer to phone
3. Open file manager on phone
4. Tap APK file
5. Allow installation from unknown sources if prompted
6. Install ✅

#### **Build Your Own APK:**
```bash
flutter build apk --release
# APK created at: build/app/outputs/flutter-apk/app-release.apk
```

Then transfer to phone and install.

---

### **Option 4: iOS (Build IPA)**

```bash
flutter build ios --release
# IPA created at: build/ios/iphoneos/Runner.app
```

Use TestFlight or XCode to install on phone.

---

## 🚀 Quick Start After Installation

### **Login Credentials**
- **Invite Code:** `521vic125`
- **Password:** `demo123`

### **Features to Try**
1. **Tap License Card** - Flip animation
2. **Toggle Privacy Mode** - Blur effect
3. **Search Vehicles** - By registration plate
4. **QR Code** - Auto-refreshes every 30 seconds

---

## 🛠 System Requirements

| Platform | Requirement |
|----------|-------------|
| **Android** | Android 6.0+ (API 21+) |
| **iOS** | iOS 11.0+ |
| **Flutter** | Flutter 3.0+ |
| **Dart** | Dart 3.0+ |

---

## 📥 Download Options

### **GitHub (Direct Clone)**
```bash
git clone https://github.com/Datwigga/Vicroad-digital-license-.git
```

### **GitHub Release APK**
- Go to Releases page
- Download `app-release.apk`
- Transfer to Android phone
- Install

### **Via Flutter (Recommended)**
```bash
flutter pub global activate digital_license
```

---

## 🆘 Troubleshooting

### **"flutter: command not found"**
- Add Flutter to PATH: https://flutter.dev/docs/get-started/install

### **"No devices found"**
```bash
flutter doctor  # Check installation
adb devices     # Check Android connection
```

### **Build Errors**
```bash
flutter clean
flutter pub get
flutter run
```

### **Permission Denied on Linux**
```bash
chmod +x ~/flutter/bin/flutter
```

---

## 📞 Support

For issues:
- Check GitHub Issues: https://github.com/Datwigga/Vicroad-digital-license-/issues
- Run `flutter doctor` for diagnostics
- Enable verbose logging: `flutter run -v`

---

**Ready? Start with Option 1 (Android) - fastest way to get the app running!** 🚀
