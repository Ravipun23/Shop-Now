
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_now/consts/consts.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController{
  var profileImagePath = ''.obs;
  var editNameController = TextEditingController();
  var editPasswordController = TextEditingController();

  var profileImageLink = '';
  var isLoading = false.obs;

  changeImage(context)async{
    try{
    final image = await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 70);
      if(image == null){
        return;
      }else{
        profileImagePath.value = image.path;
      }
    }on PlatformException catch(e){
      VxToast.show(context, msg: "No Image is Selected");
    }
  }

  uploadImage()async{
    var fileName = basename(profileImagePath.value);
    var destination = "images/${currentUser!.uid}/$fileName";
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await  ref.putFile(File(profileImagePath.value));
    profileImageLink =  await ref.getDownloadURL();
  }

  updateEditProfile({name,password,image})async{
    var store = await fireStore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'image': image

    },SetOptions(merge: true));
    isLoading(false);
  }

}