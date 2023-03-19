import 'package:flutter/material.dart';

import 'package:favorite_names/words_generator_page/words_generator_page.dart';
import 'package:favorite_names/favorite_names_page/favorite_names_page.dart';

class AppHomePage extends StatefulWidget {
  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = WordsGeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 450) {
        // Use a more mobile-friendly layout with BottomNavigationBar
        // on narrow screens.
        return Column(
          children: [
            Expanded(child: mainArea),
            SafeArea(
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favorites',
                  ),
                ],
                currentIndex: selectedIndex,
                onTap: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            )
          ],
        );
      } else {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(child: mainArea),
            ],
          ),
        );
      }
    });
  }
}
