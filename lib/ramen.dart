import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final double strokeWidth;

  TrianglePainter({required this.strokeColor, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double halfWidth = size.width / 2;
    double height = size.height;

    Path path = Path()
      ..moveTo(0, height)
      ..lineTo(halfWidth, 0)
      ..lineTo(size.width, height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MyTriangle extends StatelessWidget {
  final Color color;
  final double size;
  final double strokeWidth;
  final VoidCallback onTapCallback;

  MyTriangle({
    this.color = Colors.blue,
    this.size = 50,
    this.strokeWidth = 3,
    required this.onTapCallback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: CustomPaint(
          painter: TrianglePainter(strokeColor: color, strokeWidth: strokeWidth),
          size: Size(size, size / 2),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isTapVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.arrow_back, color: Colors.black),
          actions: [
            Icon(Icons.shopping_cart, color: Colors.black),
            SizedBox(width: 20),
            Icon(Icons.menu, color: Colors.black),
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.purple,
                              width: 2,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: '검색',
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: MyTriangle(
                            color: Colors.black,
                            size: 20,
                            strokeWidth: 2,
                            onTapCallback: () {
                              setState(() {
                                isTapVisible = !isTapVisible;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      border: Border.all(
                        color: Colors.pink,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('랭킹', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 30),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.2,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return ItemCard();
                },
                childCount: 3,
              ),
            ),
            if (isTapVisible)
              SliverToBoxAdapter(
                child: TapContent(),
              ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(top: 70, bottom: 0),
                alignment: Alignment.centerLeft,
                child: Text('추천', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.2,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return ItemCard();
                },
                childCount: 3,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(top: 70, bottom: 0),
                alignment: Alignment.centerLeft,
                child: Text('크리스마스', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.2,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return ItemCard();
                },
                childCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: <Widget>[
            Image.asset("assets/images/12.jpeg"),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('김정표'),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('0원', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

class TapContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
