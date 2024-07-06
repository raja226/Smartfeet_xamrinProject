import 'dart:convert';
import 'package:get/get.dart';
import 'package:smartfleet/model/allpadsmodel.dart';
import 'package:http/http.dart' as http;
import 'package:smartfleet/utility/dynatrace_utility.dart';

class AllpadsController extends GetxController {
  var pads = <Pad>[].obs;
  

  Future<String> loginAuthApi() async {
    Map dta = {
      "grant_type": "refresh_token",
      "redirect_uri": "com.halliburth.example:/callback",
      "scope": "offline_access email openid profile",
      "client_id": "0oa152zdp46esiG3W0h8",
      "refresh_token": "OYgGBw_aRhro3vBvHKOQ_n0X32MYKzpOVmwd6DGP71s"
    };

    try {
      var response = await http.post(
        Uri.parse("https://myappstest.halliburton.com/oauth2/default/v1/token"),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: _encodeFormData(dta),
      );
      print("*******responsestatuescodewwww");
        print(response.statusCode);
       DynatraUtility.webAction("https://myappstest.halliburton.com/oauth2/default/v1/token", "POST");
 
      if (response.statusCode == 200) {
         print("*******responsestatuescode");
        print(response.statusCode);
         print("*********resbonsebody");
        print(response.body);
      

        Map result = jsonDecode(response.body);
                print(response.body);

                  print("result***********");
                     print(result);

        String accessToken = result["access_token"];

        print(accessToken);
        print("**************");

        return accessToken;
      } else {
        throw Exception("Failed to login");
      }
    } catch (e) {
      throw Exception("Network error: $e");
      
    }
  }

  Future<int> getPadd() async {
    try {
     // var test ="eyJraWQiOiJ0NktOV2wwRElnd2k4UXJHYm9jcmJQRHZYSHhjWll4dnllczNiSkd0T01rIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULmpiTkUxV1BzcGRaMldVTDViTGJ0M0g2OEE0ZE5RSnZsRV9ZYWFMWm1WR3Mub2FyMmh6MGhoeFlGS1VOUFYwaDciLCJpc3MiOiJodHRwczovL215YXBwc3Rlc3QuaGFsbGlidXJ0b24uY29tL29hdXRoMi9kZWZhdWx0IiwiYXVkIjoiYXBpOi8vZGVmYXVsdCIsImlhdCI6MTcwODM0NDM4NSwiZXhwIjoxNzA4MzQ3OTg1LCJjaWQiOiIwb2ExNTJ6ZHA0NmVzaUczVzBoOCIsInVpZCI6IjAwdTE0djJucnJtUFZIVmhMMGg4Iiwic2NwIjpbIm9mZmxpbmVfYWNjZXNzIiwib3BlbmlkIiwiZW1haWwiLCJwcm9maWxlIl0sImF1dGhfdGltZSI6MTcwNjc2ODAzNiwic3ViIjoicmFqeWFsYWtzaG1pNzI0QGdtYWlsLmNvbSIsInVwbiI6InJhanlhbGFrc2htaTcyNEBnbWFpbC5jb20iLCJGYW1pbHlOYW1lIjoiS29tbWluZW5pIiwiR2l2ZW5OYW1lIjoiUmFqeWFsYWtzaG1pIiwiZW1haWwiOiJyYWp5YWxha3NobWk3MjRAZ21haWwuY29tIn0.RRSu3y7U-oPOLsxZ3bIHjbS3e0VQvpWAw7C86J7vU-YkIZfTbzDeEjT4Lhmsd3op3URvpr-RZOolTr-ZuT7YdrvTjAgmqo6NwNPVkA5JwKA-vD0cRK_Uk-yACbTyfrBVaMdpAMILYZenXKD4abu10JXPxW8PsHEjCPCthrMIeiZg5AqMELyTcj16TMy8wYgbZF8sK_VfgSdAGo8uTBzH-4JWsN-_PUINWxSQHOePP300MHWZg6tbuHtAQSWbkfseQpfqIqbAnbDBVcGvz4qq9Sco9DS3MoW4Qw9GgurXbYYDVHM5TW42rPqNVNZDcNh_5skkBcGRlHO0Jsv4FD91Gw";
      String accessToken = await loginAuthApi();
      var response = await http.get(
        Uri.parse("https://smartfleetqa.halliburton.com/api/projectmanager/Projects/subscription/pads/62fc793c7bacea00087d6315"),
        headers: {
          "Authorization": "Bearer $accessToken"
        },
      );
  print(accessToken);
  print("****************");
  print(response.statusCode);
DynatraUtility.webAction("https://smartfleetqa.halliburton.com/api/projectmanager/Projects/subscription/pads/62fc793c7bacea00087d6315", "GET");
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.body);

        Addpadmodel _pads = await addpadmodelFromJson(response.body);
        pads.value = _pads.pads;
        return 200;
      } else {
        return 300;
      }
    } catch (e) {
      
      print("Error: $e");

      return 500;
    }
  }

  String _encodeFormData(Map data) {
    return data.keys
        .map((key) => '$key=${Uri.encodeQueryComponent(data[key]!)}')
        .join('&');
  }
}

