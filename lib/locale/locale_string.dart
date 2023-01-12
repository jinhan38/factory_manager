import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ko': {
          'yes' : "예",
          'no' : "아니오",
          'notice' : "알림",
          'hello': '헬로 월드',
          'startScreen': '시작화면',
          'language' : "한국어",
          'setting' : "설정",
          'login' : "로그인",
          'idHint' : "아이디를 입력해주세요",
          'pwHint' : "비밀번호를 입력해주세요",
          'inputInfo' : "정보 입력",
          'inputInfoDescription' : "필요한 정보들을 입력해주세요",
          'finish': "완료",
          'changeScreenLight': "화면 밝기",
          'selectLang': "언어 선택",
          'deviceInfo': "기기 정보",
          'quit': "종료",
          'quitDescription': "종료하시겠습니까?",
        },
        'en': {
          'yes' : "yes",
          'no' : "no",
          'notice' : "notice",
          'hello': 'Hello world',
          'startScreen': 'Start screen',
          'language' : "English",
          'setting' : "Setting",
          'login' : "Login",
          'idHint' : "Please input id",
          'pwHint' : "Please input password",
          'inputInfo' : "Input information",
          'inputInfoDescription' : "Please input the required information",
          'finish': "Finish",
          'changeScreenLight': "Screen brightness",
          'selectLang': "Select language",
          'deviceInfo': "Device Information",
          'quit': "Quit",
          'quitDescription': "Are you sure you want to quit?",
        },
      };
}
