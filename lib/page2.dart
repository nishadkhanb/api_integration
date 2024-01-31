import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('search',style: TextStyle(color: Colors.blue),),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width/1.4, // Adjust the width according to your needs
              child: TextField(
                controller: text,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  //icon: Icon(Icons.search)
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              String userInput = text.text;
              print('User input: $userInput');
            },
          ),
        ],
      ),

      );
    }

}
