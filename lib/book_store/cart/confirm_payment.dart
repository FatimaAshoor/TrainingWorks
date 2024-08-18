import 'cart_list.dart';

confirmPayment(){
  if(cartList.isEmpty){
    print( "Your Cart is Empty Now");
  }
  else{
    print( "Your Payment Succeeded , Your balance now $balance");
  }
}
