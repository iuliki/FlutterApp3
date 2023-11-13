import 'package:flutter/material.dart';

import 'common/strings.dart' as strings;
import 'screens/home_screen.dart';

void main() {
  runApp(FlutterApp3(
    items: List<ListItem>.generate(
      10,
      (i) => i % 6 == 0
          ? HeadingItem('Heading $i')
          : MessageItem('Sender $i', 'Message body $i'),
    ),
  ));
}

class FlutterApp3 extends StatelessWidget {
  final List<ListItem> items;

  const FlutterApp3({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: strings.appTitle,
      home: HomeScreen(items: items),
    );
  }
}
