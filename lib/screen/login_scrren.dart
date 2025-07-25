import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  GlobalKey<FormState> globalKey = GlobalKey();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  Future<void> saveLoginData(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Form(
              key: globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Text(
                    'title_login'.tr(),
                    style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'subTitle_login'.tr(),
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'lable_email'.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: controllerEmail,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'message_error_email_isEmpty'.tr();
                      } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'massage_error_email'.tr();
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hint: Text('Albertstevano@gmail.com'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'lable_password'.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: controllerPassword,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'message_error_password'.tr();
                      }
                      return null;
                    },
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hint: Text('**********'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
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
                        'button_forgot'.tr(),
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
                        if (globalKey.currentState!.validate()) {
                          saveLoginData(
                            controllerEmail.text,
                            controllerPassword.text,
                          );
                          context.go('/home');
                        } else {}
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XffFE8C00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'button_login'.tr(),
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
                        'text_with_option'.tr(),
                        style: TextStyle(color: Colors.grey),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 10,
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
                            text: 'text_withRegister'.tr(),
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'button_send_register'.tr(),
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
