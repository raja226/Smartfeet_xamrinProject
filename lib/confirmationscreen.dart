import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartfleet/header.dart';
import 'package:smartfleet/main.dart';
import 'package:smartfleet/utility/dynatrace_utility.dart';

class confirmationScreen extends StatefulWidget {
  const confirmationScreen({super.key});

  @override
  State<confirmationScreen> createState() => _confirmationScreenState();
}

class _confirmationScreenState extends State<confirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Stack(
        children: [
          headerscreen(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15),
              width: MediaQuery.of(context).size.height * 0.35,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Receipt.png"),
                      fit: BoxFit.fitWidth)),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.10),
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.height * 0.70,
                child: Image.asset("assets/images/Success Icon.png")),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.50,
              height: MediaQuery.of(context).size.height * 0.05,
              margin: EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(115, 47, 45, 45),
                    ),
                  ),
                  onPressed: () {
                    DynatraUtility.singleAction("Done");
                   // DynatraUtility.navigateScreen(Constants.HOME_NAV);
                    Navigator.pushNamed(context, Constants.HOME_NAV);

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>sensori())
                    //         );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Text('Done',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      )),
    );
  }
}
