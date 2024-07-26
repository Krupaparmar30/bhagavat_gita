import 'package:bhagavat_gita/bhagvat_gita/provider/gita_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class splashPage extends StatelessWidget {
  const splashPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(

      // appBar: AppBar(
      //   title: Text("Home Page"),
      // ),
      body:
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              height: height*0.999,
              width: width*.999,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/bg2.jpg'
                      )
                  )
              ),

              child:  GestureDetector(
                onDoubleTap: () {
                  Navigator.of(context).pushNamed('/home');
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
                  child: Container(

                    height: height*0.1,
                    width: width*0.1,
                    decoration: BoxDecoration(
                        image: DecorationImage(

                            image: AssetImage(

                                'assets/images/home.png'
                            )
                        )
                    ),

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}