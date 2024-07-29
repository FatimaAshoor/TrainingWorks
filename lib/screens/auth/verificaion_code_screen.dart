import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constant/colors.dart';
class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: MovieColors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 64,
                  height: 68,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: MovieColors.lightGrey, width: 1.5)
                  ),
                  child: Center(
                    child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: MovieColors.white
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ]
                    ),
                  ),
                ),

                Container(
                  width: 64,
                  height: 68,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: MovieColors.lightGrey, width: 1.5)
                  ),
                  child: Center(
                    child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: MovieColors.white
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ]
                    ),
                  ),
                ),

                Container(
                  width: 64,
                  height: 68,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: MovieColors.lightGrey, width: 1.5)
                  ),
                  child: Center(
                    child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: MovieColors.white
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ]
                    ),
                  ),
                ),

                Container(
                  width: 64,
                  height: 68,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: MovieColors.lightGrey, width: 1.5)
                  ),
                  child: Center(
                    child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: MovieColors.white
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ]
                    ),
                  ),
                ),


              ],
            ),
            SizedBox(height: 60,),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't receive it? ", style: TextStyle(color: MovieColors.white, fontSize: 18)),
                InkWell(onTap: (){
                  Navigator.of(context).pushNamed("start");
                }, child: Text("Click here", style: TextStyle(color: MovieColors.yellow, fontSize: 18)),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
