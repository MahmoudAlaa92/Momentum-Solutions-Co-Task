# 🎬 iOS Movie Listing App

A lightweight and elegant iOS application built to list the top 2025 movies using [TheMovieDB API](https://www.themoviedb.org). This app demonstrates the use of modern iOS development practices including **MVVM architecture**, **Combine**, **Alamofire networking**, **image caching**, and **clean code principles**.

---

## 📱 Features

### 🔹 Movie List Screen
- Scrollable list of top 2025 movies
- Each item includes:
  - Poster (thumbnail)
  - Title
  - Rating
  - Release Date
  - Toggleable Favorite Button
- Tap to view detailed movie info

### 🔹 Movie Details Screen
- Poster Image
- Title
- Rating
- Release Date
- Overview
- Vote Average
- Original Language
- Toggle Favorite / Unfavorite (syncs with list)

---

## 🧱 Architecture & Design

| Layer        | Tools / Patterns Used         |
|--------------|-------------------------------|
| **Architecture** | MVVM (Model-View-ViewModel) |
| **UI**           | UIKit + Compositional Layout (No Storyboard) |
| **Views**        | Built with `xib` / `nib` files only |
| **Navigation**   | Coordinator Pattern |
| **Business Logic** | Strategy Pattern |
| **Networking**  | Alamofire (via custom Network Layer) |
| **Reactive Programming** | Combine |
| **Image Caching** | Kingfisher |
| **Caching**     | Local caching for offline access |
| **Persistence** | Favorite status stored locally |
| **Principles**  | SOLID + Clean Code + OOP |

---

## 💎 Highlights

- 🚀 **Smooth navigation** using Coordinator
- 🧠 **Strategy pattern** for flexible favorite handling
- 🧹 **Clean and scalable** MVVM separation
- 📡 **Combine-powered** reactive bindings and networking
- 🧊 **Kingfisher** for lightweight image caching
- 🔒 **Persistent favorite toggle** stored across sessions
- 📶 **Offline support** via caching on first launch
- 🧪 Prepared for **unit testing** (bonus ready)

---

## 📦 Dependencies

| Library     | Use Case                          |
|-------------|-----------------------------------|
| **Alamofire**   | Networking requests             |
| **Kingfisher**  | Image caching                   |
| **Combine**     | Reactive bindings and publishers |

Installed via [Swift Package Manager (SPM)] — No CocoaPods used.

---

## 🛠 How to Run

1. Clone the repository  
   `git clone https://github.com/your-username/movie-listing-app.git`

2. Open the `.xcodeproj` file

3. Set your **TheMovieDB API Key** in the `Secrets.swift` file  
   ```swift
   struct Secrets {
       static let tmdbAPIKey = "YOUR_API_KEY_HERE"
   }

<img width="410" height="800" alt="Screenshot 2025-07-23 at 8 02 31 PM" src="https://github.com/user-attachments/assets/52396d13-9fe5-4786-9847-ef45f56c59da" />

<img width="410" height="800" alt="Screenshot 2025-07-23 at 8 02 15 PM" src="https://github.com/user-attachments/assets/e4d3624a-e2e2-4408-afb8-5f85c753388e" />

