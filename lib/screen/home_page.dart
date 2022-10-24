// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/modles/categories_modle.dart';
import 'package:food_order_app/modles/food_categories_modle.dart';
import 'package:food_order_app/modles/foods_modle.dart';
import 'package:food_order_app/provider/my_provider.dart';
import 'package:food_order_app/screen/cart_page.dart';
import 'package:food_order_app/screen/categories.dart';
import 'package:food_order_app/screen/detail_page.dart';
import 'package:food_order_app/widget/bottom_container.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoriesModle> pizzaList = [];
  List<CategoriesModle> burgarList = [];
  List<CategoriesModle> drinkList = [];
  List<CategoriesModle> juiceList = [];
  List<CategoriesModle> saladList = [];
  List<CategoriesModle> eggList = [];
  List<CategoriesModle> recipeList = [];

  List<FoodModle> singleFoodList = [];

  List<FoodCategoriesModle> burgerCategoriesList = [];
  List<FoodCategoriesModle> pizzaCategoriesList = [];
  List<FoodCategoriesModle> drinkCategoriesList = [];
  List<FoodCategoriesModle> recipeCategoriesList = [];

  Widget categoriesContainer({
    required String image,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(right: 15),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
              ),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget drawerItem({
    required String name,
    required IconData icon,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget pizza() {
    return Row(
      children: pizzaList
          .map((e) => categoriesContainer(
                image: e.image,
                title: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Categories(
                        list: pizzaCategoriesList,
                      ),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  Widget burgar() {
    return Row(
      children: burgarList
          .map((e) => categoriesContainer(
                image: e.image,
                title: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Categories(
                        list: burgerCategoriesList,
                      ),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  Widget drink() {
    return Row(
      children: drinkList
          .map((e) => categoriesContainer(
                image: e.image,
                title: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Categories(
                        list: drinkCategoriesList,
                      ),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  Widget juice() {
    return Row(
      children: juiceList
          .map((e) => categoriesContainer(
                image: e.image,
                title: e.name,
                onTap: () {},
              ))
          .toList(),
    );
  }

  Widget salad() {
    return Row(
      children: saladList
          .map((e) => categoriesContainer(
                image: e.image,
                title: e.name,
                onTap: () {},
              ))
          .toList(),
    );
  }

  Widget egg() {
    return Row(
      children: eggList
          .map((e) => categoriesContainer(
                image: e.image,
                title: e.name,
                onTap: () {},
              ))
          .toList(),
    );
  }

  Widget recipe() {
    return Row(
      children: recipeList
          .map((e) => categoriesContainer(
                image: e.image,
                title: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Categories(
                        list: recipeCategoriesList,
                      ),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);

    provider.getPizzaCategory();
    pizzaList = provider.throwPizzaList;

    provider.getBurgarCategory();
    burgarList = provider.throwBurgarList;

    provider.getDrinkCategory();
    drinkList = provider.throwDrinkList;

    provider.getJuiceCategory();
    juiceList = provider.throwJuiceList;

    provider.getSaladCategory();
    saladList = provider.throwSaladList;

    provider.getEggCategory();
    eggList = provider.throwEggList;

    provider.getRecipeCategory();
    recipeList = provider.throwRecipeList;

    // Single Food List
    provider.getFoodList();
    singleFoodList = provider.throwFoodModleList;

    // Food Catagories List
    provider.getBurgerCategoriesList();
    burgerCategoriesList = provider.throwBurgerCategoriesList;

    provider.getPizzaCategoriesList();
    pizzaCategoriesList = provider.throwPizzaCategoriesList;

    provider.getRecipeCategoriesList();
    recipeCategoriesList = provider.throwRecipeCategoriesList;

    provider.getDrinkCategoriesList();
    drinkCategoriesList = provider.throwDrinkCategoriesList;

    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(0xff2b2b2b),
          child: SafeArea(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 66, 160, 243),
                    // image: DecorationImage(
                    //   fit: BoxFit.cover,
                    //   image: AssetImage('images/background.jpg'),
                    // ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/profile.png'),
                  ),
                  accountName: Text("Hello Everyone"),
                  accountEmail: Text("hello@everyone.com"),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: drawerItem(icon: Icons.person, name: "Profile"),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (contet) => const CartPage(),
                      ),
                    );
                  },
                  child:
                      drawerItem(icon: Icons.add_shopping_cart, name: "Cart"),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: drawerItem(icon: Icons.shopping_bag, name: "Order"),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: drawerItem(name: "About", icon: Icons.help),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                ListTile(
                  leading: Text(
                    "Comunicate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: drawerItem(icon: Icons.lock, name: "Change"),
                ),
                MaterialButton(
                  onPressed: () {
                    signOut();
                  },
                  child: drawerItem(icon: Icons.exit_to_app, name: "Log Out"),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,

        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: CircleAvatar(
              //backgroundColor: Colors.red ,
              backgroundImage: AssetImage("images/profile.png"),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search Food Here",
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Color(0xff3a3e3e),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    pizza(),
                    burgar(),
                    drink(),
                    juice(),
                    salad(),
                    egg(),
                    recipe(),
                    // categoriesContainer(
                    //   image: 'images/1.png',
                    //   title: "All",
                    // ),
                    // categoriesContainer(
                    //   image: 'images/2.png',
                    //   title: "Drink",
                    // ),
                    // categoriesContainer(
                    //   image: 'images/3.png',
                    //   title: "Juice",
                    // ),
                    // categoriesContainer(
                    //   image: 'images/4.png',
                    //   title: "Recipe",
                    // ),
                    // categoriesContainer(
                    //   image: 'images/5.png',
                    //   title: "Fries",
                    // ),
                    // categoriesContainer(
                    //   image: 'images/6.png',
                    //   title: "Burgar",
                    // ),
                    // categoriesContainer(
                    //   image: 'images/7.png',
                    //   title: "Salad",
                    // ),
                    // categoriesContainer(
                    //   image: 'images/8.png',
                    //   title: "Pizza",
                    // ),
                    // categoriesContainer(
                    //   image: 'images/9.png',
                    //   title: "Egg",
                    // ),
                    // categoriesContainer(
                    //   image: 'images/10.png',
                    //   title: "Demo",
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(
              //margin: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height - 242,
              child: GridView.count(
                  shrinkWrap: false,
                  primary: false,
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  children: singleFoodList
                      .map(
                        (e) => BottomContainer(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  image: e.image,
                                  name: e.name,
                                  price: e.price,
                                ),
                              ),
                            );
                          },
                          image: e.image,
                          price: e.price,
                          name: e.name,
                        ),
                      )
                      .toList()
                  // children: [
                  // buttonContainer(
                  //   image: 'images/9.png',
                  //   name: 'Egg Fry',
                  //   price: 20,
                  // ),
                  // buttonContainer(
                  //   image: 'images/8.png',
                  //   name: 'Egg Fry',
                  //   price: 20,
                  // ),
                  // buttonContainer(
                  //   image: 'images/7.png',
                  //   name: 'Egg Fry',
                  //   price: 20,
                  // ),
                  // buttonContainer(
                  //   image: 'images/6.png',
                  //   name: 'Egg Fry',
                  //   price: 20,
                  // ),
                  // buttonContainer(
                  //   image: 'images/5.png',
                  //   name: 'Egg Fry',
                  //   price: 20,
                  // ),
                  // buttonContainer(
                  //   image: 'images/4.png',
                  //   name: 'Egg Fry',
                  //   price: 20,
                  // ),
                  // ],
                  ),
            )
          ],
        ),
      ),
    );
  }
}
