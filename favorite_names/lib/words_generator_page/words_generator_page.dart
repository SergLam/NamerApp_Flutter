import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:favorite_names/app/favorite_names_app.dart';
import 'package:favorite_names/reusable_widgets/big_card_widget.dart';
import 'package:favorite_names/words_generator_page/favorites_history_list_widget.dart';

class WordsGeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<FavoriteNamesAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: FavoriteHistoryListWidget(),
          ),
          SizedBox(height: 10),
          BigCardWidget(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}

