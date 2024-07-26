import 'package:bhagavat_gita/bhagvat_gita/provider/gita_provider.dart';
import 'package:bhagavat_gita/bhagvat_gita/provider/home_page_provider/home_page_provider.dart';
import 'package:bhagavat_gita/bhagvat_gita/provider/shlok_page_provider/shlok_page_provider.dart';
import 'package:bhagavat_gita/bhagvat_gita/provider/theme_provider/theme_provider.dart';
import 'package:bhagavat_gita/bhagvat_gita/view/gitaPage/splash_screen/splash_scree.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bhagvat_gita/view/gitaPage/gitaHomePage/gitaHomePage.dart';
import 'bhagvat_gita/view/gitaPage/gitaHomePage2/gitaHomePage2.dart';
import 'bhagvat_gita/view/gitaPage/gitaShlokPage/gitaShlokPage.dart';

void main()
{
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GitaProvider(),
        ),
        ChangeNotifierProvider(create: (context)=>HomePageProvider()),
        ChangeNotifierProvider(create: (context)=>ShlokPageProvider()),
        ChangeNotifierProvider(create: (context)=>ThemeProvider()),

      ],
     builder: (context,child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: Provider.of<ThemeProvider>(context).isDark?ThemeMode.dark:ThemeMode.light,
        theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Color(0xff43180c),
            secondary: Colors.orangeAccent,
            onSecondary: Colors.yellow.shade100,
          ),

        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.dark(
            primary: Colors.grey.shade50,
            secondary: Colors.black,
            onSecondary: Colors.grey.shade100

          )
        ),
        routes: {
          '/':(context)=>splashPage(),
          '/home':(context)=>gitaHomePage(),
          '/home2':(context)=>gitaHomePage2(),
          '/shlok':(context)=>gitaShlokPage(),

        },
      ),
    );
  }
}
