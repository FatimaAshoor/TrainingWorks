import 'package:flutter/material.dart';
import '../db/sql_db.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {

  TextEditingController productName =TextEditingController();
  TextEditingController productDes =TextEditingController();
  TextEditingController productPrice =TextEditingController();

  SqlDb sqlDb = SqlDb();

  Future<int> addNewProduct() async {
    int response = await sqlDb.insertData("INSERT INTO products (name, description, price) VALUES ('${productName.text}', '${productDes.text}', '${double.parse(productPrice.text)}')");
    print("---------------------------------------------------------- inserted to products");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Products",style: TextStyle(fontSize: 24),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: productName,
                decoration: InputDecoration(
                    hintText: "write the name here",
                    hintStyle: TextStyle(fontSize: 30, color: Colors.grey)
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: productDes,
                decoration: InputDecoration(
                    hintText: "write the description here",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.grey)
                ),
              ),
              TextField(
                controller: productPrice,
                decoration: InputDecoration(
                    hintText: "write the price here",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.grey)
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          addNewProduct();
          Navigator.of(context).pushNamed("products");
        },
        child:  Icon(Icons.check),
      ),
    );
  }
}
