
🥾 Timberfy
===========

Timberfy is a **Flutter-based mobile application** inspired by Timberland-style footwear.  
It focuses on browsing shoes by category, viewing detailed product information, and interacting with a simple cart and likes system.

This project was built as a **portfolio & learning project**, combining Flutter UI with a **local PostgreSQL database** (no cloud).

---

# 🎉 Timberfy UI Preview

## App Highlights (start)
- Cart
  
  ![cart.png](UI_PICS/screens/other/cart.png)
- Profile
  
  ![profile.png](UI_PICS/screens/other/profile.png)

---

## Onboarding Experience

- Onboarding Slide 1  
  ![onboard_slide1.png](UI_PICS/onboarding%20screens/onboard_slide1.png)
- Onboarding Slide 2  
  ![onboard_slide2.png](UI_PICS/onboarding%20screens/onboard_slide2.png)
- Onboarding Slide 3  
  ![onboard_slide3.png](UI_PICS/onboarding%20screens/onboard_slide3.png)
- Login
  
  ![login.png](UI_PICS/onboarding%20screens/login.png)

---

## Men’s Shoes

- Sneakers  
  ![men_sneakers.png](UI_PICS/screens/men/men_sneakers.png)
- Boots  
  ![men_boots.png](UI_PICS/screens/men/men_boots.png)
- Low Boots  
  ![men_low_boots.png](UI_PICS/screens/men/men_low_boots.png)

---

## Women’s Shoes

- Sneakers  
  ![women_sneakers.png](UI_PICS/screens/women/women_sneakers.png)
- Boots  
  ![women_boots.png](UI_PICS/screens/women/women_boots.png)
- Low Boots  
  ![women_low_boots.png](UI_PICS/screens/women/women_low_boots.png)

---

## Shoe Details

> ⚠️ Note: No images found under `UI_PICS/screens/details/`. Please verify if the details pictures have been added and let me know their exact path. I can update the list once available.

---

## How to Use

- Browse the sneaks and boots for men and women.
- Check your profile or shopping cart anytime.
- Smooth onboarding for easy start!

---

## 📌 Table of Contents
- [✨ Features](#-features)
- [📱 App Preview](#-app-preview)
- [📁 Project Structure](#-project-structure)
- [🗄️ Database Overview](#-database-overview)
- [🧱 Database Schema](#-database-schema)
- [🔗 Entity Relationships](#-entity-relationships)
- [⚙️ Running the Project](#️-running-the-project)
- [📌 Notes](#-notes)
- [👤 Author](#-author)

---

## ✨ Features

- Browse shoes by **gender & category**
- Shoe detail pages with **multiple images**
- Like shoes ❤️
- Add shoes to cart 🛒
- Reusable Flutter UI components
- Local PostgreSQL database (realistic backend flow)
- Clean & scalable folder structure

---

## 📱 App Preview

🎥 **Screen recording will be added after LinkedIn post**

---

## 📁 Project Structure

```
lib/
├── component/
├── configs/
├── models/
├── onboardingScreen/
├── pages/
├── shoeDisplay/
├── shoeTiles/
└── main.dart
````

### 🔹 UI Components
📂 [`lib/component/`](lib/component)
- Bottom navigation bar
- Tabs
- Dropdowns
- Reusable row items

---

### 🔹 App Pages
📂 [`lib/pages/`](lib/pages)
- Homepage
- Shoe details
- Cart
- Profile
- Sign in{comming soon}
- Similar shoes

---

### 🔹 Shoe Categories
📂 [`lib/shoeDisplay/`](lib/shoeDisplay)
- Men & Women boots
- Low boots
- Sneakers

---

## 🗄️ Database Overview

Timberfy uses a **local PostgreSQL database** (no Firebase, no cloud).

📄 SQL schema & seed file:  
➡️ [`database/timberfydb.sql`](database/timberfydb.sql)

> Database config files are intentionally **ignored from Git** for security.

---

## 🧱 Database Schema

### 🟫 shoe
Stores main product info.

| Column | Type |
|------|------|
| shoeid | PK |
| name | text |
| maindescription | text |
| briefdescription | text |
| price | numeric |
| gender | text |
| type | text |

---

### 🟫 shoeimage
Stores multiple images per shoe.

| Column | Type |
|------|------|
| imageid | PK |
| shoeid | FK → shoe.shoeid |
| imagepath | text |

---

### 🟫 cart
Represents cart items.

| Column | Type |
|------|------|
| id | PK |
| shoe_id | int |
| quantity | int |

---

### 🟫 likes
Tracks liked shoes.

| Column | Type |
|------|------|
| shoeid | PK |

---

### 🟫 appuser
Basic demo user table.

| Column | Type |
|------|------|
| userid | PK |
| username | UNIQUE |
| profilepic | text |
| password | text |

---

## 🔗 Entity Relationships

- One **shoe** → many **images**
- Shoes can be:
  - liked
  - added to cart
- Images are loaded via **local asset paths stored in DB**

---

## ⚙️ Running the Project

### 1️⃣ Clone repository
```bash
git clone https://github.com/HusseinAbdow/timberfy.git
cd timberfy
````

---

### 2️⃣ Install Flutter dependencies

```bash
flutter pub get
```

---

### 3️⃣ Setup PostgreSQL database

```bash
createdb timberfydb
psql -d timberfydb -f timberfydb.sql
```

---

## 📌 Notes

* No cloud services used
* Database config files are gitignored
* Project focuses on **UI + data structure**, not production auth
* Built for learning, showcasing, and iteration

---

## 👤 Author

**Hussein Abdow**
Computer Engineering Student – Flutter & Backend focused

🔗 GitHub: [https://github.com/HusseinAbdow](https://github.com/HusseinAbdow)
🔗 LinkedIn:www.linkedin.com/in/husseinabdow

