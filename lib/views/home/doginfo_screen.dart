import 'dart:ffi';

import 'package:bommeong/viewModels/home/doginfo_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:bommeong/views/base/base_screen.dart';
import 'package:bommeong/utilities/font_system.dart';
import 'package:bommeong/viewModels/chat/chat_viewmodel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DogInfoScreen extends BaseScreen<DogInfoViewModel> {
  const DogInfoScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: Get.width,
                height: Get.height * 0.37, // 아래에 있는 컨테이너의 높이// 아래에 있는 컨테이너의 색상
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage('https://ifh.cc/g/tBmzjl.jpg'), // 원하는 이미지 URL 사용
                    fit: BoxFit.cover, // 이미지가 컨테이너를 꽉 채우도록
                  ),
                ),
              ),
              Positioned(
                top: Get.height * 0.33, // 겹치는 부분의 시작 위치 조정
                child: Container(
                  height: 300, // 겹치는 컨테이너의 높이
                  width: Get.width, // 겹치는 컨테이너의 너비
                  decoration: BoxDecoration(
                    color: Colors.white, // 겹치는 컨테이너의 색상
                    borderRadius: BorderRadius.circular(26.5), // 둥근 모서리 설정
                  ),
                ),
              ),
              Positioned(
                top: Get.height * 0.02,
                left: Get.width * 0.03,
                  child:InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                        "assets/images/home/goBack.svg",
                        height: 40,
                    ),
                  ),
              ),
            ],
          ),
          _BottomBox(),
        ],
      ),
    );

  }

  @override
  bool get wrapWithOuterSafeArea => true;
  @override
  bool get wrapWithInnerSafeArea => true;
}



class _BottomBox extends StatelessWidget {
  //뷰모델 가져오기
  const _BottomBox({super.key});

  @override
  Widget build(BuildContext context) {
    //뷰모델

    final DogInfoViewModel viewModel = Get.put(DogInfoViewModel());
    print("렌더링은 ${viewModel.items.name}");
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children : [
            Container(
              child: Row(
                //왼쪽 정렬
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(viewModel.items.name,
                      style: FontSystem.KR26B),
                  SvgPicture.asset(
                    "assets/images/home/heart.svg",
                    height: 20,
                  ),
                ],
              ),
            ),
            Text("Young . 골든리트리버",
                style: FontSystem.KR16R),
            SizedBox(height: 20),
            Text("우리 날봄이는요!",
                style: FontSystem.KR16B),
            SizedBox(height: 10),
            Row(
              children: [
                _Tag(text: "#귀엽고 애교많은"),
                _Tag(text: "#믹스견"),
                _Tag(text: "#바보"),
              ],
            ),
            SizedBox(height: 15),
            _TalkBox(),
            SizedBox(height: 15),
            _BottomButton(),


          ]
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: Color(0xFFEEEEF5),
          borderRadius: BorderRadius.circular(10),

        ),
        child: Text(text,
          style: FontSystem.KR12B,)
    );
  }
}

class _TalkBox extends StatelessWidget {
  const _TalkBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [SvgPicture.asset(
          "assets/images/home/talk.svg",
          width: Get.width * 0.85,
        ),
          Positioned(
            top: 20,
            left: 20,
            child: Text("안녕하세요! 저는 날봄이에요. 오늘 날씨가 참 좋죠?"),
          ),
        ]
    );

  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('버튼 탭됨!');
      },
      child: Container(
        width: Get.width * 0.85,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // 패딩 조정으로 버튼 크기 조정
        decoration: BoxDecoration(
          color: Color(0xFFA273FF), // 배경색 설정
          borderRadius: BorderRadius.circular(8), // 모서리 둥글기 반경 설정
        ),
        child: Text(
          '남봄이와 얘기해보기', // 버튼 텍스트
          style: FontSystem.KR16B.copyWith(color: Colors.white), // 텍스트 스타일
          textAlign: TextAlign.center, // 텍스트 정렬
        ),
      ),
    );

  }
}
