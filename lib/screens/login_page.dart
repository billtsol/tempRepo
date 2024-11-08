import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';

// Define LoginPage as a stateful widget to manage user interactions and authentication state
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

// _LoginPageState manages the state of the login and registration page
class _LoginPageState extends State<LoginPage> {
  // Form key to validate form inputs
  final _formKey = GlobalKey<FormState>();

  // Controllers for text input fields (Full name, Email, and Password)
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Firebase Authentication instance for login and registration
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Flag to switch between login and registration mode
  bool _isLogin = true;

  // Method to handle authentication (login or registration)
  Future<void> _authenticate() async {
    // Validate the form; if any field is invalid, return early
    if (!_formKey.currentState!.validate()) return;

    try {
      if (_isLogin) {
        // Login existing user
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        
        // Navigate to the HomePage after successful login
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomePage(user: userCredential.user)),
        );
      } else {
        // Register a new user
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Update the new user's display name with the Full name provided
        await userCredential.user!.updateDisplayName(_fullNameController.text);

        // Navigate to the HomePage after successful registration
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomePage(user: userCredential.user, displayName: _fullNameController.text)),
        );
      }
    } catch (error) {
       // Only show the error message if the widget is still mounted
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isLogin ? 'Login' : 'Register')),
      body: Padding( // The Padding widget in Flutter adds space around its child widget.
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column( // The Column widget in Flutter is a layout widget that arranges its child widgets in a vertical direction (from top to bottom).
            children: [
              // Full Name field, shown only when registering a new account
              if (!_isLogin)
                TextFormField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  validator: (value) => value!.isEmpty ? 'Enter your full name' : null, // Simple validation to ensure the field is not empty
                ),
              // Email field, common for both login and registration
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.contains('@') ? null : 'Enter a valid email', // Validate email format
              ),
              // Password field, common for both login and registration
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'), // Use 'const' with the constructor to improve performance. suggested by dart analyzer
                obscureText: true,
                validator: (value) => value!.length >= 6 ? null : 'Password must be at least 6 characters',
              ),
              const SizedBox(height: 20),
              // Button to submit the form (login or register based on _isLogin flag)
              ElevatedButton( // The ElevatedButton widget in Flutter is a material design button that elevates when pressed.
                onPressed: _authenticate,
                child: Text(_isLogin ? 'Login' : 'Register'),
              ),
              // Button to toggle between login and registration modes
              TextButton( // The TextButton widget in Flutter is a simple button widget that wraps a Text widget.
                onPressed: () => setState(() => _isLogin = !_isLogin),
                child: Text(_isLogin ? 'Create new account' : 'I already have an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
