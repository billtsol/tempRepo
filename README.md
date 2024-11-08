# flutter_interview1

# Step 1
Create a Firebase Project and Configure Firebase with Flutter App

    - Download the google-services.json file and place it in the android/app directory.
    
    - Enable Email/Password Authentication in the Firebase console.
    
    - Add Firebase packages to pubspec.yaml. (The pubspec.yaml file is a configuration file used in Flutter and Dart projects to manage dependencies, metadata, and project settings)
    
    - Run flutter pub get to install the packages.

# Step 2
Create the Login Page

    - Create a class that manages the state of the login and registration page.
    
    - Created an app on Firebase.
    
    - Downloaded the Firebase CLI.
    
    - Logged into Firebase with my account using firebase login.
    
    - Installed FlutterFire.
    
    - Ran flutterfire configure.
    
    - Changed the applicationId in the build.gradle file to match the one in Firebase.

# Step 3
Create the Home Page

    - Create a new Dart file
    
    - Created three different labels for name, email, and password.
    
    - Added basic validation checks.
    
    - Created two buttons for login and register.
    
    - Retrieved the data entered by the user and sent it to Firebase Authentication, depending on the action selected (login or register).
