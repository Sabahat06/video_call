import 'package:_sabahat_repo/app_config/app_colors.dart';
import 'package:_sabahat_repo/pages/join_with_code.dart';
import 'package:_sabahat_repo/pages/new_meeting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Conference"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: GestureDetector(
              onTap: () {
                Get.to(NewMeeting());
              },
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add, color: Colors.white,),
                      SizedBox(width: 10,),
                      Text("New Meeting", style: TextStyle(fontSize: 16, color: Colors.white,),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            height: 20,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: GestureDetector(
              onTap: () {
                Get.to(JoinWithCode());
              },
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor,),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.margin, color: AppColors.primaryColor,),
                      SizedBox(width: 10,),
                      Text("Join with a code", style: TextStyle(fontSize: 16, color: AppColors.primaryColor,),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 100),
          Image.network("https://user-images.githubusercontent.com/67534990/127524449-fa11a8eb-473a-4443-962a-07a3e41c71c0.png")
        ]
      ),
    );
  }
}
