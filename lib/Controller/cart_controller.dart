import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/Models/cart_item_res.dart';
import 'package:learning_app/Models/course_res.dart';
import 'package:learning_app/Models/user_res.dart';
import 'package:learning_app/utils/AppColorCode.dart';
import 'package:learning_app/utils/controllers.dart';

import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  RxDouble totalCartPrice = 0.0.obs;

  @override
  void onReady() {
    super.onReady();
    ever(userController.userModel, changeCartTotalPrice);
  }

  void addProductToCart(Data product) {
    try {
      if (_isItemAlreadyAdded(product)) {
        Get.snackbar("Check your cart", "${product.title} is already added");
      } else {
        String itemId = Uuid().toString();
        userController.updateUserData({
          "cart": FieldValue.arrayUnion([
            {
              "id": itemId,
              "productId": product.id,
              "name": product.title,
              "quantity": 1,
              "price": product.price,
              "image": product.listingImage,
              "cost": product.price
            }
          ])
        });
        Get.snackbar('Item_added'.tr, "${product.title}" + 'was_added_cart'.tr);
      }
    } catch (e) {
      Get.snackbar('Error'.tr, 'Cannot_add_item'.tr);
      debugPrint(e.toString());
    }
  }

  void removeCartItem(CartItemModel cartItem) {
    try {
      userController.updateUserData({
        "cart": FieldValue.arrayRemove([cartItem.toJson()])
      });
    } catch (e) {
      Get.snackbar('Error'.tr, 'Cannot_remove_item'.tr);
      //debugPrint(e.message);
    }
  }

  changeCartTotalPrice(UserModel userModel) {
    totalCartPrice.value = 0.0;
    if (userModel.cart!.isNotEmpty) {
      userModel.cart!.forEach((cartItem) {
        //    totalCartPrice += cartItem.cost;
      });
    }
  }

  bool _isItemAlreadyAdded(Data product) => userController.userModel.value.cart!
      .where((item) => item.productId == product.id)
      .isNotEmpty;

  void decreaseQuantity(CartItemModel item) {
    if (item.quantity == 1) {
      removeCartItem(item);
    } else {
      removeCartItem(item);
      // item.quantity! --;
      userController.updateUserData({
        "cart": FieldValue.arrayUnion([item.toJson()])
      });
    }
  }

  void increaseQuantity(CartItemModel item) {
    removeCartItem(item);
    //item.quantity!+;

    userController.updateUserData({
      "cart": FieldValue.arrayUnion([item.toJson()])
    });
  }
}
