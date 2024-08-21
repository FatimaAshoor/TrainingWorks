import 'package:flutter/material.dart';
import 'package:training_works/result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String? userType;
    double userHeight = 50;
    double userWeight = 0;
    double userAge = 0;
    double bmi =0;

    return Scaffold(
      backgroundColor: Color(0xff0A0E21),
      appBar: AppBar(
        title: Text("BMI Calculator", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor:  Color(0xff0A0E21) ,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          userType = "Male";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: userType=="Male"? Color(0xff1D1F33): Color(0xff0A0E21)),
                        child: Column(
                          children: [
                            Icon(Icons.male, color: Colors.white, size: 80,),
                            SizedBox(height: 20,),
                            Text("Male", style: TextStyle(fontSize: 20, color: Colors.grey),),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          userType = "Female";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: userType=="Female"? Color(0xff1D1F33): Color(0xff0A0E21)),
                        child: Column(
                          children: [
                            Icon(Icons.female, color: Colors.white, size: 80,),
                            SizedBox(height: 20,),
                            Text("Female", style: TextStyle(fontSize: 20, color: Colors.grey),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xff1D1F33)),
                  child: Column(
                    children: [
                    Text("height", style: TextStyle(fontSize: 20, color: Colors.grey),),
                    Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "$userHeight", style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),),
                            TextSpan(text: "cm", style: TextStyle(fontSize: 18, color: Colors.grey), )
                          ]
                        )),
                      Slider(
                          value: userHeight ,
                          onChanged: (value){
                            setState(() {
                              userHeight = value;
                            });
                          },
                        min: 10,
                        max: 200,
                      ),
                ]
                  )
                ),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xff1D1F33)),
                        child: Column(
                          children: [
                            Text("Weight", style: TextStyle(fontSize: 20, color: Colors.grey),),
                            Text("$userWeight", style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white24),
                                    child: IconButton(
                                        onPressed: (){
                                          setState(() {
                                            userWeight = userWeight + 1;
                                          });
                                        },
                                        icon: Icon(Icons.add, color: Colors.white, size: 40,)
                                    )
                                ),
                                SizedBox(width: 10,),
                                Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white24),
                                    child: IconButton(
                                        onPressed: (){
                                          setState(() {
                                            userWeight = userWeight - 1;
                                          });
                                        },
                                        icon: Icon(Icons.minimize_rounded, color: Colors.white, size: 40)
                                    )
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xff1D1F33)),
                      child: Column(
                        children: [
                          Text("Age", style: TextStyle(fontSize: 20, color: Colors.grey),),
                          Text("$userAge", style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white24),
                                  child: IconButton(
                                      onPressed: (){
                                        setState(() {
                                          userAge ++;
                                        });
                                      },
                                      icon: Icon(Icons.add, color: Colors.white, size: 40,)
                                  )
                              ),
                              SizedBox(width: 10,),
                              Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white24),
                                  child: IconButton(
                                      onPressed: (){
                                        setState(() {
                                          userAge --;
                                        });
                                      },
                                      icon: Icon(Icons.minimize_rounded, color: Colors.white, size: 40)
                                  )
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: (){
              bmi = (userWeight / ((userHeight * 0.01) * 2));
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ResultPage(bmi: bmi,)));
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Calculate", style:TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),),
            ),
            minWidth: double.maxFinite,
            color: Color(0xffEB1655),

          )
        ],
      ),
    );
  }
}
