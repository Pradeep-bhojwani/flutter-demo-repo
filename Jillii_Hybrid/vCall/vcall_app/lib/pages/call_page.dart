import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';


class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID}) : super(key: key);

  final String callID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID:
          259430039, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
          '97738db81f746de7289efbc058d2b75572e53eb296673c6619568b41d788f8f5', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: 'User1',
      userName: 'Uone',
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
