<h1 align="center">JawaKode - Flutter Application</h1>

<div align="center">
<url>
  <img src="https://github.com/user-attachments/assets/8c3f46c0-50cd-43bf-b44c-ae6b79e814ef" alt="Institut Teknologi dan Bisnis Bina Sarana Global" width="200"/>
</div>

<div align="center">
Institut Teknologi dan Bisnis Bina Sarana Global <br>
FAKULTAS TEKNOLOGI INFORMASI & KOMUNIKASI 
<br>
https://global.ac.id/
</div>

## Project UAS
- Mata Kuliah : Aplikasi Mobile  
- Kelas : TI 23 SE 1
- Semester : Genap  
- Tahun Akademik : 2025 - 2026  

---

## About The Project

**JawaKode** adalah aplikasi coding guide berbasis mobile yang dikembangkan menggunakan **Flutter**, dirancang untuk membantu pengguna—khususnya pemula—dalam mempelajari pemrograman dari tingkat dasar hingga mahir.

Aplikasi ini menyediakan materi pembelajaran yang terstruktur, mudah dipahami, dan dapat diakses kapan saja. Dengan antarmuka yang sederhana dan modern, JawaKode bertujuan memberikan pengalaman belajar yang nyaman, fokus, dan efektif bagi pengguna yang ingin meningkatkan kemampuan coding mereka secara bertahap.

---

## Key Features

- **Signup & Login** – Sistem autentikasi pengguna
- **Materi Pembelajaran Lengkap** – Membaca seluruh materi coding yang disediakan
- **Mark as Completed** – Tandai materi yang sudah diselesaikan
- **Notifications** – Notifikasi Login
- **Supabase Sync** – Sinkronisasi data pengguna dan progres belajar
- **Dark Mode** – Tema gelap dengan tampilan simple dan minimalis
- **Modern UI/UX** – Desain sederhana, bersih, dan nyaman di mata
- **Simple User Experience** – Alur penggunaan yang mudah dipahami

---

## Screenshots

### Splash Screen
<div align="center">
  <img src="assets/images/ss/splash1.jpg" width="160"/>
  <img src="assets/images/ss/splash2.jpg" width="160"/>
  <img src="assets/images/ss/splash3.jpg" width="160"/>
  <img src="assets/images/ss/splash4.jpg" width="160"/>
</div>

### Login Page
<div align="center">
  <img src="assets/images/ss/login.jpg" width="200"/>
</div>

### Register Page
<div align="center">
  <img src="assets/images/ss/signup.jpg" width="200"/>
</div>

### Dashboard
<div align="center">
  <img src="assets/images/ss/dashboard.jpg" width="200"/>
</div>

### Materi 
<div align="center">
  <img src="assets/images/ss/c++.jpg" width="160"/>
  <img src="assets/images/ss/python.jpg" width="160"/>
  <img src="assets/images/ss/js.jpg" width="160"/>
  <img src="assets/images/ss/java.jpg" width="160"/>
  <img src="assets/images/ss/go.jpg" width="160"/>
  <img src="assets/images/ss/rust.jpg" width="160"/>
</div>

### Materi Done
<div align="center">
  <img src="assets/images/ss/jsselesai.jpg" width="160"/>
  <img src="assets/images/ss/jsselesai2.jpg" width="160"/>
</div>

### Profile Team  
<div align="center">
  <img src="assets/images/ss/dashboardprofile.jpg" width="160"/>
  <img src="assets/images/ss/profilehio.jpg" width="160"/>
  <img src="assets/images/ss/profileihza.jpg" width="160"/>
  <img src="assets/images/ss/profiletusi.jpg" width="160"/>
  <img src="assets/images/ss/profileafnan.jpg" width="160"/>
</div>

### Local Notif After Login
<div align="center">
  <img src="assets/images/ss/localnotif1.jpg" width="160"/>
  <img src="assets/images/ss/localnotif2.jpg" width="160"/>
</div>

### Fcm (Firebase Cloud Messaging)
<div align="center">
  <img src="assets/images/ss/fcm.png" width="160"/> <br/> <br/>
  <img src="assets/images/ss/fcm1.png" width="300"/>
  <img src="assets/images/ss/fcm2.png" width="300"/>
  <img src="assets/images/ss/fcm3.png" width="300"/> <br/> <br/>
  <img src="assets/images/ss/notiffcm.jpg" width="160"/>
  <img src="assets/images/ss/notiffcm2.jpg" width="160"/>
</div>

---

## Demo Video

