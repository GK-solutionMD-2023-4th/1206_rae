import 'package:flutter/material.dart';

// Product 모델 클래스, 제품을 구성하는 프로덕트 모델
class Product { // 프로덕트를 클래스에 정의
  final String name; // 제품 이름 문자열
  final String imageUrl; // 제품 이미지의 URL
  final double price; // 제품 가격
  final int discount; // 할인율

  // 생성된 프로덕트
  Product({ // 클래스에 정의된 프로덕트를 불러옴, 따라서 this 추가
    required this.name, // 요청된 이름 필드 프로덕트 설정
    required this.imageUrl, // 요청된 이미지 URl 필드 프로덕트 설정
    required this.price, // 요청된 가격 필드 프로덕트 설정
    required this.discount, // 요청된 할인률 필드 프로덕트 설정
  });
}

// 앱의 메인 위젯
class BSS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Grid', // 앱의 타이틀: 'product Grid'
      theme: ThemeData( // 앱의 테마 설정
        primarySwatch: Colors.blue, // 앱의 기본적인 색상: 파랑
      ),
      home: Scaffold(
        appBar: PreferredSize( // 앱바의 크기 설정
          preferredSize: Size.fromHeight(0.0), // 사이즈: 0.0
          child: AppBar(
            backgroundColor: Colors.transparent, // 앱바의 배경 색상: 투명
          ),
        ),
        body: SingleChildScrollView( // 화면 스크롤 기능, 상품의 갯수가 많아 한 화면에 다 볼 수 없어서 넣은 스크롤 기능
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // row 안에 있는 모든 위젯에 좌우 수평으로 16.0
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.account_circle), // 프로필 아이콘
                      onPressed: () {
                        // 프로필 버튼을 눌렀을 때 실행되는 코드 추가(If)
                      },
                    ),
                    SizedBox(width: 4), // 아이콘 버튼 간의 간격: 4
                    Expanded(
                      child: _CustomSearchField(), // 커스텀 검색 필드, 검색바 생성 화면에 랜더링 함
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down), // 하향 화살표 아이콘
                      onPressed: () {
                        // 화살표 버튼을 눌렀을 때 실행되는 코드 추가(If)
                      },
                    ),
                  ],
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return buildProductItem(products[index]); // 수정된 부분
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 상품 정보 위젯
  Widget buildProductItem(Product product) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // 위젯의 모든 경계 간격: 8
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 콜룸 내의 위젯들의 수직 정렬 방식 설정
        children: [
          Expanded(
            child: Image.network(
              product.imageUrl, // 이미지 링크 인설트 (If)
              height: double.infinity, // 세로 크기: 무한, 이미지 크기가 어느정돈지 모르기 때문
              width: double.infinity, // 가로 크기: 무한, //
              fit: BoxFit.cover, // 이미지 크기에 맞게 조정
            ),
          ),
          SizedBox(height: 8), // 제품 이름 정보 박스 크기: 8
          Text(
            product.name, // 제품 이름
            style: TextStyle( // 글자 설정
              fontSize: 16, // 글자 크기: 16
              fontWeight: FontWeight.bold, // 글자 볼드
            ),
          ),
          SizedBox(height: 4), // 제품 가격 정보 박스 크기: 4
          Row(
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}', // 제품 가격
                style: TextStyle( // 텍스트 설정
                  fontSize: 14, // 글자 크기: 14
                  color: Colors.green, // 글자 색상: 초록
                ),
              ),
              SizedBox(width: 4), // 제품 할인 정보 박스 크기: 4
              Text(
                '-${product.discount.toString()}%', // 할인율
                style: TextStyle( // 텍스트 설정
                  fontSize: 14, // 글자 크기: 14
                  color: Colors.red, // 글자 색상: 빨강
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 상품 리스트
  final List<Product> products = List.generate(
    30, // 상품 갯수 30개
        (index) => Product(
      name: 'Product ${index + 1}', // 제품 이름 설정
      imageUrl: 'https://via.placeholder.com/150', // 기본 이미지 URL
      price: (index + 1) * 25.0, // 가격 설정
      discount: ((index + 1) * 25 * 0.2).toInt(), // 할인율 설정
    ),
  );
}

// 검색 필드 위젯
class _CustomSearchField extends StatefulWidget {
  @override
  _CustomSearchFieldState createState() => _CustomSearchFieldState(); // 커스텀 검색 필드를 생성해 커스텀 필드 상태에 넘김
} // 위에 있던 커스텀 검색 필드의 정의

class _CustomSearchFieldState extends State<_CustomSearchField> {
  late FocusNode _focusNode; // 검색 필드의 포커스(사용자의 입력을 받을 수 있는 상태)를 관리하는 노드(노드는 위젯관리)
  late TextEditingController _textEditingController; // 검색어를 입력하는 컨트롤러

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode(); // 포커스 노드 초기화
    _textEditingController = TextEditingController(); // 텍스트 컨트롤러 초기화
  } //  StatefulWidget이 처음 만들어질 때 실행되는 초기화를 initState()를 오버라이드(재정의)

  @override
  void dispose() {
    _focusNode.dispose(); // 포커스 노드 해제
    _textEditingController.dispose(); // 텍스트 컨트롤러 해제
    super.dispose();
  } // 초기화 전에 호출되는 dispose(해체)를 오버라이드, 즉 제거함. 검색창 작업이 끝나면 없애기 위해서

  void _showKeyboard() {
    FocusScope.of(context).requestFocus(_focusNode); // 키보드 표시 요청
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showKeyboard, // 클릭 시 키보드 표시
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0), // 키보드 가로 길이: 12.0
        decoration: BoxDecoration( // 박스 데코레이션
          border: Border.all(color: Colors.grey), // 박스 모든 외각선 생삭: 회색
          borderRadius: BorderRadius.circular(8.0), // 위젯 모서리 둥근 정도: 8.0
        ),
        child: Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero, // 여백 값: 0
              icon: Icon(Icons.search), // 검색 아이콘
              onPressed: () {
                // 검색 아이콘을 눌렀을 때 실행되는 코드 추가(If)
              },
            ),
            Expanded(
              child: TextField(
                controller: _textEditingController, // 컨트롤러 설정
                focusNode: _focusNode, // 포커스 노드 설정
                decoration: InputDecoration(
                  hintText: '관심있는 상품 검색', // 검색창의 힌트 텍스트
                  border: InputBorder.none, // 택스트 필드의 외각선 제거
                  contentPadding: EdgeInsets.symmetric(vertical: 0.0), // 위, 아래에 대칭으로 여백값: 0.0
                ),
                onTap: () {
                  setState(() {
                    _showKeyboard(); // 키보드 표시 요청
                  });
                },
                onChanged: (value) {
                  // value에 기반해 검색했을 때 실행되는 코드 추가(If)
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} // 넘겨진 커스텀 검색 필드의 상태















