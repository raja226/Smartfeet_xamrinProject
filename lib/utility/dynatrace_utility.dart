import 'dart:io';

import 'package:dynatrace_flutter_plugin/dynatrace_flutter_plugin.dart';

class DynatraUtility {
  static void singleAction(String buttonName) {
    DynatraceRootAction myAction =
        Dynatrace().enterAction("Button tapped - $buttonName");
    myAction.leaveAction();
  }

  static void navigateScreen(String screename) {
    DynatraceRootAction myAction =
        Dynatrace().enterAction("Navigate to screen - $screename");
    myAction.leaveAction();
  }

  static void forceErrors() {
    String input = '12,34';
    double.parse(input);
  }

  static void userPrivacyOptionsAllOn() {
    Dynatrace().applyUserPrivacyOptions(
        UserPrivacyOptions(DataCollectionLevel.UserBehavior, true));
  }

  static void tagUser(String username) {
    Dynatrace().identifyUser(username);
  }

static void reportCrash() {
    Dynatrace().reportCrash(
        "FormatException", "Invalid Double", "WHOLE_STACKTRACE_AS_STRING");
  }

  static void reportCrashException() {
    Dynatrace().reportCrashWithException(
        "FormatException",
        Exception(
            "FormatException, Invalid Double, WHOLE_STACKTRACE_AS_STRING"));
  }

   static void _subAction() {
    DynatraceRootAction myAction =
        Dynatrace().enterAction("MyButton tapped - Sub Action");
    DynatraceAction mySubAction = myAction.enterAction("MyButton Sub Action");
    mySubAction.leaveAction();
    myAction.leaveAction();
  }

  static void webAction(String urlstring ,String urlMethod) async {
    var client = Dynatrace().createHttpClient();
    var url = urlstring;
    DynatraceRootAction webAction =
    Dynatrace().enterAction('API Called - $url\n Methode: $urlMethod');

    try {
      await client.get(Uri.parse(url));
    } catch (error) {
      // insert error handling here
    } finally {
      client.close();
      webAction.leaveAction();
    }
  }

  static void webActionOverrideHeader() async {
    HttpClient client = HttpClient();
    DynatraceRootAction action =
        Dynatrace().enterAction("MyButton tapped - Web Action Override");
    final request = await client.getUrl(Uri.parse('https://dynatrace.com'));
    request.headers.set(action.getRequestTagHeader(),
        await action.getRequestTag('https://dynatrace.com'));
    final response = await request.close();
    print(response);
    action.leaveAction();
  }

  static void webActionFullManualInstr() async {
    HttpClient client = HttpClient();

    DynatraceRootAction action =
        Dynatrace().enterAction("MyButton tapped - Web Action Full Manual");
    WebRequestTiming timing =
        await action.createWebRequestTiming('https://dynatrace.com');

    final request = await client.getUrl(Uri.parse('https://dynatrace.com'));
    request.headers.add(timing.getRequestTagHeader(), timing.getRequestTag());
    timing.startWebRequestTiming();
    final response = await request.close();
    timing.stopWebRequestTiming(response.statusCode, response.reasonPhrase);
    print(response);
    action.leaveAction();
  }

    static void reportValue<T>(String key, T value,{bool fromButton = false,String buttonName = ""}) {
    if (fromButton) {
      DynatraceRootAction myAction = Dynatrace().enterAction("$buttonName tapped - Report values");
      if (value is String) {
        myAction.reportStringValue(key, value);
      } else if (value is int) {
        myAction.reportIntValue(key, value);
      } else if (value is double) {
        myAction.reportDoubleValue(key, value);
      }else {
        // Unsupported type, you may handle this case as per your requirement
        print('Unsupported value type');
      }

      myAction.leaveAction();
    } else {
      print('Not called from a button press');
    }
  }



  //Need to use ;
  static void _endSession() {
    Dynatrace().endSession();
  }



}
