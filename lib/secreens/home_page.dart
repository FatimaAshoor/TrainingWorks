import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List icons = [
    Icons.sports_soccer,
    Icons.sports_hockey,
    Icons.sports_basketball,
    Icons.sports_baseball_outlined,
    Icons.sports_soccer,
    Icons.sports_hockey,
    Icons.sports_basketball,
    Icons.sports_baseball_outlined,
  ];

  List Titles = [
    "SOCCER", "ICE HOCKEY", "BASCTBALL", "bOXING", "SOCCER", "ICE HOCOEY", "BASCTBALL", "bOXING"
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                height: 100,
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text("Free Bet")
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                height: 100,
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.yellow,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text("Free Bet")
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 22,),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            height: 100,
            width: 330,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.pink,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Trending Bet"),
                      SizedBox(
                        height: 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                            TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                          Text(
                            "and typesetting industry. Lorem Ipsum has.",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                            TextStyle(fontSize: 10, color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,

              ),
              itemCount: 8,
              itemBuilder: (context, i) {
                return Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  height: 80,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(icons[i]),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${Titles[i]}"),
                            SizedBox(height: 2,),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}