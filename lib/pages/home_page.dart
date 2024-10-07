import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_drawer.dart';
import 'package:food_delivery/components/current_location.dart';
import 'package:food_delivery/components/description_box.dart';
import 'package:food_delivery/components/silver_appbar.dart';
import 'package:food_delivery/components/tab_bar.dart';

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
    _tabController = TabController(length: 3,vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
      body: TabBarView(
        controller: _tabController,
        children: [
          Text("Hello"),
          Text("hi "),
          Text("bye"),
        ],
      )
      ),
    );
  }
}
