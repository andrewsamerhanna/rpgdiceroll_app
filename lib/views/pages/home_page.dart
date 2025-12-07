import 'package:flutter/material.dart';
import 'package:rpgdiceroll_app/views/tabs/history_tab.dart';
import 'package:rpgdiceroll_app/views/tabs/roll_tab.dart';
import 'package:rpgdiceroll_app/l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 3.0,
                  color: Theme.of(context).colorScheme.primary
                ),
                insets: EdgeInsets.zero
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                // Roll Tab Label
                Tab(
                  text: AppLocalizations.of(context)!.homeTabTabletop,
                ),
                // History Tab Label
                Tab(
                  text: AppLocalizations.of(context)!.homeTabHistory,
                )
              ] 
           ),
           Expanded(
             child: TabBarView(
              children: [
                // Roll Tab Content (lib/views/tabs/roll_tab.dart)
                RollTab(),
                // History Tab Content (lib/views/tabs/roll_tab.dart)
                HistoryTab(),
              ]
             ),
           )
          ],
        ),
      ),
    );
  }
}
