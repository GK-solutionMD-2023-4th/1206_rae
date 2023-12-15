import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250.0,
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: '아이디',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: '비밀번호',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // 로그인 버튼 눌렀을 때 처리 코드 추가
                    },
                    child: Text('로그인'),
                  ),
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      // 회원가입 화면으로 이동하는 코드 추가
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                    },
                    child: Text(
                      '회원가입',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// SignUpScreen 클래스 추가시 회원가입 화면을 만들 수 있습니다.
// 또한 GestureDetector 위젯의 onTap 속성에 Navigator.push 코드를 추가해주세요.
// 예: Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
