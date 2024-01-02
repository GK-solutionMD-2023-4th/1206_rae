import 'package:flutter/material.dart';

class MyApp2 extends StatelessWidget {
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
                  Image.asset('assets/images/log.jpg'),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '아이디',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0), // Higher value for elongation
                        borderSide: BorderSide(), // Add this line for the border to show
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: '비밀번호',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0), // Higher value for elongation
                        borderSide: BorderSide(), // Add this line for the border to show
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Login Text as TextButton on the left side
                TextButton(
                  onPressed: () {
                    // Handle login action
                  },
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                Spacer(), // Adds space between the login and sign-up text

                // Sign-Up Text on the right side
                GestureDetector(
                  onTap: () {
                    // Handle navigation to sign-up screen
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
// 예: Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen( )));