# FlagChallenge

A SwiftUI-based mobile application designed to test your knowledge of country flags. Built using the MVVM architectural pattern for clean code separation and easy maintainability.  

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Technologies](#technologies)
- [Contributing](#contributing)
- [License](#license)

---

## Introduction
**FlagChallenge** is a simple quiz game that presents users with a country’s flag and multiple-choice answers. Users select the correct country name to progress. After several rounds, a result screen displays how many correct and incorrect answers were given.

This project demonstrates:
- MVVM architecture in SwiftUI
- Reactive data flow with Combine
- JSON data loading and parsing
- Animation with Lottie

---

## Features
- **Multiple Rounds**: By default, the game offers 5 rounds to guess flags.
- **Randomized Questions**: Flags and their corresponding options are randomly presented.
- **Score Tracking**: Keeps track of correct and incorrect answers in real-time.
- **Result Screen**: Shows a summary of your performance after all rounds.
- **Lottie Animation**: A fun animated welcome screen.

---

## Requirements
- **Xcode** 14 or higher
- **iOS** 16.0+ as the deployment target
- **Swift** 5.7 or higher
- **Swift Package Manager** for dependency management (Lottie)

---

## Installation
1. **Clone the repository**:
   ```bash
   git clone https://github.com/artym125/FlagChallenge.git
   ```
2. **Open the project** in Xcode:
   ```bash
   cd FlagChallenge
   open FlagChallenge.xcodeproj
   ```
3. **Install dependencies**:
   - Xcode will automatically fetch the Swift Package for Lottie (version 4.5.1 or specified) upon opening the project.

---

## Usage
1. **Run the app** on a simulator or physical device from Xcode.
2. **Welcome Screen**: You’ll see an animated Lottie view and a “Start Game” button.
3. **Quiz Rounds**:
   - Each round shows a flag (using emoji or any chosen representation).
   - Select the correct country name among the presented options.
4. **Score Tracking**: The app will display a short message (correct or incorrect).
5. **Game Results**: After 5 rounds, a result screen displays your correct/incorrect score and an option to restart.

---

## Project Structure

```
FlagChallenge/
├── App
│   ├── FlagChallengeApp.swift    // Main entry point of the SwiftUI app
│   ├── RootView.swift            // Root container for the main view hierarchy
│
├── Features
│   └── Main
│       ├── Model
│       │   └── Country.swift     // Country data model
│       ├── ViewModel
│       │   ├── GameVMProtocol.swift  // Protocol defining ViewModel requirements
│       │   └── GameVM.swift          // Main game logic and state management
│       └── Views
│           ├── GameQuestionView.swift  // View for displaying flag questions
│           ├── GameResultView.swift    // View showing final game results
│           ├── MainView.swift          // Primary view managing the game flow
│           └── WelcomeScreenView.swift // Welcome screen with animation
│
├── Preview Content
│   └── Preview Assets.xcassets  // Assets for SwiftUI previews
│
├── Resources
│   ├── Data
│   │   └── countries.json       // JSON file containing country data
│   ├── LottieFiles
│   │   └── CountryAnimation.json // Lottie animation file
│   └── Assets.xcassets          // Image assets for the app
│
├── Shared
│   ├── Components
│   │   └── LottieView.swift      // Reusable Lottie animation component
│   ├── Config
│   │   └── GameConfig.swift      // Configuration settings for the game
│   ├── Constants
│   │   ├── GameResultScreenConstants.swift  // Constants for result screen text
│   │   ├── GameScreenConstants.swift        // Constants for game screen text
│   │   └── WelcomeScreenConstants.swift     // Constants for welcome screen text
│   ├── Extensions
│   │   └── ExtView+PrimaryButtonStyle.swift // View extensions and button styling
│   └── Helpers
│       └── AnimatedPrimaryButtonStyle.swift // Custom button style helper
│
└── Package Dependencies
    └── Lottie 4.5.1  // External dependency for animations

```

### Highlights
- **MVVM**: The `ViewModel` layer handles the game logic and state, while `Views` focus solely on UI.
- **Separation of Concerns**: Models for data, ViewModels for business logic, and Views for UI.
- **Resources**: Contains JSON data and Lottie animations.
- **Shared**: Houses common components, configs, constants, and helpers.

---

## Technologies
- **SwiftUI** – Declarative UI framework for building iOS apps.
- **Combine** – For reactive state updates in the ViewModel.
- **Lottie** – Used to display engaging animations.
- **Swift Package Manager** – Dependency management for Lottie.

---

## Contributing
Contributions are welcome!  
1. **Fork** the repository  
2. **Create a feature branch**:  
   ```bash
   git checkout -b feature/AmazingNewFeature
   ```
3. **Commit your changes**:  
   ```bash
   git commit -m "[Feature] Implement new feature"
   ```
4. **Push to the branch**:  
   ```bash
   git push origin feature/AmazingNewFeature
   ```
5. **Open a Pull Request** on GitHub

---

## License
This project is licensed under the [MIT License](LICENSE). Feel free to modify and distribute this project as you see fit.

---

**Enjoy playing FlagChallenge!** If you have any questions, suggestions, or issues, please open an [issue](https://github.com/artym125/FlagChallenge/issues) or submit a pull request. Have fun learning about flags from around the world!
