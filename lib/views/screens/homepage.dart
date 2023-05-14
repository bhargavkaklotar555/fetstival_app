import 'package:fetstival_app/utils/routes.dart';
import 'package:flutter/material.dart';

import '../../utils/lists.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    Size s = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        bool WillPop = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "exit?",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Are you shure you want to exit?",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text("Yes")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text("no")),
                  ],
                ));
        return WillPop;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Templates",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.7),
          ),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: MyLists.imageUrlList.length,
          itemBuilder: (BuildContext context, int index) {
            final imageUrl = MyLists.imageUrlList[index];
            return Column(
              children: [
                Container(
                  height: 359,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(5, 5),
                        blurRadius: 3,
                        spreadRadius: 1.7,
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(MyRoutes.add_info, arguments: index);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          MyLists.imageUrlList[index]['img'],
                          fit: BoxFit.fill,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          color: Colors.white,
                          child: Text(
                            MyLists.imageUrlList[index]['name'],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        backgroundColor: Color(0xffEFF6ED),
      ),
    );
  }
}
