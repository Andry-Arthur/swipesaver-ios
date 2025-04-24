# 💸 SwipeSaver

## By Andry Rakotonjanabelo  
📱 CodePath iOS Course Capstone Project

## 📋 Table of Contents
1. [Overview](#overview)
2. [Product Spec](#product-spec)
3. [Wireframes](#wireframes)
4. [Schema](#schema)

---

## 🧭 Overview

### Description
SwipeSaver is a monthly budget tracking app that allows users to monitor their income and expenses with a clean, intuitive interface. Users can easily swipe between months, with remaining budget automatically carried over.

### App Evaluation
- **Category:** Finance / Productivity
- **Mobile:** Uses camera for receipt photos, employs swipe gestures for navigation 📷⬅️➡️
- **Story:** Helps users visualize and manage their monthly budget in a simple, intuitive way
- **Market:** Anyone looking to track personal finances, particularly appealing to budget-conscious individuals
- **Habit:** Daily/weekly usage for expense tracking, with monthly review of budget performance 📅
- **Scope:** V1 focuses on core budget tracking functionality; potential to expand to include budgeting goals, spending analytics, and export features

---

## 🛠 Product Spec

### 1. User Stories

#### ✅ Required Must-have Stories
- User can see their current monthly budget balance 💰
- User can add income entries with date and description
- User can add expense entries with date and description
- User can attach photos to income/expense entries 📎
- User can swipe between months and see budget history
- Budget automatically carries over from month to month
- App persists all data locally 💾

#### ⭐ Optional Nice-to-have Stories
- User can set monthly budget goals 🎯
- User can categorize expenses 🗂
- User can see spending analytics/charts 📊
- User can export budget data 📤
- Dark mode support 🌙
- Custom themes 🎨

### 2. Screen Archetypes
- **Budget Overview Screen**
  - Shows current month and available budget
  - Displays income and expense sections
  - Allows adding new entries ➕
- **Add Entry Screen**
  - Form to input amount, date, description
  - Option to attach photo 📷
- **Entry Detail Screen**
  - Shows details of a specific income/expense entry
  - Displays attached photo if available
  - Option to edit or delete entry ✏️🗑

### 3. Navigation

#### Tab Navigation
- Current Month 🗓
- (Optional) Statistics 📈
- (Optional) Settings ⚙️

#### Flow Navigation
- Budget Overview Screen  
  → Add Entry Screen when "+" is tapped  
  → Entry Detail Screen when entry is tapped  
  → Swipe left/right to switch months  
- Add Entry Screen  
  → Budget Overview when saved  
  → Photo Library/Camera for image attachment  
- Entry Detail Screen  
  → Budget Overview  
  → Edit Entry Screen

---

## 🖼 Wireframes

### Add Entry Screen  
<img src="./SwipeSaver%20Add%20Entry%20WF.png" alt="Add Entry Wireframe" width="300"/>

### Budget Overview Screen  
<img src="./SwipeSaver%20Main%20Budget%20WF.png" alt="Main Budget Wireframe" width="300"/>

### Entry Detail Screen  
<img src="./SwipeSaver%20Entry%20Detail%20WF.png" alt="Entry Detail Wireframe" width="300"/>

---

## 🧱 Schema

### Models

#### Entry
| Property    | Type    | Description                                      |
|-------------|---------|--------------------------------------------------|
| id          | String  | Unique ID for the entry                          |
| amount      | Double  | Amount of money (positive = income, negative = expense) |
| description | String  | Description of the entry                         |
| date        | Date    | Date of the entry 📆                             |
| photoURL    | String  | Local path to the attached image (if any)        |
| category    | String  | Optional category (e.g., Food, Transport) 🍕🚗     |
| month       | Int     | Month number (1-12)                              |
| year        | Int     | Year (e.g., 2025)                                |

---

### Networking
- No external API calls (V1 is offline/local storage only) 📴
