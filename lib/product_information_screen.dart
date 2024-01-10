import 'package:flutter/material.dart';

class PIS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Details', // 앱의 타이틀 설정
      theme: ThemeData(
        primarySwatch: Colors.blue, // 앱의 기본 색상 테마 설정
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0), // AppBar의 기본 높이를 0으로 설정
          child: AppBar(
            backgroundColor: Colors.transparent, // AppBar 배경색을 투명하게 설정
            elevation: 0.0, // AppBar의 그림자 효과를 제거
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Column의 자식들을 수평으로 전체 화면에 늘림
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0), // 주변 여백 설정
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back), // 뒤로 가기 아이콘
                      onPressed: () {
                        // 뒤로 가기 기능 추가
                      },
                    ),
                    SizedBox(width: 8), // 추가 간격
                    Text(
                      '상품정보', // 상품 정보 텍스트
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // 텍스트 스타일 설정
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8), // 추가 간격
              buildProductInfo(), // 제품 정보를 보여주는 위젯
              SizedBox(height: 16), // 추가 간격
              buildDeliveryInfo(), // 배송 정보를 보여주는 위젯
              SizedBox(height: 32), // 추가 간격
              buildButtons(), // 버튼을 보여주는 위젯
              SizedBox(height: 16), // 추가 간격
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // 주변 여백 설정
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Column의 자식들을 수평으로 전체 화면에 늘림
        children: [
          Image.network(
            'https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/375a/08dc68881f884c095b43adf1fd17f05c0fb1bf62ffbde3bfe8b39c0939e5.jpg',
            fit: BoxFit.cover, // 이미지가 화면을 가득 채우도록 설정
            width: double.infinity, // 이미지의 너비를 전체 화면에 늘림
            height: 300, // 이미지의 높이 설정
          ),
          SizedBox(height: 16), // 추가 간격
          Text(
            'Product Name', // 제품 이름 텍스트
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // 텍스트 스타일 설정
          ),
          SizedBox(height: 8), // 추가 간격
          Text(
            '\$100.00', // 제품 가격 텍스트
            style: TextStyle(fontSize: 16, color: Colors.green), // 텍스트 스타일 설정
          ),
          SizedBox(height: 4), // 추가 간격
          Text(
            '-20%', // 할인율 텍스트
            style: TextStyle(fontSize: 14, color: Colors.red), // 텍스트 스타일 설정
          ),
        ],
      ),
    );
  }

  Widget buildDeliveryInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0), // 주변 여백 설정
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Column의 자식들을 수평으로 전체 화면에 늘림
        children: [
          buildDeliveryRow('배송정보1', 'Company Name'), // 배송 정보를 나타내는 행 위젯
          buildDeliveryRow('배송정보2', '출발일 - 도착일'), // 배송 정보를 나타내는 행 위젯
        ],
      ),
    );
  }

  Widget buildDeliveryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0), // 주변 여백 설정
      child: Row(
        children: [
          Text(
            label, // 배송 정보 레이블
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // 텍스트 스타일 설정
          ),
          SizedBox(width: 16), // 추가 간격
          Text(
            value, // 배송 정보 값
            style: TextStyle(fontSize: 16), // 텍스트 스타일 설정
          ),
        ],
      ),
    );
  }

  Widget buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // 주변 여백 설정
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 자식들을 가로로 고르게 배치
        children: [
          ElevatedButton(
            onPressed: () {
              // '장바구니 담기' 버튼 기능 추가
            },
            child: Text('장바구니 담기'), // 버튼 텍스트 설정
          ),
          ElevatedButton(
            onPressed: () {
              // '바로 구매하기' 버튼 기능 추가
            },
            child: Text('바로 구매하기'), // 버튼 텍스트 설정
          ),
        ],
      ),
    );
  }
}




