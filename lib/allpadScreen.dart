
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartfleet/controller/allpadController.dart';
import 'package:smartfleet/header.dart';
import 'package:smartfleet/main.dart';
import 'package:smartfleet/utility/dynatrace_utility.dart';


class allpadScreen extends StatefulWidget {
  const allpadScreen({super.key});

  @override
  State<allpadScreen> createState() => _allpadScreenState();
}

class _allpadScreenState extends State<allpadScreen> {
  final allpadsController =Get.put(AllpadsController());
  List<String> dataList = [];
   bool itstart=false;
  void initState() {
    fetchApi();
    super.initState();
  }

  void fetchApi() async {
   await allpadsController.getPadd();
  
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
     body: SafeArea(
       child:  Column(
        children: [
          headerscreen(),
          SizedBox(
            height: 10,
          ),
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
                                        DynatraUtility.singleAction("AllPadsMenuTab");

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => sensori()));
                              },
                              icon: Icon(
                                Icons.chevron_left_outlined,
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            'Pad Subscription',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),

                    
                  ],
                ),
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
                  ]
                )
              ),
              SizedBox(
                height: 15,
              ),
           
           getallpads() 
            

              
        ],
       ),
     ),
    );
  }

   getallpads() {
    return Obx(() => allpadsController.pads.length!=0
          ?  Expanded(
            
            child: SingleChildScrollView(
              child:   Column(
        children: List.generate(allpadsController.pads.length, (index) {
        return  Column(
          children: [
            Container(
            height: MediaQuery.of(context).size.height * 0.005,
            width: MediaQuery.of(context).size.width * 0.80,
          color: Color.fromARGB(255, 207, 203, 203),
          ),
          Container(
            height: MediaQuery.of(context).size.height* 0.07,
            width: MediaQuery.of(context).size.width *0.80,
            color: Color.fromARGB(255, 55, 56, 55),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(allpadsController.pads[index].padName,style: TextStyle(color: Colors.white),),
                   IconButton(
                 onPressed: () {},
                icon: Icon(Icons.chevron_right_outlined, color: Colors.white),
               ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12,
          )
          ],
        );
        }
        
      )
      )
              ),
              
          )
          :SizedBox()
            );
  }
}

