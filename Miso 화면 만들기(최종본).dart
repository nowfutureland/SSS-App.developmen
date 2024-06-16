import 'package:flutter/material.dart';

Color misoPrimaryColor = const Color.fromARGB(225, 38, 103, 240);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Miso(),
    );
  }
}

class Miso extends StatefulWidget {
  const Miso({super.key});

  @override
  State<Miso> createState() => _MisoState();
}

class _MisoState extends State<Miso> {
  int currentIndex1 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex1,
        children: const [
          MisoFirstPage(),
          MisoSecondPage(),
          MisoThirdPage(),
          MisoFourthPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex1,
        onTap: (newIndex) {
          print("selected newIndex :  $newIndex");
          setState(() {
            currentIndex1 = newIndex;
          });
        },
        selectedItemColor: misoPrimaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.redeem),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
      ),
    );
  }
}

class MisoFirstPage extends StatelessWidget {
  const MisoFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: misoPrimaryColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  const Text(
                    "대한민국 1등 홈서비스\n 미소를 만나보세요!",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("+ 예약하기 버튼 클릭됨");
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(64),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add,
                            color: misoPrimaryColor,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            "예약하기",
                            style: TextStyle(
                              color: misoPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 32,
                child: GestureDetector(
                  onTap: () {
                    print("서비스 상세정보 클릭됨");
                  },
                  child: Container(
                    color: Colors.white.withOpacity(0.3),
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      "서비스 상세정보",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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

/// 두 번째 페이지
class MisoSecondPage extends StatelessWidget {
  const MisoSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    const Text(
                      "예약내역",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.error,
                          color: misoPrimaryColor,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "예약된 서비스가 아직 없어요. 지금 예약해보세요!",
                              style: TextStyle(
                                fontSize: 100,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 18,
                left: 24,
                right: 24,
                child: GestureDetector(
                  onTap: () {
                    print("예약하기 클릭됨");
                  },
                  child: Container(
                    width: double.infinity,
                    height: 58,
                    color: misoPrimaryColor,
                    alignment: Alignment.center,
                    child: const Text(
                      "예약하기",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
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

/// 세 번째 페이지
class MisoThirdPage extends StatelessWidget {
  const MisoThirdPage({super.key});

  final String backgroundImgUrl =
      "https://i.ibb.co/rxzkRTD/146201680-e1b73b36-aa1e-4c2e-8a3a-974c2e06fa9d.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: misoPrimaryColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Image.network(backgroundImgUrl),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 64),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 28,
                        height: 1.5,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: "친구 추천할 때마다\n",
                        ),
                        TextSpan(
                          text: "10,000원 ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "할인 쿠폰 지급!",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 64),
                  GestureDetector(
                    onTap: () {
                      print("자세히 보기 클릭 됨");
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "자세히 보기",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 42,
                child: GestureDetector(
                  onTap: () {
                    print("친구 추천하기 클릭 됨");
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(64),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: const Offset(0, 5),
                          spreadRadius: 1,
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.redeem,
                          color: misoPrimaryColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "친구 추천하기",
                          style: TextStyle(
                            color: misoPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
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

/// 네 번째 페이지
class MisoFourthPage extends StatelessWidget {
  const MisoFourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 62,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "김민경",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "21206",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              ListTile(
                onTap: () => print("주소 관리 클릭 됨"),
                contentPadding: const EdgeInsets.all(0),
                leading: const Icon(Icons.home_outlined, color: Colors.black),
                title: const Text(
                  "주소 관리",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                onTap: () => print("결제 수단 관리 클릭 됨"),
                contentPadding: const EdgeInsets.all(0),
                leading:
                    const Icon(Icons.credit_card_outlined, color: Colors.black),
                title: const Text(
                  "결제 수단 관리",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                onTap: () => print("공지사항 클릭 됨"),
                contentPadding: const EdgeInsets.all(0),
                leading:
                    const Icon(Icons.volume_mute_outlined, color: Colors.black),
                title: const Text(
                  "공지사항",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                onTap: () => print("문의사항 클릭 됨"),
                contentPadding: const EdgeInsets.all(0),
                leading: const Icon(Icons.help_outline, color: Colors.black),
                title: const Text(
                  "문의사항",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
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
