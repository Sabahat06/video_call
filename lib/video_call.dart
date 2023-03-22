import 'dart:convert';
import 'package:_sabahat_repo/utils/settings.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VideoCall extends StatefulWidget {
  String channelName = "dummy_project";

  VideoCall({required this.channelName});
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {

  AgoraClient? _client;
  bool _loading = true;
  String tempToken = "";

  @override
  void initState() {
    getToken();
    super.initState();
  }

  Future<void> getToken() async {

    // _client = AgoraClient(
    //   agoraConnectionData: AgoraConnectionData(
    //     appId: appId,
    //     tempToken: token,
    //     channelName: 'dummy_project',
    //   ),
    //   enabledPermission: [Permission.camera, Permission.microphone]
    // );

    String link = "https://agora-node-tokenserver.sabahat-hussain.repl.co/access_token?channelName=${widget.channelName}";

    http.Response _response = await http.get(Uri.parse(link));
    Map data = jsonDecode(_response.body);
    setState(() {
      tempToken = data["token"];
    });
    _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: appId,
        tempToken: tempToken,
        channelName: widget.channelName,
      ),
      enabledPermission: [Permission.camera, Permission.microphone],
      agoraEventHandlers: AgoraRtcEventHandlers(
        onLeaveChannel: (connection, stats) => Get.back(),

      ),
    );
    _client!.initialize();
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => setState(() => _loading = false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
          ? const Center(child: CircularProgressIndicator(),)
          : Stack(
            children: [
              AgoraVideoViewer(
                client: _client!,
                layoutType: Layout.floating,
                enableHostControls: true,
                showNumberOfUsers: true,
              ),
              AgoraVideoButtons(
                client: _client!,
                onDisconnect: () {Get.back();},

              )
            ],
        ),
      ),
    );
    ;
  }
}