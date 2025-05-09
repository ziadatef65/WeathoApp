# Weather App 🌦️

## 📌 Overview
Weather App هو تطبيق يعرض حالة الطقس للمستخدمين بناءً على الموقع الجغرافي أو البحث اليدوي. يستخدم التطبيق **Flutter** مع **Bloc** لإدارة الحالة و **API** لجلب بيانات الطقس من الإنترنت.

---

## 📷 Screenshots
| الشاشة الرئيسية | البحث عن مدينة | تفاصيل الطقس |
|:---:|:---:|:---:|
| ![Home Screen](assets/screenshots/home.png) | ![Search Screen](assets/screenshots/search.png) | ![Weather Details](assets/screenshots/details.png) |

---

## 🔥 Features
✅ عرض الطقس الحالي بناءً على الموقع الجغرافي للمستخدم.  
✅ البحث عن الطقس في أي مدينة حول العالم.  
✅ عرض تفاصيل الطقس مثل درجة الحرارة، سرعة الرياح، والرطوبة.  
✅ دعم للوضع الليلي والنهاري بناءً على توقيت الجهاز.  
✅ تصميم جميل وسهل الاستخدام.  

---

## 🛠️ Technologies Used
- **Flutter** 🐦 (إطار العمل الأساسي)
- **Bloc** (إدارة الحالة)
- **Dio** (للتعامل مع API)
- **Shared Preferences** (لتخزين البيانات محليًا)

---

## 🚀 Installation
### 1️⃣ Clone the repository
```bash
git clone https://github.com/your-username/weather-app.git
cd weather-app
```

### 2️⃣ Install dependencies
```bash
flutter pub get
```

### 3️⃣ Run the app
```bash
flutter run
```

---

## 🔧 API Configuration
يستخدم التطبيق API لجلب بيانات الطقس. تحتاج إلى الحصول على مفتاح API من [OpenWeatherMap](https://openweathermap.org/) ثم إضافته إلى ملف **.env** في جذر المشروع:

```env
API_KEY=your_api_key_here
```

ثم أضف الدعم له في ملف `pubspec.yaml`:
```yaml
dependencies:
  flutter_dotenv: ^5.0.2
```
واستدعِ `dotenv` في `main.dart`:
```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';
void main() async {
  await dotenv.load();
  runApp(MyApp());
}
```

---

## 📂 Project Structure
```
📦 weather_app
├── 📂 assets        # يحتوي على الصور والأيقونات
├── 📂 lib           # المجلد الأساسي للكود
│   ├── 📂 modules  # يحتوي على الشاشات والـ Bloc
│   ├── 📂 widgets  # يحتوي على المكونات القابلة لإعادة الاستخدام
│   ├── main.dart   # نقطة البداية للتطبيق
├── 📄 pubspec.yaml  # يحتوي على جميع المكتبات المستخدمة
```



إذا كنت ترغب في المساهمة في تطوير التطبيق، يُرجى اتباع الخطوات التالية:
1. **Fork** المستودع.
2. أنشئ فرعًا جديدًا: `git checkout -b feature-branch`.
3. قم بعمل تغييراتك ثم التزم بها: `git commit -m 'Add new feature'`.
4. ادفع التغييرات إلى GitHub: `git push origin feature-branch`.
5. افتح **Pull Request** لمراجعة التعديلات ودمجها.


⭐ إذا أعجبك المشروع، لا تنسَ إعطاءه **Star** على GitHub! 🚀

