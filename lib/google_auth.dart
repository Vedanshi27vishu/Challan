import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth{
    static Future<void> signInGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      final Credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await UserRepository.createUser(user,context);
      return await FirebaseAuth.instance
          .signInWithCredential(Credentials)
          .then((value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              ));
             
    } on FirebaseAuthException catch (e) {
      throw ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } on FirebaseException catch (e) {
      throw ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } on PlatformException catch (e) {
      throw ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } on FormatException catch (e) {
      throw ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}