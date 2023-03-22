import 'package:_sabahat_repo/app_config/app_colors.dart';
import 'package:_sabahat_repo/app_config/app_utils.dart';
import 'package:_sabahat_repo/video_call.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/services.dart';

class NewMeeting extends StatefulWidget {
  NewMeeting({Key? key}) : super(key: key);

  @override
  _NewMeetingState createState() => _NewMeetingState();
}

class _NewMeetingState extends State<NewMeeting> {
  String _meetingCode = "abcdfgqw";

  @override
  void initState() {
    var uuid = Uuid();
    _meetingCode = uuid.v1().substring(0, 8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New meeting"),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_sharp, ), onPressed: () {Get.back();},),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Image.network(
              "https://user-images.githubusercontent.com/67534990/127776392-8ef4de2d-2fd8-4b5a-b98b-ea343b19c03e.png",
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
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: Card(
                color: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const Icon(Icons.link),
                  title: SelectableText(
                    _meetingCode,
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ),
                  trailing: IconButton(
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: _meetingCode));
                      AppUtils.showToast(message: "Text copy to the clipboard");
                    },
                    icon: Icon(Icons.copy)
                  ),
                )
              ),
            ),
            const Divider(thickness: 1, height: 40, indent: 20, endIndent: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: GestureDetector(
                onTap: () async {
                  await Share.share("Meeting Code : $_meetingCode");
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
                        Icon(Icons.arrow_drop_down, color: Colors.white,),
                        SizedBox(width: 10,),
                        Text("Share invite", style: TextStyle(fontSize: 16, color: Colors.white,),),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Get.to(VideoCall(channelName: _meetingCode.trim()));
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
                        Icon(Icons.video_call, color: AppColors.primaryColor,),
                        SizedBox(width: 10,),
                        Text("Start call", style: TextStyle(fontSize: 16, color: AppColors.primaryColor,),),
                      ],
                    ),
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