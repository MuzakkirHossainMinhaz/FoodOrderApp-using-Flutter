// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_order_app/modles/cart_modle.dart';
import 'package:food_order_app/modles/categories_modle.dart';
import 'package:food_order_app/modles/food_categories_modle.dart';

import '../modles/foods_modle.dart';

class MyProvider extends ChangeNotifier {
  // ----------------- 1st Category -----------------
  List<CategoriesModle> burgarList = [];
  late CategoriesModle burgarModle;
  Future<void> getBurgarCategory() async {
    List<CategoriesModle> newBurgarList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('0yqtfvcLHRz62M5BOY7h')
        .collection('burgar')
        .get();
    for (var element in querySnapshot.docs) {
      burgarModle = CategoriesModle(
        image: element['img'],
        name: element['name'],
      );

      //print(categoriesModle.name);
      newBurgarList.add(burgarModle);
      burgarList = newBurgarList;
    }
    notifyListeners();
  }

  get throwBurgarList {
    return burgarList;
  }

  // ----------------- 2nd Category -----------------
  List<CategoriesModle> pizzaList = [];
  late CategoriesModle pizzaModle;
  Future<void> getPizzaCategory() async {
    List<CategoriesModle> newPizzaList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('0yqtfvcLHRz62M5BOY7h')
        .collection('pizza')
        .get();
    for (var element in querySnapshot.docs) {
      pizzaModle = CategoriesModle(
        image: element['img'],
        name: element['name'],
      );

      //print(categoriesModle.name);
      newPizzaList.add(pizzaModle);
      pizzaList = newPizzaList;
    }
    notifyListeners();
  }

  get throwPizzaList {
    return pizzaList;
  }

  // ----------------- 3rd Category -----------------
  List<CategoriesModle> drinkList = [];
  late CategoriesModle drinkModle;
  Future<void> getDrinkCategory() async {
    List<CategoriesModle> newDrinkList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('0yqtfvcLHRz62M5BOY7h')
        .collection('drink')
        .get();
    for (var element in querySnapshot.docs) {
      drinkModle = CategoriesModle(
        image: element['img'],
        name: element['name'],
      );

      //print(categoriesModle.name);
      newDrinkList.add(drinkModle);
      drinkList = newDrinkList;
    }
    notifyListeners();
  }

  get throwDrinkList {
    return drinkList;
  }

  // ----------------- 4th Category -----------------
  List<CategoriesModle> juiceList = [];
  late CategoriesModle juiceModle;
  Future<void> getJuiceCategory() async {
    List<CategoriesModle> newJuiceList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('0yqtfvcLHRz62M5BOY7h')
        .collection('Juice')
        .get();
    for (var element in querySnapshot.docs) {
      juiceModle = CategoriesModle(
        image: element['img'],
        name: element['name'],
      );

      //print(categoriesModle.name);
      newJuiceList.add(juiceModle);
      juiceList = newJuiceList;
    }
    notifyListeners();
  }

  get throwJuiceList {
    return juiceList;
  }

  // ----------------- 5th Category -----------------
  List<CategoriesModle> saladList = [];
  late CategoriesModle saladModle;
  Future<void> getSaladCategory() async {
    List<CategoriesModle> newSaladList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('0yqtfvcLHRz62M5BOY7h')
        .collection('Salad')
        .get();
    for (var element in querySnapshot.docs) {
      saladModle = CategoriesModle(
        image: element['img'],
        name: element['name'],
      );

      //print(categoriesModle.name);
      newSaladList.add(saladModle);
      saladList = newSaladList;
    }
    notifyListeners();
  }

  get throwSaladList {
    return saladList;
  }

  // ----------------- 6th Category -----------------
  List<CategoriesModle> eggList = [];
  late CategoriesModle eggModle;
  Future<void> getEggCategory() async {
    List<CategoriesModle> newEggList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('0yqtfvcLHRz62M5BOY7h')
        .collection('egg')
        .get();
    for (var element in querySnapshot.docs) {
      eggModle = CategoriesModle(
        image: element['img'],
        name: element['name'],
      );

      //print(categoriesModle.name);
      newEggList.add(eggModle);
      eggList = newEggList;
    }
    notifyListeners();
  }

  get throwEggList {
    return eggList;
  }

  // ----------------- 7th Category -----------------
  List<CategoriesModle> recipeList = [];
  late CategoriesModle recipeModle;
  Future<void> getRecipeCategory() async {
    List<CategoriesModle> newRecipeList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('0yqtfvcLHRz62M5BOY7h')
        .collection('recipe')
        .get();
    for (var element in querySnapshot.docs) {
      recipeModle = CategoriesModle(
        image: element['img'],
        name: element['name'],
      );

      //print(categoriesModle.name);
      newRecipeList.add(recipeModle);
      recipeList = newRecipeList;
    }
    notifyListeners();
  }

  get throwRecipeList {
    return recipeList;
  }

