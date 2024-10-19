import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_drawer.dart';
import 'package:food_delivery/components/app_food_tile.dart';
import 'package:food_delivery/components/current_location.dart';
import 'package:food_delivery/components/description_box.dart';
import 'package:food_delivery/components/silver_appbar.dart';
import 'package:food_delivery/components/tab_bar.dart';
import 'package:food_delivery/models/Food.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length,vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category,List<Food> fullMenu){
    return fullMenu.where ((food)=> food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder:(context,index){
          final food = categoryMenu[index];
          return FoodTile(food: food, onTap:
            ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodPage(food: food))));
        },
    );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: NestedScrollView(headerSliverBuilder: (context,innerBoxIsScrolled)=>[
        AppSliverAppBar(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CurrentLocation(),
                DescriptionBox()
              ],
            ), 
            title: AppTabBar(tabController: _tabController))
      ],
      body: Consumer<Restaurant>(builder: (context,restaurant,child)=>TabBarView(
          controller: _tabController,
          children: getFoodInThisCategory(restaurant.menu)
      ))
      ),
    );
  }
}
