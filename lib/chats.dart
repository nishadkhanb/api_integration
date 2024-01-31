import 'package:flutter/material.dart';

import 'details.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> name = ['nishad', 'sebin', 'raju', 'priya'];
    List<String> number = ['123', '456', '678', '987'];

    List<Map<String, dynamic>> userDetails = [
      {'name': 'nishad', "number": 123, "image": "lib/assets/dart.jpeg"},
      {'name': 'nishad', "number": 123, "image": "lib/assets/flutter.png"},
      {'name': 'nishad', "number": 123, "image": "lib/assets/dart.jpeg"},
      {'name': 'nishad', "number": 123, "image": "lib/assets/flutter.png"},
      {'name': 'nishad', "number": 123, "image": "lib/assets/dart.jpeg"},
      {'name': 'nishad', "number": 123, "image": "lib/assets/flutter.png"},
    ];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: width,
            height: height / 6,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 1,
                  );
                },
                itemCount: userDetails.length,
                itemBuilder: (context, index) {
                  // return Customlisttile(imagepath: userDetails[index]['image'], tittle: userDetails[index]['name'], subtittle:userDetails[index]['number'].toString() , onpressed: (){});
                  return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(userDetails[index]['image']),
                      ),
                      title: Text(userDetails[index]['name']),
                      subtitle: Text(userDetails[index]['number'].toString()),
                      //trailing: Icon(),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Details(
                              tittle: name[index], subtittle: number[index]),
                        ));
                      });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
