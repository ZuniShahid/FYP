
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fypstart/model/cart.dart';

class databaseCollections{

  final CollectionReference userCollection1 =
  FirebaseFirestore.instance.collection('users');

  final CollectionReference userCollection2 =
  FirebaseFirestore.instance.collection('ProductRegistrationDetails');

  final CollectionReference userCollection3 =
  FirebaseFirestore.instance.collection('cart');

  Future registerSimpleUser(String firstname, String lastname,String email, String phoneno, String userID) async {
    return await userCollection1.doc(userID).set({
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phoneno': phoneno,
      'role': 'simpleuser',
      'uid':userID
    });
  }


  Future registerPremiumUser(String firstname, String lastname,String email, String phoneno,String userID) async {
    return await userCollection1.doc(userID).set({
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phoneno': phoneno,
      'role': 'premiumuser',
    'uid':userID
    });
  }

  Future registerProductDetails(String uid, String productname,String fullname,String phoneno,String email,String totalSlots, String perSlotPrice,String totalPrice) async {
    return await userCollection2.doc().set({
      'uid': uid,
      'productname': productname,
      'sellername': fullname,
      'sellerphonenumber': phoneno,
      'selleremail': email,
      'totalslots': totalSlots,
      'freeslots': totalSlots,
      'status': false,
      'declinestatus': true,
      'perslotprice': perSlotPrice,
      'totalprice':totalPrice
    });
  }

  Future addToCart(var cartData) async {
      await userCollection3.doc().set(
          cartData
      ).whenComplete(() {
        print('cart firebase data upload completed');
      }).onError((error, stackTrace) {
        print(error.toString());
      });


  }

  Future getCurrentUserData(String uid) async {
    try {
      DocumentSnapshot ds = await userCollection1.doc(uid).get();
      String firstname = ds.get('firstname');
      String lastname = ds.get('lastname');
      String email = ds.get('email');
      String role = ds.get('role');
      String phoneno = ds.get('phoneno');
      String uidd = ds.get('uid');
      return [firstname, lastname, email, role, phoneno,uidd];
    } catch (e) {
      print(e.toString());
      return null;
    }


    //how to get data in UI:onPressed() async { dynamic names = await DatabaseManager.getCurrentUserData(); if(names != null) { String firstname = names[0];} }
  }
}