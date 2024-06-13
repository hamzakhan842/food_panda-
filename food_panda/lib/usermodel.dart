import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  late String uid;
  late String firstName;
  late String lastName;
  late String email;
  late DateTime dateOfBirth;
  // late List followers;
  // late List following;
  // late String image;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dateOfBirth,
    // required this.followers,
    // required this.following,
    // required this.image,
  });

  // Method to convert UserModel to a map (for Firestore)
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      // 'followers': followers,
      // 'following': following,
      // 'image': image,
    };
  }

  // Method to create a UserModel from a map (for Firestore)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
      // followers: List<String>.from(map['followers']),
      // following: List<String>.from(map['following']),
      // image: map['image'],
    );
  }
  String get fullName => '$firstName $lastName';
}

Future<UserModel> fetchUserData(String uid) async {
  try {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return UserModel.fromMap(doc.data() as Map<String, dynamic>);
  } catch (error) {
    throw Exception("Failed to fetch user data: $error");
  }
}




// class UserModel {
//   late String? uid;
//   late String firstName;
//   late String lastName;
//   late String email;
//   late DateTime dateOfBirth;
//   late List followers;
//   late List following;
//   late String inage;

//   UserModel(
//       {this.uid,
//       required this.firstName,
//       required this.lastName,
//       required this.email,
//       required this.dateOfBirth,
//       required this.followers,
//       required this.following});

//   // Method to convert UserModel to a map (for Firestore)
//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'firstName': firstName,
//       'lastName': lastName,
//       'email': email,
//       'dateOfBirth': dateOfBirth.toIso8601String(),
//       'followers': followers,
//       'following': following
//     };
//   }

//   // Method to create a UserModel from a map (for Firestore)
//   factory UserModel.fromMap(Map<String, dynamic> map) {
//     return UserModel(
//       uid: map['uid'],
//       firstName: map['firstName'],
//       lastName: map['lastName'],
//       email: map['email'],
//       dateOfBirth: DateTime.parse(map['dateOfBirth']),
//       followers: map['followers'],
//       following: map['following'],
//     );
//   }
//   String get fullName => '$firstName $lastName';
// }
