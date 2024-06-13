import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_panda/forget.dart';
import 'package:food_panda/home_screen.dart';
import 'package:food_panda/signin.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _SignIn_ScreenState();
}

class _SignIn_ScreenState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _isChecked = false;

  Future<void> _signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailcontroller.text, password: _passwordcontroller.text);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseException catch (e) {
      print(e.message);
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Login Failed'),
                content: Text(e.message!),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text('Okay'))
                ],
              ));
    } catch (e) {
      print(e.toString());
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Login Failed'),
                content: Text('An Unexpected error ! Please try again'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text('Okay'))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/food.jpg'), fit: BoxFit.cover)
            // gradient: LinearGradient(colors: [
            //   Color.fromARGB(255, 105, 79, 201),
            //   Color.fromARGB(255, 212, 176, 235),
            //   Color(0xffdbd5e0),
            // ], begin: FractionalOffset(1.0, .02), end: FractionalOffset(1, 0.8)),
            ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: _mediaQuery.size.height * .05),
              const Text('Food Cusine',
                  style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'Water',
                      color: Colors.transparent)),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                    SizedBox(height: _mediaQuery.size.height * .03),
                    Center(
                      child: TextformField(
                        controller: _emailcontroller,
                        text: 'Email/phone number',
                      ),
                    ),
                    SizedBox(height: _mediaQuery.size.height * .02),
                    Center(
                      child: TextformField(
                        controller: _passwordcontroller,
                        text: 'Password',
                      ),
                    ),
                    SizedBox(height: _mediaQuery.size.height * .04),
                    Row(
                      children: [
                        Checkbox(
                            value: _isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            }),
                        const Text(
                          'Remember me',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(width: _mediaQuery.size.width * .08),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => forget(),
                                ));
                          },
                          child: const Text(
                            'Forget Password',
                            style:
                                TextStyle(fontSize: 16, color: Colors.orange),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: _mediaQuery.size.height * .02),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _signIn();
                        },
                        child: const Text(
                          'Signin',
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(275, 50),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.orange),
                      ),
                    ),
                    SizedBox(height: _mediaQuery.size.height * .02),
                    Center(
                      child: const Text(
                        'or signin with',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: _mediaQuery.size.height * .01),
                    Other_Logins(mediaQuery: _mediaQuery),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            'Dont have an account',
                            style:
                                TextStyle(fontSize: 17, color: Colors.orange),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Sign_up(),
                                  ));
                            },
                            child: const Text(
                              'Sign up',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.orange),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextformField extends StatelessWidget {
  const TextformField({
    super.key,
    required this.text,
    required this.controller,
  });
  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.black,
          constraints: BoxConstraints(maxWidth: 282, maxHeight: 50),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
          suffixIcon: Icon(
            Icons.remove_red_eye,
            color: Colors.black,
          ),
          hintText: text,
          hintStyle: TextStyle(color: Colors.black)),
    );
  }
}

class Other_Logins extends StatelessWidget {
  const Other_Logins({
    super.key,
    required MediaQueryData mediaQuery,
  }) : _mediaQuery = mediaQuery;

  final MediaQueryData _mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  image: AssetImage('Assets/Images/2.jpeg'),
                  fit: BoxFit.cover)),
        ),
        SizedBox(width: _mediaQuery.size.width * .02),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  image: AssetImage('Assets/Images/2.jpeg'),
                  fit: BoxFit.cover)),
        ),
        SizedBox(width: _mediaQuery.size.width * .02),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  image: AssetImage('Assets/Images/2.jpeg'),
                  fit: BoxFit.cover)),
        )
      ],
    );
  }
}
