# SwipeSaver

## By Andry Rakotonjanabelo
CodePath iOS Course Capstone Project

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview
### Description
SwipeSaver is a monthly budget tracking app that allows users to monitor their income and expenses with a clean, intuitive interface. Users can easily swipe between months, with remaining budget automatically carried over.

### App Evaluation
- **Category:** Finance / Productivity
- **Mobile:** Uses camera for receipt photos, employs swipe gestures for navigation
- **Story:** Helps users visualize and manage their monthly budget in a simple, intuitive way
- **Market:** Anyone looking to track personal finances, particularly appealing to budget-conscious individuals
- **Habit:** Daily/weekly usage for expense tracking, with monthly review of budget performance
- **Scope:** V1 focuses on core budget tracking functionality; potential to expand to include budgeting goals, spending analytics, and export features

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can see their current monthly budget balance
* User can add income entries with date and description
* User can add expense entries with date and description
* User can attach photos to income/expense entries
* User can swipe between months and see budget history
* Budget automatically carries over from month to month
* App persists all data locally

**Optional Nice-to-have Stories**

* User can set monthly budget goals
* User can categorize expenses
* User can see spending analytics/charts
* User can export budget data
* Dark mode support
* Custom themes

### 2. Screen Archetypes

* Budget Overview Screen
   * Shows current month and available budget
   * Displays income and expense sections
   * Allows adding new entries
   
* Add Entry Screen
   * Form to input amount, date, description
   * Option to attach photo
   
* Entry Detail Screen
   * Shows details of a specific income/expense entry
   * Displays attached photo if available
   * Option to edit or delete entry

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Current Month
* (Optional) Statistics
* (Optional) Settings

**Flow Navigation** (Screen to Screen)

* Budget Overview Screen
   * => Add Entry Screen when + button is tapped
   * => Entry Detail Screen when entry is tapped
   * => Previous/Next Month when swiped left/right
   
* Add Entry Screen
   * => Budget Overview Screen when entry is saved
   * => Photo Library/Camera when photo button is tapped
   
* Entry Detail Screen
   * => Budget Overview Screen when back button is pressed
   * => Edit Entry Screen when edit button is tapped

## Wireframes
[Add wireframe images here]

## Schema 

### Models

#### Entry
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | id            | String   | unique ID for the entry |
   | amount        | Double   | amount of money (positive for income, negative for expense) |
   | description   | String   | description of the entry |
   | date          | Date     | date of the entry |
   | photoURL      | String   | local URL to attached photo (if any) |
   | category      | String   | optional category for the entry |
   | month         | Int      | month number (1-12) |
   | year          | Int      | year (e.g., 2025) |

### Networking
- No external API calls in initial version (local storage only)