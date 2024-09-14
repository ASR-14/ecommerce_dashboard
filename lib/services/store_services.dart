import 'package:seller_app/const/const.dart';

class StoreServices {
  static getProfile(uid) {
    return firestore
        .collection(vendersCollection)
        .where('id', isEqualTo: uid)
        .get();
  }
}
