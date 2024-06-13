import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_panda/firestore_services.dart';
import 'package:food_panda/home_screen.dart';
import 'package:food_panda/login.dart';
import 'package:food_panda/usermodel.dart';

class Sign_up extends StatefulWidget {
  Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

TextEditingController userfirstnameController = new TextEditingController();
TextEditingController userlastnameController = new TextEditingController();
TextEditingController usermailController = new TextEditingController();
TextEditingController userpasswordController = new TextEditingController();
TextEditingController userconfirmController = new TextEditingController();
TextEditingController useryearController = new TextEditingController();

class _Sign_upState extends State<Sign_up> {
  bool _isChecked = false;
  DateTime selectedDate = DateTime.now();
  // void initState() {
  //   super.initState();
  //   selectedDate =;
  // }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectedDate)
      setState(() {
        selectedDate = pickedDate;
      });
  }

  Future<void> signup() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: usermailController.text,
              password: userpasswordController.text);
      UserModel newuser = UserModel(
        // followers: [],
        // following: [],
        uid: userCredential.user!.uid,
        firstName: userfirstnameController.text,
        lastName: userlastnameController.text,
        email: usermailController.text,
        dateOfBirth: selectedDate,
        // image: 'Assets/Images/Stars.jpg',
      );
      await FirestoreService().createUser(newuser);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The Password Provided is to weak');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exist for that email');
      }
    } catch (e) {
      print('e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                SizedBox(height: _mediaQuery.size.height * .04),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: _mediaQuery.size.height * .03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFields(
                      controller: userfirstnameController,
                      size: Size(150, 50),
                      text: 'Firstname',
                      icon: Icons.edit,
                    ),
                    TextFields(
                      controller: userlastnameController,
                      size: Size(150, 50),
                      text: 'lastname',
                      icon: Icons.edit,
                    )
                  ],
                ),
                SizedBox(height: _mediaQuery.size.height * .03),
                TextFields(
                  controller: usermailController,
                  size: Size(280, 45),
                  text: 'Email/Phone number',
                  icon: Icons.edit,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFields(
                    controller: userpasswordController,
                    size: Size(280, 45),
                    text: 'Passworrd',
                    icon: Icons.abc,
                  ),
                ),
                TextFields(
                  controller: userconfirmController,
                  size: Size(280, 45),
                  text: 'Confirm Passworrd',
                  icon: Icons.edit,
                ),
                SizedBox(height: _mediaQuery.size.height * .01),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Date of Birth',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: _mediaQuery.size.height * .01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: Text('Select date'),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(180, 50),
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(color: Colors.white))),
                    ),
                    SizedBox(width: _mediaQuery.size.width * .05),
                    // TextFields(
                    //   controller: useryearController,
                    //   size: Size(100, 50),
                    //   text: 'Year',
                    //   icon: Icons.edit,
                    // ),
                  ],
                ),
                SizedBox(height: _mediaQuery.size.height * .01),
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: Text(
                //     'Gender',
                //     style: TextStyle(
                //         fontSize: 18,
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
                SizedBox(height: _mediaQuery.size.height * .02),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Container(
                //       height: _mediaQuery.size.height * .07,
                //       width: _mediaQuery.size.width * .22,
                //       decoration: BoxDecoration(
                //           border: Border.all(color: Colors.white),
                //           borderRadius: BorderRadius.all(Radius.circular(20))),
                //       child: Center(
                //         child: Text(
                //           'Male',
                //           style: TextStyle(fontSize: 17, color: Colors.white),
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: _mediaQuery.size.height * .07,
                //       width: _mediaQuery.size.width * .22,
                //       decoration: BoxDecoration(
                //           border: Border.all(color: Colors.white),
                //           borderRadius: BorderRadius.all(Radius.circular(20))),
                //       child: Center(
                //         child: Text(
                //           'Female',
                //           style: TextStyle(fontSize: 17, color: Colors.white),
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: _mediaQuery.size.height * .07,
                //       width: _mediaQuery.size.width * .22,
                //       decoration: BoxDecoration(
                //           border: Border.all(color: Colors.white),
                //           borderRadius: BorderRadius.all(Radius.circular(20))),
                //       child: Center(
                //         child: Text(
                //           'Other',
                //           style: TextStyle(fontSize: 17, color: Colors.white),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Row(
                  children: [
                    Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        }),
                    RichText(
                      text: TextSpan(
                          text: 'I Agree with ',
                          style: TextStyle(fontSize: 17),
                          children: [
                            TextSpan(
                              text: 'privacy ',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.orange),
                            ),
                            TextSpan(
                              text: 'and ',
                              style: TextStyle(fontSize: 17),
                            ),
                            TextSpan(
                              text: 'policy',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.orange),
                            ),
                          ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_isChecked) {
                        signup();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Please agree to th privacy and policy')));
                      }
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(275, 50),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.orange),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    const Text(
                      'Already have an account ?',
                      style: TextStyle(fontSize: 17, color: Colors.orange),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(fontSize: 17, color: Colors.orange),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class TextFields extends StatelessWidget {
  const TextFields({
    super.key,
    required this.text,
    required this.size,
    required this.icon,
    required this.controller,
  });
  final String text;
  final Size size;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: TextFormField(
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
              icon,
              color: Colors.black,
            ),
            hintText: text,
            hintStyle: TextStyle(color: Colors.black)),
      ),
    );
  }
}
