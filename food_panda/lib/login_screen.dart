// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:food_panda/Apis/firebase_services.dart';
// import 'package:food_panda/home_screen.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class LoginView extends StatelessWidget {
//   LoginView({Key? key}) : super(key: key);

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _emailController = TextEditingController();
//     TextEditingController _passwordController = TextEditingController();

//     return Scaffold(
//         backgroundColor: Colors.blueGrey[50],
//         body: Container(
//           height: double.infinity,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('assets/images/food.jpg'), fit: BoxFit.cover),
//           ),
//           child: Stack(
//             children: [
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(39),
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           width: 150,
//                           height: 150,
//                           child: Icon(Icons.lock),
//                         ),
//                         Container(
//                           height: 50,
//                           width: 50,
//                         ),
//                         // ElevatedButton(style: ButtonStyle(backgroundColor:),
//                         //   onPressed: () async {
//                         //     await _googleSignIn.signOut();
//                         //   },
//                         //   child: const Icon(Icons.logout),
//                         // ),
//                         const SizedBox(height: 1),
//                         const Text(
//                           "Zenchat",
//                           style: TextStyle(
//                             color: Colors.transparent,
//                             fontSize: 15,
//                           ),
//                         ),
//                         const Text(
//                           "Welcome back! You have been missed.",
//                           style: TextStyle(
//                             color: Colors.transparent,
//                             fontSize: 12,
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         // Email
//                         Container(
//                           width: 300,
//                           height: 50,
//                           color: Colors.white,
//                           child: TextFormField(
//                             controller: _emailController,
//                             decoration: const InputDecoration(
//                               hintText: "Email",
//                               hintStyle:
//                                   TextStyle(fontSize: 15, color: Colors.grey),
//                               contentPadding: EdgeInsets.all(10),
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         // Password
//                         Container(
//                           width: 300,
//                           height: 50,
//                           color: Colors.white,
//                           child: TextFormField(
//                             controller: _passwordController,
//                             obscureText: true,
//                             decoration: const InputDecoration(
//                               hintText: "Password",
//                               hintStyle:
//                                   TextStyle(fontSize: 15, color: Colors.grey),
//                               contentPadding: EdgeInsets.all(10),
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         const Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [Text("Forgot Password?")],
//                         ),
//                         const SizedBox(height: 10),
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Home()));
//                           },
//                           // onPressed: () async {
//                           //   await _auth
//                           //       .signInWithEmailAndPassword(
//                           //     email: _emailController.text,
//                           //     password: _passwordController.text,
//                           //   )
//                           //       .then((value) {
//                           //     // Navigate to the next screen upon successful login
//                           //     Navigator.pushReplacement(
//                           //       context,
//                           //       MaterialPageRoute(
//                           //         builder: (context) => const Home(),
//                           //       ),
//                           //     );
//                           //   }).catchError((error) {
//                           //     // Handle login errors
//                           //     print("Error during login: $error");
//                           //   });
//                           // },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.orange,
//                           ),
//                           child: const Center(
//                             child: Text(
//                               'Sign in',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         const Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "---------------------- ",
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 12,
//                               ),
//                             ),
//                             Text(
//                               "Or continue with",
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 15,
//                               ),
//                             ),
//                             Text(
//                               " ----------------------",
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // Login with Google
//                             InkWell(
//                               onTap: () async {
//                                 await FirebaseServices.loginWithGoogle(context);
//                                 // await FirebaseServices.loginWithGoogle(context);
//                                 // FirebaseServices.fCMToken = '';
//                                 // await FirebaseAuth.instance.signOut();
//                                 // await FirebaseServices.gettingFirebaseToken();
//                                 // FirebaseServices.getActiveStatus(true);
//                               },
//                               child: Container(
//                                 width: 80,
//                                 height: 80,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 child: const Padding(
//                                   padding: EdgeInsets.all(15),
//                                   child: Icon(Icons.g_mobiledata),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const Home(),
//                               ),
//                             );
//                           },
//                           child: const Text(
//                             "Register new Account......",
//                             style: TextStyle(
//                               color: Color(0xff8D67F8),
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
