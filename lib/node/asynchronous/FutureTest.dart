

Future<String> fetchUserOrder(){
  return Future.delayed(const Duration(seconds: 2),()=> 'Large Latte');
}

Future<String> createOrderMessage() async{
  var order =await fetchUserOrder();
  return 'Your order is: $order';
}

void main() async{
  print('Fetching user order...');
  print(await createOrderMessage());
  print('Fetching user order end');
  // fetchUserOrder();
  // print('Fetching user order...');
}