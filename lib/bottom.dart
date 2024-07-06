import 'package:flutter/material.dart';
import 'package:smartfleet/allpadScreen.dart';
import 'package:smartfleet/annualScreen.dart';
import 'package:smartfleet/main.dart';
import 'package:smartfleet/settingscreej.dart';
import 'package:smartfleet/utility/dynatrace_utility.dart';

class bottomBarWidget extends StatefulWidget {
  const bottomBarWidget({Key? key}) : super(key: key);

  @override
  State<bottomBarWidget> createState() => _bottomBarWidgetState();
}

class _bottomBarWidgetState extends State<bottomBarWidget> {
  int currentIndex = 1;
  @override
  void initState() {
    super.initState();
    //DynatraUtility.userPrivacyOptionsAllOn();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 14, 14, 14),
          ),
          height: 80,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 0;
                          Navigator.pushNamed(context, Constants.ALLPADS_NAV);

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => allpadScreen())

                          // );
                        });
                        // Navigate to the screen for the first icon
                      },
                      child: Column(
                        children: [
                          Icon(Icons.view_column,
                              color: currentIndex == 0
                                  ? Colors.white
                                  : Colors.grey),
                          Text(
                            "All pads",
                            style: TextStyle(
                                color: currentIndex == 0
                                    ? Colors.white
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          DynatraUtility.singleAction("SubscriptionMenuTab");

                          currentIndex = 1;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => annualScreen()));
                        });
                        // Navigate to the screen for the second icon
                      },
                      child: Column(
                        children: [
                          Icon(Icons.checklist_sharp,
                              color: currentIndex == 1
                                  ? Colors.white
                                  : Colors.grey),
                          Text(
                            "Subscription",
                            style: TextStyle(
                                color: currentIndex == 1
                                    ? Colors.white
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 2;
                          DynatraUtility.singleAction("SettingsMenuTab");
                        });

                        Navigator.pushNamed(context, Constants.SETTINGS_NAV);

                        // Navigate to the SettingScreen when tapping the third icon
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => SettingScreen(
                        //         // initialSwitchState: false, // Provide initial state
                        //         // onSwitchStateChanged: (newState) {
                        //         //   // Handle switch state changes if needed
                        //         // },
                        //         ),
                        //   ),
                        // );
                      },
                      child: Column(
                        children: [
                          Icon(Icons.settings,
                              color: currentIndex == 2
                                  ? Colors.white
                                  : Colors.grey),
                          Text(
                            "Settings",
                            style: TextStyle(
                                color: currentIndex == 2
                                    ? Colors.white
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:smartfleet/annualScreen.dart';
// import 'package:smartfleet/controller/BottomBarController.dart';
// import 'package:smartfleet/enumFiles.dart';
// import 'package:smartfleet/main.dart';
// import 'package:smartfleet/settingscreej.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// class BottomBar extends StatefulWidget {
//   const BottomBar({super.key});

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   int selectedIndex = 0;
//   List pages = [annualScreen(), SettingScreen(initialSwitchState: false, onSwitchStateChanged: (newState ) {

//    },)];
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//     ));
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Colors.white,
//           onTap: (value) {
//             setState(() {
//               selectedIndex = value;
//             });
//           },
//           selectedItemColor: Color(0xffb5054d),
//           unselectedItemColor: Colors.black,
//           currentIndex: selectedIndex,
//           showUnselectedLabels: true,
//           selectedLabelStyle: TextStyle(fontSize: 12),
//           unselectedLabelStyle: TextStyle(fontSize: 12),
//           type: BottomNavigationBarType.fixed,
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.view_column), label: "Home"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.checklist_sharp), label: "Rewards"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.settings,), label: "Offers & News"),

//           ]),
//       body: pages[selectedIndex],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:smartfleet/annualScreen.dart';
// import 'package:smartfleet/controller/BottomBarController.dart';
// import 'package:smartfleet/enumFiles.dart';
// import 'package:smartfleet/main.dart';
// import 'package:smartfleet/settingscreej.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// // ignore: must_be_immutable
// class BottomBarWidget extends StatefulWidget {
//   BottomBar? type;
//   BottomBarWidget({this.type});

//   @override
//   State<BottomBarWidget> createState() => _BottomBarWidgetState();
// }

// class _BottomBarWidgetState extends State<BottomBarWidget> {
//   final bottomBarController = Get.put(BottomBarController());
//   @override
//   Widget build(BuildContext context) {
//     return widget.type == BottomBar.FromHomeScreen
//         ? Obx(() => CurvedNavigationBar(
//               height: 40,
//               buttonBackgroundColor: Colors.red,
//               color: Color.fromARGB(255, 40, 40, 40),
//               backgroundColor: Colors.transparent,
//               index: bottomBarController.pageIndex.value,
//               items: <Widget>[
//                   Column(
//                         children: [
//                           Icon(Icons.view_column,
//                               color: bottomBarController.pageIndex.value == 0
//                               ? Colors.white
//                                     : Colors.grey),
//                           Text(
//                             "All pads",
//                             style: TextStyle(
//                                 color: bottomBarController.pageIndex.value == 0
//                               ? Colors.white
//                                     : Colors.grey),
//                           )
//                         ],
//                       ),
//                Column(
//                         children: [
//                           Icon(Icons.checklist_sharp,
//                               color: bottomBarController.pageIndex.value == 1
//                                   ? Colors.white
//                                   : Colors.grey),
//                           Text(
//                             "Subscription",
//                             style: TextStyle(
//                                 color: bottomBarController.pageIndex.value == 1
//                                     ? Colors.white
//                                     : Colors.grey),
//                           )
//                         ],
//                       ),
//                  Column(
//                         children: [
//                           Icon(Icons.settings,
//                               color:bottomBarController.pageIndex.value == 2
//                                   ? Colors.white
//                                   : Colors.grey),
//                           Text(
//                             "Settings",
//                             style: TextStyle(
//                                 color: bottomBarController.pageIndex.value == 2
//                                     ? Colors.white
//                                     : Colors.grey),
//                           )
//                         ],
//                       ),

//               ],
//               onTap: (_index) {
//                 bottomBarController.changePageIndex(_index);
//                 //Handle button tap
//               },
//             ))
//         : BottomNavigationBar(
//           backgroundColor: Colors.black,
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.grey,
//             onTap: (_index) {
//               bottomBarController.changePageIndex(_index);
//               //Handle button tap

//               Get.offAll(sensori());
//             },
//             items: [
//                 BottomNavigationBarItem(
//                     label: 'All pads',
//                     icon: Icon(
//                       Icons.view_column,
//                       size: 30,
//                       color: Colors.grey,
//                     )),
//                 BottomNavigationBarItem(
//                     label: 'Subscription',
//                     icon: Icon(
//                       Icons.checklist_sharp,
//                       size: 30,
//                       color:Colors.grey
//                     )),
//                 BottomNavigationBarItem(
//                     label: 'Settings',
//                     icon: Icon(
//                       Icons.settings,
//                       size: 30,
//                       color: Colors.grey
//                     )),

//               ]);
//   }
// }