  // =================== single Food Item ===================
  List<FoodModle> foodModleList = [];
  late FoodModle foodModle;
  Future<void> getFoodList() async {
    List<FoodModle> newSingleFoodList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('foods').get();
    for (var element in querySnapshot.docs) {
      foodModle = FoodModle(
        name: element['name'],
        image: element['image'],
        price: element['price'],
      );
      newSingleFoodList.add(foodModle);
      foodModleList = newSingleFoodList;
    }
    notifyListeners();
  }

  get throwFoodModleList {
    return foodModleList;
  }

  // {{{{{{{{{{{{{{{{{{{{ Burger Category List }}}}}}}}}}}}}}}}}}}}
  List<FoodCategoriesModle> burgerCategoriesList = [];
  late FoodCategoriesModle burgerCategoriesModle;
  Future<void> getBurgerCategoriesList() async {
    List<FoodCategoriesModle> newBurgerCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodCategories')
        .doc('u49I8HwYp1fnIgLh30O7')
        .collection('burger')
        .get();
    for (var element in querySnapshot.docs) {
      burgerCategoriesModle = FoodCategoriesModle(
        image: element['image'],
        name: element['name'],
        price: element['price'],
      );
      newBurgerCategoriesList.add(burgerCategoriesModle);
      burgerCategoriesList = newBurgerCategoriesList;
    }
  }

  get throwBurgerCategoriesList {
    return burgerCategoriesList;
  }

  // {{{{{{{{{{{{{{{{{{{{ Pizza Category List }}}}}}}}}}}}}}}}}}}}
  List<FoodCategoriesModle> pizzaCategoriesList = [];
  late FoodCategoriesModle pizzaCategoriesModle;
  Future<void> getPizzaCategoriesList() async {
    List<FoodCategoriesModle> newPizzaCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodCategories')
        .doc('u49I8HwYp1fnIgLh30O7')
        .collection('pizza')
        .get();
    for (var element in querySnapshot.docs) {
      pizzaCategoriesModle = FoodCategoriesModle(
        image: element['image'],
        name: element['name'],
        price: element['price'],
      );
      newPizzaCategoriesList.add(pizzaCategoriesModle);
      pizzaCategoriesList = newPizzaCategoriesList;
    }
  }

  get throwPizzaCategoriesList {
    return pizzaCategoriesList;
  }

  // {{{{{{{{{{{{{{{{{{{{ Drink Category List }}}}}}}}}}}}}}}}}}}}
  List<FoodCategoriesModle> drinkCategoriesList = [];
  late FoodCategoriesModle drinkCategoriesModle;
  Future<void> getDrinkCategoriesList() async {
    List<FoodCategoriesModle> newDrinkCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodCategories')
        .doc('u49I8HwYp1fnIgLh30O7')
        .collection('drink')
        .get();
    for (var element in querySnapshot.docs) {
      drinkCategoriesModle = FoodCategoriesModle(
        image: element['image'],
        name: element['name'],
        price: element['price'],
      );
      newDrinkCategoriesList.add(drinkCategoriesModle);
      drinkCategoriesList = newDrinkCategoriesList;
    }
  }

  get throwDrinkCategoriesList {
    return drinkCategoriesList;
  }

  // {{{{{{{{{{{{{{{{{{{{ Recipe Category List }}}}}}}}}}}}}}}}}}}}
  List<FoodCategoriesModle> recipeCategoriesList = [];
  late FoodCategoriesModle recipeCategoriesModle;
  Future<void> getRecipeCategoriesList() async {
    List<FoodCategoriesModle> newRecipeCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodCategories')
        .doc('u49I8HwYp1fnIgLh30O7')
        .collection('recipe')
        .get();
    for (var element in querySnapshot.docs) {
      recipeCategoriesModle = FoodCategoriesModle(
        image: element['image'],
        name: element['name'],
        price: element['price'],
      );
      newRecipeCategoriesList.add(recipeCategoriesModle);
      recipeCategoriesList = newRecipeCategoriesList;
    }
  }

  get throwRecipeCategoriesList {
    return recipeCategoriesList;
  }

  // [[[[[[[[[[[[[[[ Add to Cart ]]]]]]]]]]]]]]]
  List<CartModle> cartList = [];
  List<CartModle> newCartList = [];
  late CartModle cartModle;
  void addToCart({
    required String image,
    required String name,
    required int price,
    required int quantity,
  }) {
    cartModle = CartModle(
      image: image,
      name: name,
      price: price,
      quantity: quantity,
    );
    newCartList.add(cartModle);
    cartList = newCartList;
  }

  get throwCartList {
    return cartList;
  }

  int totalPrice() {
    int total = 0;
    for (var element in cartList) {
      total += element.price * element.quantity;
    }
    return total;
  }

  late int deleteIndex;
  void getDeleteIndex(int index) {
    deleteIndex = index;
  }

  void delete() {
    cartList.removeAt(deleteIndex);
    notifyListeners();
  }
}
