import 'package:flutter/material.dart';
import 'package:flutter_app3/main.dart';

class HomeScreen extends StatelessWidget {
  final List<ListItem> items;

  const HomeScreen({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
        title: const Text('Home Screen Title'),
        actions: [
          IconButton(
            onPressed: () {
              print('copy button pressed');
            },
            icon: const Icon(Icons.content_copy),
          ),
          IconButton(
            onPressed: () {
              print('search button pressed');
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0), // Aici ai putea seta marginile
        child: Column(
          children: [
            Row(
              children: <Widget>[
                IconButton(
                  color: Colors.green,
                  onPressed: () {
                    print('group button');
                  },
                  icon: const Icon(Icons.group),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: const Center(
                      child: Text(
                        'Titlu',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: const Center(
                      child: Text(
                        'Casetă 1',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: const Center(
                      child: Text(
                        'Casetă 2',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Adaugă spațiu între rânduri
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                  final item = items[index];
                return ListTile(
                  title: item.buildTitle(context),
                  subtitle: item.buildSubtitle(context),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        onPressed: () {
          showDummyDialog(context);
        },
        label: const Text('What?'),
        icon: const Icon(Icons.access_alarm),
      ),
    );
  }

  Future<dynamic> showDummyDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Hello Dialog'),
          content: Text("E foarte bine pana acum"),
        );
      },
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}
