import 'package:bommeong/utilities/font_system.dart';
import 'package:flutter/material.dart';
import 'package:bommeong/viewModels/chat/chat_viewmodel.dart';
import 'package:bommeong/views/base/base_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChatScreen extends BaseScreen<ChatViewModel> {
  const ChatScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Text("zz");

  }

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get wrapWithInnerSafeArea => true;
}

