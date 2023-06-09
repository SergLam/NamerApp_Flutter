import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class BigCardWidget extends StatelessWidget {
  const BigCardWidget({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AnimatedSize(
            duration: Duration(milliseconds: 200),
            // Make sure that the compound word wraps correctly when the window
            // is too narrow.
            child: MergeSemantics(
              child: Wrap(
                children: [
                  Text(
                    pair.first,
                    style: style.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    pair.second,
                    style: style.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
