import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../modal/gita_modal.dart';
import '../../../provider/gita_provider.dart';
import '../../../provider/home_page_provider/home_page_provider.dart';
import '../../../provider/shlok_page_provider/shlok_page_provider.dart';
import '../../../provider/theme_provider/theme_provider.dart';
import '../gitaHomePage/gitaHomePage.dart';
import '../gitaHomePage2/gitaHomePage2.dart';
import 'dart:ui' as ui;

class gitaShlokPage extends StatelessWidget {
  const gitaShlokPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    GitaProvider gitaProvider = Provider.of<GitaProvider>(context);
    HomePageProvider homePageProviderTrue =
        Provider.of<HomePageProvider>(context, listen: true);
    HomePageProvider homePageProviderFalse =
        Provider.of<HomePageProvider>(context, listen: false);
    ShlokPageProvider shlokPageProviderTrue =
        Provider.of<ShlokPageProvider>(context, listen: true);
    ShlokPageProvider shlokPageProviderFalse =
        Provider.of<ShlokPageProvider>(context, listen: false);
    ThemeProvider themeProviderTrue =
        Provider.of<ThemeProvider>(context, listen: true);
    ThemeProvider themeProviderFalse =
        Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: (themeProviderTrue.isDark)
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.onSecondary,
      appBar: AppBar(
        backgroundColor: (themeProviderTrue.isDark)
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onSecondary,
        title: Text(

          (shlokPageProviderTrue.selLan == "Sanskrit")
              ? gitaProvider.gitaList[selIndex].chapterNumber.sanskrit
              : (shlokPageProviderTrue.selLan == "Hindi")
                  ? gitaProvider.gitaList[selIndex].chapterNumber.hindi
                  : (shlokPageProviderTrue.selLan == "English")
                      ? gitaProvider.gitaList[selIndex].chapterNumber.english
                      : gitaProvider.gitaList[selIndex].chapterNumber.gujarati,
          style: TextStyle(
            color:  (themeProviderTrue.isDark)
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.primary,
          ),
        ),
        actions: [

          DropdownButton(
            value: shlokPageProviderTrue.selLan,
            items: <String>['Sanskrit', 'Hindi', 'English', 'Gujarati']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
            onChanged: (String? value) {
              shlokPageProviderFalse.languageTranslate(value!);
            },
            style: TextStyle(
              color:  (themeProviderTrue.isDark)
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: height * 1,
              width: width * 1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(imageList[selIndex]))),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.020,
                    ),
                    ...List.generate(
                      verses.length,
                      (index) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: height * 0.250,
                              width: width * 0.99,
                              decoration: BoxDecoration(
                                  color: (themeProviderTrue.isDark)
                                      ? Theme.of(context).colorScheme.onSecondary
                                      : Theme.of(context).colorScheme.onSecondary,
                                  borderRadius: BorderRadius.circular(10),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //       color: pri,
                                  //       offset: Offset(0, 2),
                                  //       blurRadius: 2,
                                  //       spreadRadius: 2)
                                  // ]),
                              ),child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, top: 5),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: height * 0.3,
                                      width: width * 0.8,
                                      child: GestureDetector(
                                        onDoubleTap: () {
                                          selIndex = index;
                                          verses = gitaProvider
                                              .gitaList[selIndex].verses;
                                          Navigator.of(context)
                                              .pushNamed('/sec');
                                        },
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text(

                                                (shlokPageProviderTrue.selLan ==
                                                        "Sanskrit")
                                                    ? gitaProvider
                                                        .gitaList[selIndex]
                                                        .verses[index]
                                                        .text
                                                        .sanskrit
                                                    : (shlokPageProviderTrue
                                                                .selLan ==
                                                            "Hindi")
                                                        ? gitaProvider
                                                            .gitaList[selIndex]
                                                            .verses[index]
                                                            .text
                                                            .hindi
                                                        : (shlokPageProviderTrue
                                                                    .selLan ==
                                                                "English")
                                                            ? gitaProvider
                                                                .gitaList[selIndex]
                                                                .verses[index]
                                                                .text
                                                                .english
                                                            : gitaProvider
                                                                .gitaList[selIndex]
                                                                .verses[index]
                                                                .text
                                                                .gujarati,
                                                style: TextStyle(
                                                  color: pri,
                                                  fontSize: 18,
                                                ),
                                              ),

                                            ),


                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color pri = Color(0xff43180c);
List<Verse> verses = [];
List imageList = [
  'assets/images/krishnaa.webp',
  'assets/images/1.jpg',
  'assets/images/2.jpg',
  'assets/images/4.jpg',
  'assets/images/4.jpg',
  'assets/images/6.jpg',
  'assets/images/7.jpg',
  'assets/images/krishnaa.webp',
  'assets/images/1.jpg',
  'assets/images/2.jpg',
  'assets/images/4.jpg',
  'assets/images/4.jpg',
  'assets/images/6.jpg',
  'assets/images/7.jpg',
  'assets/images/krishnaa.webp',
  'assets/images/1.jpg',
  'assets/images/2.jpg',

];
