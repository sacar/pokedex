import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_evolution.dart';
import 'package:pokedex/pokemon_stats.dart';
import 'package:pokedex/pokemon_weakness.dart';

class NestedTabBar extends StatefulWidget {
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  double screenHeight;

  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: tabBar(),
        ),
        Expanded(
          flex: 9,
          child: tabView(),
        )
      ],
    );
  }

  Widget tabBar() {
    return TabBar(
      controller: _nestedTabController,
      indicator: BubbleTabIndicator(
        indicatorHeight: 30.0,
        indicatorColor: Colors.blueAccent,
        tabBarIndicatorSize: TabBarIndicatorSize.tab,
      ),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black54,
      isScrollable: true,
      tabs: <Widget>[
        Tab(
          text: "STATS",
        ),
        Tab(
          text: "EVOLUTION",
        ),
        Tab(
          text: "MOVES",
        ),
      ],
    );
  }

  Widget tabView() {
    return Container(
      height: screenHeight,
      child: TabBarView(
        controller: _nestedTabController,
        children: <Widget>[
          ListView(
            children: <Widget>[_statsTab()],
          ),
          ListView(
            children: <Widget>[
              PokemonEvolution(),
            ],
          ),
          ListView(),
        ],
      ),
    );
  }

  // Stats Tab bar view
  Widget _statsTab() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0,8,16,16),
      child: Column(
        children: <Widget>[
          PokemonStats(),
          SizedBox(
            height: 20,
          ),
          PokemonWeakness(),
        ],
      ),
    );
  }
}
