import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
// This is the theme of your application.
//
// TRY THIS: Try running your application with "flutter run". You'll see
// the application has a blue toolbar. Then, without quitting the app,
// try changing the seedColor in the colorScheme below to Colors.green
// and then invoke "hot reload" (save your changes or press the "hot
// reload" button in a Flutter-supported IDE, or press "r" if you used
// the command line to start the app).
//
// Notice that the counter didn't reset back to zero; the application
// state is not lost during the reload. To reset the state, use hot
// restart instead.
//
// This works for code too, not just values: Most code changes can be
// tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.purple
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.orange
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.red
                    )
                  ],
                )
              ],
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 100,
                          height: 100,
                          color: Colors.greenAccent
                      ),
                      Container(
                          width: 100,
                          height: 100,
                          color: Colors.cyan
                      ),
                      Container(
                          width: 100,
                          height: 100,
                          color: Colors.amber
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          width: 100,
                          height: 100,
                          color: Colors.teal
                      ),
                      Container(
                          width: 100,
                          height: 100,
                          color: Colors.white
                      ),
                      Container(
                          width: 100,
                          height: 100,
                          color: Colors.brown
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.lightGreen
                      ),
                      Container(
                          width: 100,
                          height: 100,
                          color: Colors.pink
                      ),
                      Container(
                          width: 100,
                          height: 100,
                          color: Colors.yellow
                      )
                    ],
                  )
                ],
            ),
          ],
        ),
      ),
    );
  }
}
