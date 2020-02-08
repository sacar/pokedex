import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// Widget to show the Pokemon Stats
class PokemonStats extends StatelessWidget {
  final List<String> stats = ["HP", "ATK", "DEF", "SATK", "SDEF", "SPD"];
  final List<int> values = [54, 64, 58, 80, 65, 80];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        // Stat Names
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: stats.map<Widget>((stat) => _label(stat)).toList()),
        // Stat Values
        Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: values
                .map<Widget>(
                    (value) => _label(value.toString().padLeft(3, '0')))
                .toList()),
        // Stat Values represented in graphical form
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: values
                  .map<Widget>((value) => _percentIndicator(value))
                  .toList()),
        ),
      ],
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text(text),
    );
  }

  // Visual representation of the stat
  Widget _percentIndicator(int value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LinearPercentIndicator(
        lineHeight: 10.0,
        percent: value / 100,
        progressColor: Colors.blue,
      ),
    );
  }
}
