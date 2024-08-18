void bookDetail( String name, int id, String author, List<String> category, double price, int quantity, String status){
  print("[$name]($id) --  Author: $author, Quantity: $quantity, Price: $price, Category: $category, status: ${quantity > 0? "Available":"Sold Out"}");
}