import 'package:flutter/material.dart';

class gitaHomePage extends StatelessWidget {
  const gitaHomePage({super.key});

  @override

Widget build(BuildContext context) {
  //  GitaProvider gitaProvider=Provider.of(context);
  double height=MediaQuery.of(context).size.height;
  double width=MediaQuery.of(context).size.width;
  return Scaffold(

    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: GestureDetector(
        onDoubleTap: () {
          Navigator.of(context).pushNamed('/home2');
        },
        child: Container(
          height: height*0.999,
          width: width*0.999,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/images/krishnaa.webp'
                  )
              )
          ),
          // child:ListView.builder(
          //   itemCount: gitaProvider.gitaList.length,
          //   itemBuilder: (context, index) => ListTile(
          //   title:  Text(gitaProvider.gitaList[index].chapterNumber as String),
          // ),),

        ),
      ),
    ),
  );
}
}
int index=0;