Lihat video demo aplikasi kami untuk melihat semua fitur dalam aksi!

**[Watch Full Demo on Youtube Short](https://youtu.be/HIUQvjDB0nE)**

---

## Download APK

Download versi terbaru aplikasi JawaKode:

### Latest Release v1.0.0
- [**Download APK (85 MB)**](https://drive.google.com/drive/folders/18rS_tfyqZqqe9O0FQTcQtISAckZiOASX?usp=drive_link)

**Minimum Requirements:**
- Android 6.0 (API level 23) or higher
- ~100MB free storage space

## Built With

- **[Flutter](https://flutter.dev/)** - UI Framework  
- **[Dart](https://dart.dev/)** - Programming Language
- **[Firebase](https://firebase.com/)** - Notification Login
- **[Supabase](https://supabase.com/)** - Backend & Authentication  

---

## Getting Started

### Prerequisites

Pastikan Anda sudah menginstall:
- Flutter SDK (3.16.0 or higher)
- Dart SDK (3.2.0 or higher)
- Android Studio / VS Code
- Git

### Installation

1. Clone repository
```bash
git clone https://github.com/hiofadlikaakbar/uas_flutter_jawa
cd uas_flutter_jawa
```

2. Install dependencies
```bash
flutter pub get
```

3. Setup Firebase
```bash
# Download google-services.json dari Firebase Console
# Place in android/app/
cp path/to/google-services.json android/app/
```

4. Run aplikasi
```bash
flutter run
```

### Build APK

```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# Split APK by ABI
flutter build apk --split-per-abi
```

## 📁 Project Structure

```
lib/
├── main.dart                 # Entry point
|── firebase_optios.dart
|── constants.dart      
├── dashboard/                # Main pages after user login
│   ├── dashboard.dart        
│   └── dashboard_profile.dart              
├── detail/                   # Programming language detail pages
│   ├── C++.dart
│   ├── GO.dart
│   ├── JAVA.dart
│   ├── JS.dart
│   ├── PY.dart
│   └── RUST.dart
├── screens/                  # UI Screens
│   ├── full_profile_turtusi.dart
│   ├── login.dart
│   ├── profile_afnan.dart
│   ├── profile_hio.dart
│   ├── profile_ihza.dart
│   ├── profile_turtusi.dart
│   ├── signup.dart
│   ├── splash_screen.dart
│   ├── splash_screen2.dart
│   ├── splash_screen3.dart
│   └── splash_screen4.dart
├── widgets/                  # Reusable widgets
├── services/                 # Business logic
│   ├── fcm-service.dart
│   └── notification_service.dart
└──────────────────────────────────────────────────
```
## App Structure

<div align="center">
  <img src="assets/images/ss/architectur.png" width="1200"/>
</div>

## Authentication Flow

```
1. Splash Screen (Auto-login check)
   ↓
2. Login Screen / Register Screen
   ↓
3. Home Screen (Dashboard)
   ↓
4. Profile & Settings
```

### Development Workflow

1. Fork repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

---

## Team Members

### Development Team

| NIM | Name | Role | Contributions | Github |
|------|------| ------| ------| ------|
| 1123150077 |**Hio Fadlika Akbar** | Project Lead & Backend Engineer | - Authentication system<br>- Supabase integration<br>- Splash Screen<br>- Database design<br>- Profile screen | https://github.com/hiofadlikaakbar |
| 1123150007 |**Ihza Anasrulloh** | Frontend Developer (UI/UX) | - Splash screen<br>- Login Page<br>- Dashboard Profile<br>- Profile screen<br>- Video Editing | https://github.com/IhzaAnasrulloh |
| 1123150012 |**Muhammad Turtusi Afrizal Perdana** | Frontend Developer | - Dashboard implementation<br>- Profile screen<br>- Materi page development<br>- Splash Screen | https://github.com/CoupDerace |
| 1123150074 |**Afnan Dani Alaudin** | Mobile Developer & Application Tester | - Firebase Cloud Messaging (FCM) integration<br>- Notification <br>- Testing & QA<br>- Profile screen<br>- Splash Screen | https://github.com/afnan923 |

---

## Acknowledgments

- [Flutter Community](https://flutter.dev/community) - For amazing packages
- [Firebase](https://firebase.google.com/) - For notification services
- [Supabase](https://www.flaticon.com/) - For backend services

---

## License

This project is licensed under the MIT License.

---

<div align="center">
  <p>Created by JawaKode Team</p>
  <p>© 2026 JawaKode. All rights reserved.</p>
</div>
