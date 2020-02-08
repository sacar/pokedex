import 'dart:async';

import 'dart:convert';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokedex/pokemon_detail_expanded.dart';
import 'package:pokedex/pokemon_list.dart';

class PokemonDetails extends StatefulWidget {
  @override
  _PokemonDetailsState createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  ScrollController _scrollController = ScrollController();
  double topPosition;

  @override
  void initState() {
    topPosition = -80;

    super.initState();
    _scrollController.addListener(_onScroll);
  }

  _onScroll() {
    // if (_scrollController.offset > 10) {
    //   print(_scrollController.offset);
    //   Navigator.push(context,
    //       MaterialPageRoute(builder: (context) => PokemonDetailsExpanded()));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy < 0) {
          // swiping in right direction
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PokemonDetailsExpanded()));
        }
      },
      child: Scaffold(
        body: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            ClipPath(
              child: Container(
                color: Color(0xFFF8A54F),
              ),
              clipper: BottomWaveClipper(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 120,
                ),
                _pokemonImage(),
                _pokemonName(),
                _pokemonType(),
                _pokemonDescription(),
                _divider(),
                ClipRect(
                    child: Align(
                        alignment: Alignment.topLeft,
                        heightFactor: 0.7,
                        child: NestedTabBar()))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _pokemonImage() {
    return Container(
      width: 250,
      height: 250,
      child: Center(
        // child: SvgPicture.asset('images/5.svg'),
        child: Hero(
          tag: 'pokemon',
          child: Image.asset('images/5.png'),
        ),
      ),
    );
  }

  Widget _pokemonName() {
    return Text(
      "Charmeleon",
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
    );
  }

  Widget _pokemonType() {
    return Chip(
      avatar: Image.asset('images/fire.png'),
      backgroundColor: Color(0xFFfd7d24),
      padding: EdgeInsets.only(left: 6, right: 6),
      label: Text(
        'Fire',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _pokemonDescription() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        "Charmeleon mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _divider() {
    return Row(children: <Widget>[
      Expanded(child: Divider()),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PokemonDetailsExpanded()));
          },
          icon: CircleAvatar(
            radius: 12,
            backgroundColor: Colors.redAccent,
            child: Icon(
              Icons.arrow_drop_up,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Expanded(
        child: Divider(),
      ),
    ]);
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Draw a straight line from current point to the bottom left corner.
    path.lineTo(0.0, size.height - 550);

    // Draw a straight line from current point to the top right corner.
    path.lineTo(size.width, 170);
    path.lineTo(size.width, 0);

    // Draws a straight line from current point to the first point of the path.
    // In this case (0, 0), since that's where the paths start by default.
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class NestedTabBar extends StatefulWidget {
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

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
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        TabBar(
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
        ),
        Container(
          height: screenHeight * 0.4,
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("HP"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("ATK"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("DEF"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("SATK"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("SDEF"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("SPD"),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("054"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("064"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("058"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("080"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("065"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("080"),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LinearPercentIndicator(
                                width: 300.0,
                                lineHeight: 10.0,
                                percent: 0.58,
                                progressColor: Colors.blue,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LinearPercentIndicator(
                                width: 300.0,
                                lineHeight: 10.0,
                                percent: 0.64,
                                progressColor: Colors.blue,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LinearPercentIndicator(
                                width: 300.0,
                                lineHeight: 10.0,
                                percent: 0.58,
                                progressColor: Colors.blue,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LinearPercentIndicator(
                                width: 300.0,
                                lineHeight: 10.0,
                                percent: 0.8,
                                progressColor: Colors.blue,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LinearPercentIndicator(
                                width: 300.0,
                                lineHeight: 10.0,
                                percent: 0.65,
                                progressColor: Colors.blue,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LinearPercentIndicator(
                                width: 300.0,
                                lineHeight: 10.0,
                                percent: 0.80,
                                progressColor: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Weakness",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w700),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 80,
                        height: 80,
                        child: Center(child: Image.asset('images/4.png'))),
                    Container(
                        width: 80,
                        height: 80,
                        child: Center(child: Image.asset('images/5.png'))),
                    Container(
                        width: 80,
                        height: 80,
                        child: Center(child: Image.asset('images/6.png'))),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListView(
                  children: ListTile.divideTiles(
                      //          <-- ListTile.divideTiles
                      context: context,
                      tiles: [
                        ListTile(
                          title: Text("Ember"),
                          subtitle: Text("Level 1"),
                          trailing: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage("images/fire.png"),
                          ),
                        ),
                        ListTile(
                          title: Text("Growl"),
                          subtitle: Text("Level 1"),
                          trailing: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage("images/normal.png"),
                          ),
                        ),
                        ListTile(
                          title: Text("Scratch"),
                          subtitle: Text("Level 1"),
                          trailing: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage("images/normal.png"),
                          ),
                        ),
                        ListTile(
                          title: Text("Smokescreen"),
                          subtitle: Text("Level 1"),
                          trailing: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage("images/normal.png"),
                          ),
                        ),
                        ListTile(
                          title: Text("Dragon Breath"),
                          subtitle: Text("Level 12"),
                          trailing: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage("images/dragon.png"),
                          ),
                        ),
                        ListTile(
                          title: Text("Fire Fang"),
                          subtitle: Text("Level 19"),
                          trailing: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage("images/fire.png"),
                          ),
                        ),
                        ListTile(
                          title: Text("Slash"),
                          subtitle: Text("Level 24"),
                          trailing: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage("images/fire.png"),
                          ),
                        ),
                        ListTile(
                          title: Text("Flamethrower"),
                          subtitle: Text("Level 30"),
                          trailing: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage("images/fire.png"),
                          ),
                        ),
                        ListTile(
                          title: Text("Scary Face"),
                          subtitle: Text("Level 37"),
                          trailing: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage("images/normal.png"),
                          ),
                        ),
                        ListTile(
                          title: Text("Fire Spin"),
                          subtitle: Text("Level 42"),
                          trailing: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage("images/fire.png"),
                          ),
                        ),
                        ListTile(
                          title: Text("Inferno"),
                          subtitle: Text("Level 48"),
                          trailing: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage("images/fire.png"),
                          ),
                        ),
                        ListTile(
                          title: Text("Flare Blitz"),
                          subtitle: Text("Level 34"),
                          trailing: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage("images/fire.png"),
                          ),
                        ),
                      ]).toList(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
