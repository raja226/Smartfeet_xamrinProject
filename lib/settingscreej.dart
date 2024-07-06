import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartfleet/bottom.dart';
import 'package:smartfleet/controller/BottomBarController.dart';
import 'package:smartfleet/header.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smartfleet/main.dart';
import 'package:smartfleet/utility/dynatrace_utility.dart';

class SettingScreen extends StatefulWidget {
 // final Function(bool) onSwitchStateChanged;

  const SettingScreen({
    Key? key,
  //  required this.onSwitchStateChanged, 
  }) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late final SettingController settingController;
        final bottomBarController = Get.put(BottomBarController());
          late bool initialSwitchState=false;
late final Function(bool) onSwitchStateChanged;


  @override
  void initState() {
    super.initState();
    settingController = Get.put(SettingController());
    // Retrieve switch state when the widget is initialized
    settingController.retrieveSwitchState();
    setState(() {
           initialSwitchState =true;
           

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            headerscreen(),
            SizedBox(height: 10),
            
           initialSwitchState? Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Column(
                children: [

                  Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Near well features',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Obx(
                          () => Transform.scale(
                            transformHitTests: false,
                            scale: 0.9,
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: CupertinoSwitch(
                                activeColor: Colors.red,
                                trackColor: Colors.grey,
                                value: settingController.switchState.value,
                                onChanged: (newState) {
                                  // DynatraUtility.forceErrors();
                                  // Update switch state only if it's enabled
                                  if (settingController.switchEnabled.value) {
                                    settingController.setSwitchState(newState);
                                   // widget.onSwitchStateChanged(newState);
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ):Text("")
          ],
        ),
      ),
     bottomNavigationBar: bottomBarWidget(),
    );
  }
}

class SettingController extends GetxController {
  // Use GetStorage to persist switch state
  final storage = GetStorage();

  RxBool switchState = false.obs;
  RxBool switchEnabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    retrieveSwitchState();
  }

  void retrieveSwitchState() {
    // Retrieve switch state from storage on initialization
    bool? storedState = storage.read('switchState');
    if (storedState != null) {
      switchState.value = storedState;
    }
  }

  void setSwitchState(bool newState) {
    // Update switch state and persist it
    switchState.value = newState;
    storage.write('switchState', newState);
  }

  void enableSwitch(bool enabled) {
    switchEnabled.value = enabled;
  }
}
