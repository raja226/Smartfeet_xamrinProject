import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartfleet/bottom.dart';
import 'package:smartfleet/header.dart';
import 'package:smartfleet/main.dart';
import 'package:smartfleet/settingscreej.dart';
import 'package:smartfleet/subscriptionreview.dart';
import 'package:smartfleet/utility/dynatrace_utility.dart';

class annualScreen extends StatefulWidget {
  const annualScreen({Key? key});

  @override
  State<annualScreen> createState() => _annualScreenState();
}

class _annualScreenState extends State<annualScreen> {
  bool pageclicked = false;
  bool pageclicked1 = false;

  @override
  void initState() {
    super.initState();
    Get.put(SettingController());
  }

  @override
  Widget build(BuildContext context) {
    final settingController = Get.find<SettingController>();

    return Scaffold(
      // bottomNavigationBar: BottomBarWidget(
      //   type: BottomBar.FromHomeScreen,

      //   ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            headerscreen(),
            Container(
              margin: EdgeInsets.only(top: 20, left: 15, right: 15),
              width: double.infinity,
              color: Colors.black,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Constants.HOME_NAV);

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => sensori())
                              //         );
                            },
                            icon: Icon(
                              Icons.keyboard_backspace_outlined,
                              color: Colors.white,
                            )),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          'Annual Subscription',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What is this subscription for ?',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 2,
                    child: Column(
                      children: [
                        crosswell(context),
                        SizedBox(
                          height: 20,
                        ),
                        nearwell(settingController, context),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: (pageclicked || pageclicked1)
                                ? MaterialStateProperty.all(Colors.red)
                                : MaterialStateProperty.all(
                                    Color.fromARGB(255, 198, 93, 85)),
                          ),
                          onPressed: (pageclicked || pageclicked1)
                              ? () {

                              DynatraUtility.singleAction("Continue");
                              DynatraUtility.navigateScreen("reviewscreenNav");

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => reviewscreen(
                                              pageclicked: pageclicked,
                                              pageclicked1: pageclicked1)));
                                }
                              : null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Text('Continue',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Icon(Icons.arrow_circle_right_outlined,
                                  color: Colors.white)
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomBarWidget(),
    );
  }

  Visibility nearwell(
      SettingController settingController, BuildContext context) {
    return Visibility(
      visible: settingController.switchState.value,
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .11,
              width: MediaQuery.of(context).size.width * 0.01,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 165, 47, 39),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.87,
              height: MediaQuery.of(context).size.height * 0.16,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {

                        pageclicked1 = !pageclicked1;
                     DynatraUtility.reportValue<String>("CheckedStatus", pageclicked1.toString(),buttonName: "Near Well",fromButton: true);

                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(115, 47, 45, 45),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 20),
                                child: Text(
                                  'Near Well',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              pageclicked1 == false
                                  ? Text('hii')
                                  : Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 90),
                            child: Text(
                              'Data acquried from offset Wells',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container crosswell(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .11,
            width: MediaQuery.of(context).size.width * 0.01,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 165, 47, 39),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.87,
            height: MediaQuery.of(context).size.height * 0.16,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageclicked = !pageclicked;
                      DynatraUtility.reportValue<String>("CheckedStatus", pageclicked.toString(),buttonName: "Cross Well",fromButton: true);

                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(115, 47, 45, 45),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                'Cross Well',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            pageclicked == false
                                ? Text('hii')
                                : Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 90),
                          child: Text(
                            'Data acquried from offset Wells',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
