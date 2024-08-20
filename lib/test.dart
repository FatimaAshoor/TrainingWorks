import 'package:flutter/material.dart';
class CalculatorScreen extends StatelessWidget {
  final List<String> buttons = ['AC', '+/-', '%', '÷', '7', '8', '9', 'x', '4', '5', '6', '-', '1', '2', '3', '+', '0', '.', '='];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[300],
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(16.0),
              child: Text(
                '0',
                style: TextStyle(fontSize: 48.0),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.0,
              ),
              itemCount: buttons.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add button press logic here
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: index == 0 || index == 1 || index == 2 || index % 4 == 3
                          ? Colors.orange
                          : Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      buttons[index],
                      style: TextStyle(fontSize: 24.0),
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