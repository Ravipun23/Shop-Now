
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/consts/consts.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //Login Method
  Future<UserCredential?> loginMethod(context) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth
          .signInWithEmailAndPassword(
              email: emailController.text.toString().trim(),
              password: passwordController.text.toString().trim());
    } on FirebaseAuthException catch (error) {
      VxToast.show(context, msg: error.message.toString());
    }
    return userCredential;
  }

//Sign up Method
  Future<UserCredential?> signupMethod(
      String name, String email, String password, context) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      VxToast.show(context, msg: error.message.toString());
    }
    return userCredential;
  }

  //Store method
  storeUserData(name,email,password) async{
    DocumentReference store = fireStore.collection(userCollection).doc(currentUser!.uid);
    store.set({
            'name': name,
            'password': password,
            'email': email,
            'image': " ",
            'id': currentUser!.uid,
            'cartCount': "00",
            'wishlistCount': "00",
            'orderCount': "00",
          });
  }

//Signing out Method
  signOutMethod(context) async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (error) {
      VxToast.show(context, msg: error.message.toString());
    }
  }
}
