import 'package:dynatrace_flutter_plugin/dynatrace_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartfleet/allpadScreen.dart';
import 'package:smartfleet/annualScreen.dart';
import 'package:smartfleet/bottom.dart';
import 'package:smartfleet/confirmationscreen.dart';
import 'package:smartfleet/header.dart';
import 'package:smartfleet/settingscreej.dart';
import 'package:smartfleet/subscriptionreview.dart';
import 'package:smartfleet/utility/dynatrace_utility.dart';

class Constants {
  //Navigation Names:
  static const String HOME_NAV = 'sensoriNav';
  static const String ALLPADS_NAV = 'allpadsNav';
  static const String CONFIRMATION_NAV = 'confirmationNav';
  static const String ANNUALSCREEN_NAV = 'annualNav';
  static const String SETTINGS_NAV = 'settingseNav';
  static const String REVIEW_NAV = 'reviewNav';

  //Pages Names:
  static const String HOME_PAGE = 'Home Screen';
  static const String PROFILE_PAGE = 'Profile Screen';
  static const String PRODUCT_PAGE = 'Product Screen';
}

class UndefinedView extends StatelessWidget {
  final String? name;
  const UndefinedView({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text('No route defined here!'),
      ),
    );
  }
}

void main() {
//Dynatrace().startWithoutWidget();
//runApp(MyApp());
  Dynatrace().start(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: sensori(),
      theme: ThemeData(
          fontFamily: 'josefinsans',
          primarySwatch: Colors.red,
          primaryColor: Colors.white,
          unselectedWidgetColor: Colors.grey),
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => UndefinedView(
                name: settings.name!,
              )),
      initialRoute: Constants.HOME_NAV,
      routes: {
        Constants.HOME_NAV: (context) => sensori(),
        Constants.ALLPADS_NAV: (context) => allpadScreen(),
        Constants.ANNUALSCREEN_NAV: (context) => const annualScreen(),
        Constants.CONFIRMATION_NAV: (context) => const confirmationScreen(),
        Constants.SETTINGS_NAV: (context) => const SettingScreen(),
      },
      navigatorObservers: [DynatraceNavigationObserver()],
    );
  }
}

class sensori extends StatefulWidget {
  const sensori({super.key});
  @override
  State<sensori> createState() => _sensoriState();
}

class _sensoriState extends State<sensori> {
  @override
  void initState() {
    super.initState();
    DynatraUtility.userPrivacyOptionsAllOn();
    DynatraUtility.tagUser("Velmurugan");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          const headerscreen(),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .25,
                width: MediaQuery.of(context).size.width * 0.90,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 14, 14, 14),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Buy a new Sensori Subscription",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Get Sensori’s most powerful real-time insights\nwherever you go with a customizable subscription.\nStarting a new subscription is quick and easy, \nso let’s get started",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "What kind of subscription would you like?",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 4),
              annualcard(),
              SizedBox(
                height: 20,
              ),
              padcard()
            ],
          )
        ],
      )),
      bottomNavigationBar: bottomBarWidget(),
    );
  }

  annualcard() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Constants.ANNUALSCREEN_NAV);
        // Navigator.push(context,MaterialPageRoute(builder: (context) =>annualScreen()));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .13,
                  width: MediaQuery.of(context).size.width * 0.01,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.83,
                      color: Color.fromARGB(255, 14, 14, 14),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  "Annual",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Covers all well pads for 12 months from the date of purchase",
                                  style: TextStyle(color: Colors.white54),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.70,
                          height: MediaQuery.of(context).size.height * 0.04,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 14, 14, 14)),
                            color: Color.fromARGB(255, 14, 14, 14),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.13,
                            height: MediaQuery.of(context).size.height * 0.04,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20))),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  padcard() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .13,
                width: MediaQuery.of(context).size.width * 0.01,
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.83,
                    color: Color.fromARGB(255, 14, 14, 14),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                "Pad",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Covers specified well pad for the duration of the project",
                                style: TextStyle(color: Colors.white54),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.70,
                        height: MediaQuery.of(context).size.height * 0.04,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 14, 14, 14)),
                          color: Color.fromARGB(255, 14, 14, 14),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.13,
                          height: MediaQuery.of(context).size.height * 0.04,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20))),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
