import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';

import 'package:favorite_names/app/favorite_names_app.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<FavoriteNamesAppState>();
    var theme = Theme.of(context);

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text('You have '
                '${appState.favorites.length} favorites:'),
          ),
          Expanded(
            // Make better use of wide windows with a grid.
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                childAspectRatio: 400 / 80,
              ),
              children: [
                for (var pair in appState.favorites)
                  ListTile(
                    leading: IconButton(
                      icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
                      color: theme.colorScheme.primary,
                      onPressed: () {
                        appState.removeFavorite(pair);
                      },
                    ),
                    title: Text(
                      pair.asLowerCase,
                      semanticsLabel: pair.asPascalCase,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}