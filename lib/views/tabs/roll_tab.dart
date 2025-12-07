import 'package:flutter/material.dart';
import 'package:rpgdiceroll_app/views/widgets/dice_grid.dart';
import 'package:rpgdiceroll_app/views/widgets/roll_button.dart';
import 'package:rpgdiceroll_app/views/widgets/roll_modifier.dart';

class RollTab extends StatefulWidget {
  const RollTab({super.key});

  @override
  State<RollTab> createState() => _RollTabState();
}

class _RollTabState extends State<RollTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: DiceGrid()
            ),
            SizedBox(height: 16,),
            RollModifiers(),
            SizedBox(height: 16),
            RollButton(),
          ],
        )
        ),
    );
  }
}

