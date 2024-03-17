// user_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  //  Future<bool> attemptLogIn(String email, String password) async {
  //   final response = await http.post(
  //     Uri.parse('여기에_API_엔드포인트_URL_추가'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode({
  //       'email': email,
  //       'password': password,
  //     }),
  //   );
  //
  //   return response.statusCode == 200;
  // }

  Future<bool> attemptLogIn(String email, String password) async {
    // 인위적인 지연을 만들어 실제 API 호출과 유사한 상황을 만듭니다.
    await Future.delayed(Duration(seconds: 2));

    // 예제를 위한 더미 응답 데이터
    var dummyResponse = {
      'statusCode': 200,
      'body': json.encode({
        'message': 'Success',
        'user': {
          'id': 1,
          'name': '사용자 이름',
          'email': email,
          // 다른 사용자 정보들
        }
      }),
    };

    if (email == '1' && password == '1') {
      print('더미 로그인 성공: ${dummyResponse['body']}');
      return true; // 성공으로 간주
    } else {
      print('더미 로그인 실패');
      return false; // 실패로 간주
    }
  }
}