import 'package:_sabahat_repo/app_config/app_colors.dart';
import 'package:_sabahat_repo/video_call.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JoinWithCode extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Join with code"),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_sharp, ), onPressed: () {Get.back();},),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Image.network(
              "https://user-images.githubusercontent.com/67534990/127776450-6c7a9470-d4e2-4780-ab10-143f5f86a26e.png",
              fit: BoxFit.cover,
              height: 120,
              width: 120,
            ),
            const SizedBox(height: 20),
            const Text(
              "Enter meeting code below",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Card(
                color: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Example : abc-efg-dhi"),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,),
              child: GestureDetector(
                onTap: () {
                  Get.to(VideoCall(channelName: _controller.text.trim()));
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text("Join", style: TextStyle(fontSize: 18, color: Colors.white,),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}