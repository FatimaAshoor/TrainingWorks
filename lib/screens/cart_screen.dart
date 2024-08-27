import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_works/services/shopping_cart_service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  ShoppingCartService service = ShoppingCartService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              service.clearCart();
            });
          }, icon: Icon(Icons.restore_from_trash_rounded))
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: FutureBuilder(
                  future: service.showCartProducts(),
                  builder: (context, snap){
                    if(snap.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    }
                    else if (snap.connectionState==ConnectionState.done){
                      if(snap.hasError){
                        return Center(child: Text("ERROR", style: TextStyle(fontSize: 30.sp),),);
                      }
                      if(snap.hasData){
                        return ListView.builder(
                            itemCount: snap.data!.length,
                            itemBuilder: (context, i){
                              return Card(
                                child: ListTile(
                                  title: Text("${snap.data?[i]["name"]}", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),),
                                  subtitle: Text("${snap.data?[i]["description"]}", style: TextStyle(fontSize: 18.sp),),
                                  leading: Text("${snap.data?[i]["price"]}", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),),
                                  trailing: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        service.removeFromCart(snap.data?[i]["id"]);

                                      });
                                    },
                                    icon: Icon(Icons.remove_circle_outline_rounded, color: Colors.red,),
                                  ),

                                ),
                              );
                            });
                      }

                      else{
                        return Text("This Cart Is Empty", style: TextStyle(fontSize: 60.sp),);
                      }
                    }

                    return Text("");

                  }),
            ),
            Divider(thickness: 2, color: Colors.red,),
            FutureBuilder(
                future: service.totalCount(),
                builder: (context, snap){
                  if(snap.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }
                  else if (snap.connectionState==ConnectionState.done){
                    if(snap.hasError){
                      return Center(child: Text("ERROR", style: TextStyle(fontSize: 30.sp),),);
                    }
                    if(snap.hasData){
                      return Text("Total = ${snap.data!.toString()}", style: TextStyle(fontSize: 26.sp),);
                    }
                    else{
                      return Text("Total = 0.0", style: TextStyle(fontSize: 26.sp),);
                    }
                  }

                  return Text("");

                }),

          ],
        ),
      ),
    );
  }
}
