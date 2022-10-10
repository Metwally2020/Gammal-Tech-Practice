import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:gammal_tech_practice/screens/my_web_view.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  var lang = 'en';
  late YoutubePlayerController youTubeController;
  @override
  void deactivate() {
    youTubeController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    youTubeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    const url = 'https://youtu.be/iCTEYPwvhCQ';
    youTubeController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags:YoutubePlayerFlags(
          autoPlay: false
        ) );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: youTubeController),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.teal,
          actions: [
            lang == 'en'
                ? Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: TextButton(
                      onPressed: () {
                        lang = 'ar';
                        setState(() {});
                      },
                      child: Text(
                        'عربى',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(color: Colors.white, fontSize: 26),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 12.0,top: 3),
                    child: TextButton(
                      onPressed: () {
                        lang = 'en';
                        setState(() {});
                      },
                      child: Text(
                        'English',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  )
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               
                
                Text(
                  'Gammal Tech \nFinal Exam Practice',
                  style: TextStyle(
                      wordSpacing: 1.5,
                      height: 1.5,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20,),
                player,
                Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  height: 30,
                ),
                lang == 'en'
                    ? Text(
                        'www.gammal.tech is the largest website in the middle east and this App is going to help you practice for Gammal Tech final exam',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            wordSpacing: 1.5,
                            height: 2,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.left,
                      )
                    : Text(
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            wordSpacing: 1.5,
                            height: 1.5,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.right,
                        'www.gammal.tech هو أكبر موقع إلكتروني في الشرق الأوسط وسيساعدك هذا التطبيق في التدرب على الامتحان النهائي لشركة Gammal Tech'),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyWebView(
                                title: 'Gammal Tech',
                                website: 'https://www.gammal.tech')));
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Center(
                      child: Text(
                        'Visit Gammal Tech',
                        style: TextStyle(
                            wordSpacing: 1.5,
                            height: 1.5,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
