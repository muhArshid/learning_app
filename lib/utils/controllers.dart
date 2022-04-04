import 'package:learning_app/Controller/app_controller.dart';
import 'package:learning_app/Controller/auth_controller.dart';
import 'package:learning_app/Controller/cart_controller.dart';
import 'package:learning_app/Controller/course_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

MainController appCtr = MainController.instance;
CourseContoller courseCtr = CourseContoller.instance;
CartController cartController = CartController.instance;

UserController userController = UserController.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseMessaging fcm = FirebaseMessaging.instance;
FirebaseStorage storage = FirebaseStorage.instance;
GoogleSignIn googleSign = GoogleSignIn();
