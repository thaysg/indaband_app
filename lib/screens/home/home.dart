import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indaband_app/components/body.dart';
import 'package:indaband_app/components/constants.dart';
import 'package:indaband_app/components/text_widget.dart';
import 'package:indaband_app/screens/player_screen.dart/player_screen.dart';
import 'home_controller.dart/home_controller.dart';
import 'home_controller.dart/home_state.dart';
import 'widgets/images_card/most_played.dart';
import 'widgets/images_card/row_widget.dart';
import 'widgets/search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getHome();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    ).then((_) {
      SystemChrome.setEnabledSystemUIOverlays([]);
      WidgetsFlutterBinding.ensureInitialized();
    });
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          backgroundColor: primaryColor,
          elevation: 0,
        ),
        body: BodyScreen(
          myWidget: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: ListView(
              children: [
                TextWidget(
                  title: 'Discover',
                  textStyle: textTitle,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return SearchScreen();
                    }));
                  },
                  child: Hero(
                    tag: 'search_screen',
                    child: Container(
                      height: 48,
                      width: 327,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.fromBorderSide(
                          BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Pesquisar',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 230,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: controller.home!
                          .map(
                            (e) => RowWidget(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 600),
                                    transitionsBuilder: (context, animation,
                                        animationTime, child) {
                                      animation = CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.easeInCirc,
                                      );
                                      return ScaleTransition(
                                        alignment: Alignment.center,
                                        scale: animation,
                                        child: child,
                                      );
                                    },
                                    pageBuilder: (
                                      context,
                                      animation,
                                      animationTime,
                                    ) {
                                      return PlayerScreen(
                                        title: e.title,
                                        playScreen: e.info,
                                      );
                                    },
                                  ),
                                );
                              },
                              title: e.title,
                              picture: e.image,
                              band: e.band,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                TextWidget(
                  title: 'Most Played',
                  textStyle: textCategories,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 8,
                  width: MediaQuery.of(context).size.width * 6,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: controller.home!
                        .map(
                          (e) => MostPlayedWidget(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 600),
                                  transitionsBuilder: (context, animation,
                                      animationTime, child) {
                                    animation = CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeInCirc,
                                    );
                                    return ScaleTransition(
                                      alignment: Alignment.center,
                                      scale: animation,
                                      child: child,
                                    );
                                  },
                                  pageBuilder: (
                                    context,
                                    animation,
                                    animationTime,
                                  ) {
                                    return PlayerScreen(
                                      title: e.title,
                                      playScreen: e.info,
                                    );
                                  },
                                ),
                              );
                            },
                            title: e.title,
                            picture: e.image,
                            band: e.band,
                          ),
                        )
                        .toList(),
                  ),
                ),

                // ignore: unnecessary_null_comparison
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
      );
    }
  }
}
