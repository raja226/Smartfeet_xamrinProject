import 'package:flutter/material.dart';
import 'package:smartfleet/utility/dynatrace_utility.dart';

class headerscreen extends StatefulWidget {
  const headerscreen({super.key});

  @override
  State<headerscreen> createState() => _headerscreenState();
}

class _headerscreenState extends State<headerscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75,
        width: double.infinity,
        color: const Color.fromARGB(255, 165, 23, 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  DynatraUtility.singleAction("Notification");
                  DynatraUtility.reportCrash();
                },
                icon: Icon(
                  Icons.notification_add_outlined,
                  color: Colors.white,
                )),
            Text(
              "Sensori",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            IconButton(
                onPressed: () {
                  DynatraUtility.singleAction("Profile");
                  DynatraUtility.forceErrors();
                },
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.white,
                ))
          ],
        ));
  }
}
