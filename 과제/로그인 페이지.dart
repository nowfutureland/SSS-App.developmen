import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController id = TextEditingController();
  TextEditingController pw = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          '로그인 페이지',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 30),
              TextField(
                controller: id,
                decoration: const InputDecoration(
                  label: Text(
                    '아이디',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: pw,
                decoration: const InputDecoration(
                  label: Text(
                    '비밀번호',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: phone,
                decoration: const InputDecoration(
                  label: Text(
                    '전화번호',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    String uid = 'name';
                    String upw = '1234';
                    String uphone = '01012345678';

                    if (id.text == uid &&
                        pw.text == upw &&
                        phone.text == uphone) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                  },
                  child: const Text('로그인'))
            ],
          ),
        ),
      ),
    );
  }
}
