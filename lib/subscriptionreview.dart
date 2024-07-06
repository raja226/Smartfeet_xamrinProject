import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartfleet/annualScreen.dart';
import 'package:smartfleet/bottom.dart';
import 'package:smartfleet/confirmationscreen.dart';
import 'package:smartfleet/header.dart';
import 'package:smartfleet/main.dart';
import 'package:smartfleet/utility/dynatrace_utility.dart';

class reviewscreen extends StatefulWidget {
  final bool pageclicked;
  final bool pageclicked1;
  const reviewscreen(
      {Key? key, required this.pageclicked, required this.pageclicked1})
      : super(key: key);

  @override
  State<reviewscreen> createState() => _reviewscreenState();
}

class _reviewscreenState extends State<reviewscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            headerscreen(),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            //DynatraUtility.navigateScreen("annualScreen");
                            Navigator.pushNamed(
                                context, Constants.ANNUALSCREEN_NAV);

                            // Navigator.push(context,MaterialPageRoute(builder: (context) =>annualScreen()));
                          },
                          icon: Icon(
                            Icons.keyboard_backspace_outlined,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 80,
                      ),
                      Text(
                        'Subscription Review',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Color.fromARGB(115, 55, 53, 53),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "PREWIT-BARBARO 23 1 FEE",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.50,
                  width: MediaQuery.of(context).size.height * 0.50,
                  child: Column(
                    children: [
                      if (widget.pageclicked) crosswell(),
                      SizedBox(
                        height: 10,
                      ),
                      if (widget.pageclicked1) nearwell(),
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    DynatraUtility.singleAction("Send Purchase Request");
                   // DynatraUtility.navigateScreen(Constants.CONFIRMATION_NAV);
                    Navigator.pushNamed(context, Constants.CONFIRMATION_NAV);

                    // Navigator.push(context,MaterialPageRoute(builder: (context) =>confirmationScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Text('Send Purchase Request',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Read more about subscription option",
              style: TextStyle(color: Colors.white, fontSize: 13),
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomBarWidget(),
    );
  }

  Column nearwell() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .11,
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
                    width: MediaQuery.of(context).size.width * 0.86,
                    height: MediaQuery.of(context).size.height * 0.15,
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Near Well",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                    DynatraUtility.reportValue<String>("Months", "12",buttonName: "Near Well Edit",fromButton: true);
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Annual Subscription",
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
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.04,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 14, 14, 14)),
                          color: Color.fromARGB(255, 14, 14, 14),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.47,
                          height: MediaQuery.of(context).size.height * 0.04,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(115, 55, 53, 53),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 19, top: 10),
                            child: Text(
                              "Build monthly over 12 months",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column crosswell() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .11,
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
                    width: MediaQuery.of(context).size.width * 0.86,
                    height: MediaQuery.of(context).size.height * 0.15,
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Cross Well",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      onPressed: () {
                        DynatraUtility.reportValue<String>("Months", "12",buttonName: "Cross Well Edit",fromButton: true);

                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Annual Subscription",
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
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.04,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 14, 14, 14)),
                          color: Color.fromARGB(255, 14, 14, 14),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.47,
                          height: MediaQuery.of(context).size.height * 0.04,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(115, 55, 53, 53),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 19, top: 10),
                            child: Text(
                              "Build monthly over 12 months",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
