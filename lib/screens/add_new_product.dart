import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_works/services/shopping_cart_service.dart';
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

  ShoppingCartService service = ShoppingCartService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Products",style: TextStyle(fontSize: 24.sp),),
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
                    hintStyle: TextStyle(fontSize: 30.sp, color: Colors.grey)
                ),
              ),
              SizedBox(height: 10.h,),
              TextField(
                controller: productDes,
                decoration: InputDecoration(
                    hintText: "write the description here",
                    hintStyle: TextStyle(fontSize: 18.sp, color: Colors.grey)
                ),
              ),
              TextField(
                controller: productPrice,
                decoration: InputDecoration(
                    hintText: "write the price here",
                    hintStyle: TextStyle(fontSize: 18.sp, color: Colors.grey)
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await service.addNewProduct(productName.text, productDes.text,double.parse(productPrice.text));
          Navigator.of(context).pushNamed("products");
        },
        child:  Icon(Icons.check),
      ),
    );
  }
}
