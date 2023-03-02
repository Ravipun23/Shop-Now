import 'package:shop_now/consts/consts.dart';

class FirestoreServices{
  static getUser() {
   var refernece = fireStore.collection(userCollection).where('id',isEqualTo: currentUser!.uid).snapshots();
    return refernece;
  }
}