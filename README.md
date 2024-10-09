<h1 align="center" id="title">Hall Help</h1>

<p align="center"><img src="https://github.com/mernaatef28/hallhelp/blob/main/assets/hall%20help.png?raw=true" alt="project-image"></p>


# HallHelp App

## Overview
The HallHelp app is designed to facilitate various operational needs for users in a streamlined and user-friendly interface. Leveraging Firebase Firestore for real-time data management, this app allows users to manage and request resources like mentors and organizers efficiently, it coded to serve the NASA SPC Hurghada operation managements to serve a safe inspiring work environment to the hacathon time . 

## Features
- **User-Friendly Interface**: The app provides an intuitive layout that makes navigation easy for all users.
- **Real-Time Updates**: Utilizing Firestore's real-time capabilities, users can see updates immediately without needing to refresh the app.
- **Resource Management**: Users can view, request, and manage resources such as mentors and organizers through dynamic cards.
- **In-App Web View**: Users can access external resources through an integrated web view for a seamless experience, itegrated with the website made by my colleges  [@victor nisem](https://github.com/VICONISEM) and  [@ThisIsMrIsmail](https://github.com/ThisIsMrIsmail/)
  website link : [NASA SPC Hurghada leaderboard ](https://nasa-space-apps-leaderboard-lilac.vercel.app/) 

## Technology Stack
- **Flutter**: The app is built using Flutter, ensuring a smooth and responsive UI across multiple platforms.
- **Firebase Firestore**: Used for real-time data storage and retrieval, enabling users to interact with data effortlessly.
- **URL Launcher**: This package allows for launching web URLs directly within the app.

## App Structure
### Main Components
1. **OperationScreen**: 
   - Displays a list of available resources.
   - Implements a StreamBuilder to listen for updates from the Firestore `tables` collection.
   - Provides functionality for users to delete their requests.

2. **Widgets**:
   - **OperationCard**: Displays detailed information about the resource requested (e.g., "Organizer" or "Mentor") and includes functionality for deleting requests.
   - **OperationCardIcon**: A simpler version of the operation card, primarily used for resources that don’t require extensive details.

## Demo Video
Check out the usage of the HallHelp app panels in the following video: [HallHelp App Panels Usage](https://github.com/mernaatef28/hallhelp/blob/main/assets/videos/hall%20help%20app%20panels%20usage%20.mp4).

### Navigation
- The app utilizes the Flutter Navigator for smooth transitions between screens and actions.
- A floating action button may be implemented for easy access to request new resources.

## How to Run the App
1. **Clone the Repository**: 
   ```bash
   git clone <repository-url>
   ```
2. **Install Dependencies**: 
   Navigate to the project directory and run:
   ```bash
   flutter pub get
   ```
3. **Set Up Firebase**: 
   Follow the Firebase setup instructions to link your project with Firebase and ensure Firestore is configured.
4. **Run the App**: 
   Use the command below to start the application:
   ```bash
   flutter run
   ```
## Apk file 
### Installation

You can download the APK file for the HallHelp app from the following link:

[Download HallHelp APK](https://drive.google.com/file/d/13V4YsKHj4FwJ-9GePlrLKx-UiN7rvf53/view?usp=drive_link)

### How to Install
1. Click on the link above to download the APK file.
2. Ensure that your device allows installations from unknown sources. You may need to enable this in your device settings.
3. Open the downloaded APK file to install the HallHelp app on your device.




## Contribution
Contributions to enhance the app are welcome! Feel free to fork the repository and submit pull requests. Please adhere to the project's code style and standards.


