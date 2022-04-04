import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learning_app/Models/cart_item_res.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const CART = "cart";
  static const PROI = "profile_image";

  static const MAINCATEGORY = "MainCategory";
  static const SUBCATEGORY = "subCategory";

  String? id;
  String? name;
  String? email;
  String? profileImage;
  List<CartItemModel>? cart;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.profileImage,
    this.cart,
  });

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    name = (snapshot.data() as Map<String, dynamic>)[NAME];
    email = (snapshot.data() as Map<String, dynamic>)[EMAIL];
    id = (snapshot.data() as Map<String, dynamic>)[ID];
    cart = _convertCartItems((snapshot.data() as Map<String, dynamic>)[CART]);
  }
  List<CartItemModel> _convertCartItems(List cartFomDb) {
    List<CartItemModel> _result = [];
    if (cartFomDb.length > 0) {
      cartFomDb.forEach((element) {
        _result.add(CartItemModel.fromMap(element));
      });
    }
    return _result;
  }

  List cartItemsToJson() => cart!.map((item) => item.toJson()).toList();
}
