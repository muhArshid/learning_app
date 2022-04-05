import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learning_app/Models/user_res.dart';
import 'package:learning_app/Views/Screens/Auth/choose_auth.dart';
import 'package:learning_app/Views/Screens/Home/main_home_holder.dart';
import 'package:learning_app/utils/controllers.dart';
import 'package:email_auth/email_auth.dart';
import 'package:otp_text_field/otp_field.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  late Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;
  String usersCollection = "users";
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController otp = TextEditingController();
  OtpFieldController otpController = OtpFieldController();

  Rx<UserModel> userModel = UserModel().obs;
  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => (AuthScreen()));
    } else {
      userModel.bindStream(listenToUser());
      Get.offAll(() => MainHomeHolder(
            currentIndex: 0,
          ));
    }
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(usersCollection)
      .doc(firebaseUser.value!.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));

  Future<bool> signIn() async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      print(userCredential);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return false;
      } else if (e.code == 'wrong-password') {
        return false;
      }
      return false;
    }
  }

  updateUserData(Map<String, dynamic> data) {
    firebaseFirestore
        .collection(usersCollection)
        .doc(firebaseUser.value!.uid)
        .update(data);
  }

  Future<bool> checkIfEmailInUse(String emailAddress) async {
    try {
      final list =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);

      if (list.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return true;
    }
  }

  Future<bool> signUp() async {
    //   showLoading();
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        _addUserToFirestore(_userId);
        _clearControllers();
      });
      return true;
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Sign_Up_Failed'.tr, e.toString());
      Get.back();
      return false;
    }
  }

  //Facebook
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;
  void checkIfisLoggedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;

    if (accessToken != null) {
      print(accessToken.toJson());
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;

      _userData = userData;
    } else {
      login();
    }
  }

  void login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;

      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      auth.signInWithCredential(facebookAuthCredential);
      String _userId = result.accessToken!.userId;
      name.text = userData['name'];
      email.text = userData['email'];
      _addUserToFirestore(_userId);
    } else {
      print(result.status);
      print(result.message);
    }

    _checking = false;
  }

  void signOut() async {
    await auth.signOut();

    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    // setState(() {});
    Get.offAll(AuthScreen());
  }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth
            .signInWithCredential(credential)
            .catchError((onErr) => print(onErr));
      }
    } catch (e) {
      Get.snackbar(
        'Error'.tr,
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  EmailAuth emailAuth = new EmailAuth(sessionName: "Sample session");
  Future<bool> sendOtp() async {
    bool result =
        await emailAuth.sendOtp(recipientMail: email.value.text, otpLength: 5);
    return result;
  }

  bool verify() {
    print(emailAuth.validateOtp(
        recipientMail: email.value.text, userOtp: otp.value.text));
    return true;
  }

  Future<void> resetPassword(String passWord) async {
    auth.currentUser!.updatePassword(passWord);
    {}
  }

  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "name": name.text.trim(),
      "id": userId,
      "email": email.text.trim(),
      "country": country.text.trim(),
      "phone": phone.text.trim(),
      "cart": [],
    });
  }
}
