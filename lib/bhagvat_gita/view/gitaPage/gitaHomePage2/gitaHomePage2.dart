import 'package:bhagavat_gita/bhagvat_gita/provider/gita_provider.dart';
import 'package:bhagavat_gita/bhagvat_gita/provider/home_page_provider/home_page_provider.dart';
import 'package:bhagavat_gita/bhagvat_gita/provider/shlok_page_provider/shlok_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/theme_provider/theme_provider.dart';
import '../gitaShlokPage/gitaShlokPage.dart';
import '../splash_screen/splash_scree.dart';

class gitaHomePage2 extends StatelessWidget {
  const gitaHomePage2({super.key});

  @override
  Widget build(BuildContext context) {
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

          (shlokPageProviderTrue.selLan == 'Sanskrit')
              ? change[0]
              : (shlokPageProviderFalse.selLan == 'Hindi')
                  ? change[1]
                  : (shlokPageProviderTrue.selLan == 'English')
                      ? change[2]
                      : change[3],
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
          ),
          SizedBox(
            width: 20,
          ),
          Switch(
            inactiveThumbColor: Theme.of(context).colorScheme.onPrimary,
            activeColor: Theme.of(context).colorScheme.onPrimary,
            focusColor: Theme.of(context).colorScheme.primary,
            inactiveTrackColor: Theme.of(context).colorScheme.primary,
            value: themeProviderTrue.isDark,
            onChanged: (value) {
              themeProviderFalse.themeChange();
            },
          ),


        ],
      ),
      body:
      ListView.builder(
          itemCount: gitaProvider.gitaList.length,
          itemBuilder: (context, index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onDoubleTap: () {

                        selIndex=index;
                         verses = gitaProvider.gitaList[selIndex].verses;
                        Navigator.of(context).pushNamed('/shlok');
                      },
                      child:
                      Container(
                        height: 100,
                        width: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color:  (themeProviderTrue.isDark)
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.primary,
                        ),
                        //   gitaProvider.gitaList[index].chapter.toString(),
                        child:
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Text(
                                gitaProvider.gitaList[index].chapter.toString(),
                                style: TextStyle(
                                    color: Colors.orangeAccent, fontSize: 22),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Text(
                                (shlokPageProviderTrue.selLan == "Sanskrit")
                                    ? gitaProvider
                                        .gitaList[index].chapterNumber.sanskrit
                                    : (shlokPageProviderTrue.selLan == "Hindi")
                                        ? gitaProvider
                                            .gitaList[index].chapterNumber.hindi
                                        : (shlokPageProviderTrue.selLan ==
                                                "English")
                                            ? gitaProvider.gitaList[index]
                                                .chapterNumber.english
                                            : gitaProvider.gitaList[index]
                                                .chapterNumber.gujarati,
                                style: TextStyle(
                                    color: Colors.orangeAccent, fontSize: 22),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
    );
  }
}

List change = [
  'अध्यायः',
  'अध्याय',
  'Chapter',
  'પ્રકરણ',
];
int selIndex=0;