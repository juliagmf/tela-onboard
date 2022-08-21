import 'package:onboarding/home.dart';
import 'package:onboarding/onboard/onboard_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'assets/t1on.png',
      text: "Lorem Ipsum ",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
      bg: Colors.white,
      button: Color(0xFFFFC107),
    ),
    OnboardModel(
      img: 'assets/t2on.png',
      text: "Lorem Ipsum ",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
      bg: Colors.white,
      button: Color(0xFFFFC107),
    ),
    OnboardModel(
      img: 'assets/t3on.png',
      text: "Lorem Ipsum",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
      bg: Colors.white,
      button: Color(0xFFFFC107),
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
            itemCount: screens.length,
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(screens[index].img),
                  Container(
                    height: 10.0,
                    child: ListView.builder(
                      itemCount: screens.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                //bolinhas
                                margin: EdgeInsets.symmetric(horizontal: 3.0),
                                width: currentIndex == index ? 25 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? kbrown
                                      : kbrown300,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ]);
                      },
                    ),
                  ),
                  Text(
                    //texto da tela
                    screens[index].text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 27.0,
                      fontWeight: FontWeight.w800,
                      color: kblack,
                    ),
                  ),
                  Text(
                    screens[index].desc,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14.0,
                      color: kblack,
                    ),
                  ),
                  InkWell(
                    //botao de proximo
                    onTap: () async {
                      print(index);
                      if (index == screens.length - 1) {
                        await _storeOnboardInfo();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      }

                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceIn,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10),
                      decoration: BoxDecoration(
                          color: kamber,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Text(
                          "Next",
                          style: TextStyle(fontSize: 16.0, color: kwhite),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Icon(
                          Icons.arrow_forward_sharp,
                          color: kwhite,
                        )
                      ]),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
