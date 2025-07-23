import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text(
                  'Login to your\naccount.',
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Please sign in to your account',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 40),
                Text(
                  'Email Address',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hint: Text('Albertstevano@gmail.com'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text('Password', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                TextField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hint: Text('**********'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(color: Color(0XffFE8C00)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XffFE8C00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      "Or sign in with",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 10, // مسافة من النص
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialIcon('assets/images/google.jpg'),
                    SizedBox(width: 20),
                    socialIcon('assets/images/faesback.jpg'),
                    SizedBox(width: 20),
                    socialIcon('assets/images/appel.jpg'),
                  ],
                ),
                SizedBox(height: 30),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: GestureDetector(
                      onTap: () {
                        context.go('/register');
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Register",
                              style: TextStyle(color: Color(0XffFE8C00)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget socialIcon(String imagePath) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Image.asset(imagePath, width: 28, height: 28, fit: BoxFit.contain),
    );
  }
}
