import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:articles/ListArticles.dart';

void main() => runApp(MyApp());

/** MyApp
 
 The main entry point
 Uses GetX for state management
*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ceylon Bookshop',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        primarySwatch: Colors.blueGrey,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey,
        ),
      ),
      home: ListArticles(),
    );
  }
}
