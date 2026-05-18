# 🍳 Recipe Manager Pro (App 1)
### *State Management with Provider & HTTP*

A Flutter application built using **Provider for state management** and **HTTP for networking**, integrated with **TheMealDB API**.  
This app focuses on simplicity, fast development, and reactive UI updates using Provider’s lightweight architecture.

---

## 📸 Screenshots & UI

### 🏠 Home & Recipe Discovery
The home screen provides a smooth browsing experience with:
- Search functionality
- Category-based filtering (chips)
- Featured meals section
- Add meals page

<p float="left">
  <img src="screenshots/Screenshot 2026-05-18 184951.png" width="200"/>
  <img src="screenshots/Screenshot 2026-05-18 185005.png" width="200"/>
  <img src="screenshots/Screenshot 2026-05-18 185048.png" width="200"/>
  <img src="screenshots/Screenshot 2026-05-18 185111.png" width="200"/>
  <img src="screenshots/Screenshot 2026-05-18 193736.png" width="200"/>
</p>

---

### 🔍 Search Functionality
Users can instantly search recipes by name or ingredient. Results update in real time using Provider’s reactive listeners.

---

### ❤️ Favorites System
Users can add/remove meals from favorites. The state is shared across screens using **Provider**, ensuring instant UI synchronization.

<p float="left">
  <img src="screenshots/Screenshot 2026-05-18 185136.png" width="200"/>
</p>

---

### 📅 Meal Planner Feature
Plan meals for different days of the week using a simple CRUD-based planner system managed by `MealPlanProvider`.

<p float="left">
  <img src="screenshots/Screenshot 2026-05-18 185242.png" width="200"/>
  <img src="screenshots/Screenshot 2026-05-18 185315.png" width="200"/>
</p>

---

### ⚙️ Settings & Configuration
The Settings screen provides app information and user preferences management.

<p float="left">
  <img src="screenshots/Screenshot 2026-05-18 185303.png" width="200"/>
</p>

---

## 🛠️ Tech Stack

- **State Management:** Provider  
- **Networking:** HTTP  
- **API:** TheMealDB → https://www.themealdb.com/api.php  
- **Language:** Dart  
- **Framework:** Flutter  

---

## 🚀 Key Features

- 🔍 Real-time recipe search  
- 🍽️ Category-based browsing (All, Breakfast, Dessert, etc.)  
- ❤️ Favorites system with instant updates  
- 📅 Simple meal planner (local state CRUD)  
- ⚡ Fast API integration using HTTP  
- 📱 Clean and responsive UI design  

---

## 🏗️ Project Structure
```text
ib/
├── models/
│ └── meal_model.dart
│
├── providers/
│ ├── meal_provider.dart
│ └── meal_plan_provider.dart
│
├── screens/
│ ├── main_screen.dart
│ ├── home_screen.dart
│ ├── favorites_screen.dart
│ ├── meal_plan_screen.dart
│ ├── meal_detail_screen.dart
│ ├── add_meal_screen.dart
│ ├── add_meal_plan_screen.dart
│ └── settings_screen.dart
│
├── services/
│ └── api_service.dart
│
├── widgets/
│ ├── category_chip.dart
│ ├── search_bar_widget.dart
│ ├── meal_card.dart
│ ├── featured_banner.dart
│ └── custom_bottom_navbar.dart
│
└── main.dart
 ```

---

## 🚀 How to Run

```bash
# 1. Clone repository
git clone https://github.com/Nanat-21/recipe-explorer-provider.git

# 2. Navigate to project
cd recipe-explorer-provider

# 3. Install dependencies
flutter pub get

# 4. Run app
flutter run

🔮 Future Improvements
Offline storage (Hive / SQLite)
Dark mode support
Nutrition tracking
User authentication
Cloud sync for meal plans
👨‍💻 Author

Developed by Nanat Abeshu
