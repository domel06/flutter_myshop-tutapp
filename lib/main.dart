import 'package:flutter/material.dart';
import 'package:myshop/providers/cart.dart';
import 'package:myshop/providers/orders.dart';
import 'package:myshop/screens/cartScreen.dart';
import 'package:myshop/screens/detailScreen.dart';
import 'package:myshop/screens/order_screen.dart';
import 'package:myshop/screens/product_overview_screen.dart';
import 'package:myshop/screens/user_productScreen.dart';
import './providers/products.dart';
import 'package:provider/provider.dart'; //used to register the provider class to the widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider ( 
      providers:[
        ChangeNotifierProvider.value (
      value:  Products(),
        ),
        ChangeNotifierProvider.value(value:Cart()),
        ChangeNotifierProvider.value(value: Order())] ,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato'
        ),
        home:   ProductOverViewScreen(),
        routes: {
          DetailScreen.namedRoute : (ctx)=> DetailScreen(),
          CartScreen.routeName:(ctx)=>CartScreen(),
          OrderScreen.namedRoute:(ctx)=>OrderScreen(),
          UserProductScreen.namedRoute:(ctx)=>UserProductScreen(),
        },),
    );
      
  }
}







