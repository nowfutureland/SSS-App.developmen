import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String quiz = "";

// API 호출
  Future<String> getNumberTrivia() async {
    Response result = await Dio().get("http://numbersapi.com/random/trivia");
    String trivia = result.data;
    print(trivia);
    return trivia;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("시작");
    getNumberQuiz();
  }

  void getNumberQuiz() async {
    String trivia = await getNumberTrivia();
    setState(() {
      quiz = trivia;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    quiz,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 42,
                child: ElevatedButton(
                  onPressed: () {
                    //New Quiz버튼 클릭 시 실행
                    getNumberQuiz();
                  },
                  child: const Text(
                    "New Quiz",
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
