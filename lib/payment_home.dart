import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _PaymentPage(),
    );
  }
}

class _PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('주문 & 결제'), // 화면 상단에 'Order & Payment' 타이틀 표시
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // 주문 상품 정보 섹션
                  ExpansionTile(
                    title: Text("주문상품 총 2개"), // 헤더 제목
                    children: [
                      Container(
                        color: Colors.black12, // 컨테이너 배경색
                        padding: EdgeInsets.all(20), // 컨테이너 안의 여백 설정
                        width: double.infinity, // 컨테이너의 가로 너비를 화면 전체로 확장
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("베이비랜드 마블풍선 20P 핑크"), // 첫 번째 상품명
                            Text("스타리움 왕관 스트랩 1세트"), // 두 번째 상품명
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.0), // 위젯 간 간격 조절

                  // 배송 정보 입력 섹션
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '배송지 정보', // 'Delivery Information' 텍스트 표시
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '변경하기',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.0), // 위젯 간 간격 조절
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '주소', // 'Shipping Address' 라벨 텍스트 표시
                      border: OutlineInputBorder(), // 테두리 스타일 추가
                    ),
                  ),

                  ExpansionTile(
                    title: Text("배송시 요청사항 선택"), // 헤더 제목
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey), // 테두리 선 추가
                        ),
                        child: Container(
                          color: Colors.black12, // 컨테이너 배경색
                          padding: EdgeInsets.all(20), // 컨테이너 안의 여백 설정
                          width: double.infinity, // 컨테이너의 가로 너비를 화면 전체로 확장
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("경비실에 맡겨주세요."), // 첫 번째 상품명
                              Text("빨리 배송해주세요."), // 두 번째 상품명
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // 총 결제 금액, 총 상품 금액, 배송비를 하나의 로우로 묶음
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // 총 결제 금액을 나타내는 로우
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '총 결제 금액', // 총 결제 금액 정보
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            '18,500원', // 실제 결제 금액 정보
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),

                      // 총 상품 금액을 나타내는 로우
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '총 상품 금액', // 총 상품 금액 정보
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            '15,500원', // 실제 상품 금액 정보
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),

                      // 배송비를 나타내는 로우
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '배송비', // 배송비 정보
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            '3,000원', // 배송비 정보
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),


                  SizedBox(height: 20.0), // 위젯 간 간격 조절

                  Text(
                    '결제방법', // 'Payment & Total Amount' 텍스트 표시
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20.0), // 위젯 간 간격 조절

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          // Respond to button press
                        },
                        child: Text("간편결제"), // Text for the first button
                      ),
                      OutlinedButton(
                        onPressed: () {
                          // Respond to button press
                        },
                        child: Text("카드결제"), // Text for the second button
                      ),
                      OutlinedButton(
                        onPressed: () {
                          // Respond to button press
                        },
                        child: Text("현금결제"),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          // Respond to button press
                        },
                        child: Text("휴대폰결제"), // Text for the second button
                      ),
                    ],
                  ),

                  SizedBox(height: 20.0), // 위젯 간 간격 조절



                  ElevatedButton(
                    onPressed: () {
                      // 결제 버튼을 눌렀을 때의 로직 추가
                    },
                    child: Text('18,500원 결제하기'), // 'Place Order & Pay' 텍스트를 가진 버튼
                  ),

                  SizedBox(height: 20.0), // 위젯 간 간격 조절

                  Text(
                      'Powered by Ably Payments', // 'Powered by Ably Payments' 텍스트 표시
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey)
                  )
                ]
            )
        )
    );


  }// 회색 글자색으로 스타일 지정
}
void main() {
  runApp(MaterialApp(
    home: _PaymentPage(), // OrderPaymentPage를 앱의 홈으로 설정하여 실행
  ));
}
