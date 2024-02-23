import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List audioBooks = [];

  @override
  void initState() {
    super.initState();
    readAudio(); // Load audio data when the widget initializes
  }

  readAudio() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/books.json')
        .then((s) {
      setState(() {
        audioBooks = json.decode(s);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player'),
        actions: [
          IconButton(
            onPressed: () {
              // Implement search functionality
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(child:
          audioBooks ==
              null // Check if audioBooks is null before accessing its length
              ? Center(
              child:
              CircularProgressIndicator()) // Show loading indicator while data is being fetched
              : ListView.builder(
            itemCount: audioBooks.length,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.music_note),
                    title: Text(audioBooks[index]['title']),
                    subtitle: Text(audioBooks[index]['text']),
                    trailing: IconButton(
                      onPressed: () {
                        // Implement download functionality
                      },
                      icon: const Icon(CupertinoIcons.play),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 1,
                  )
                ],
              );
            },
          ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
