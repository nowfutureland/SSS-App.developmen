import 'package:flutter/cupertino.dart';
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
      home: StarBucs(),
    );
  }
}

Color starbucksPrimaryColor = const Color.fromARGB(255, 83, 184, 138);
Color starbucksAccentColor = const Color.fromARGB(255, 199, 176, 121);

class StarBucs extends StatefulWidget {
  const StarBucs({super.key});

  @override
  State<StarBucs> createState() => _StarBucState();
}

class _StarBucState extends State<StarBucs> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          StarBucsFirstPage(),
          StarBucsSecondPage(),
          StarbucsThirdPage(),
          Center(
            child: Text("스타벅스 네번째 페이지"),
          ),
          Center(
            child: Text("스타벅스 다섯번째 페이지"),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(
            () {
              currentIndex = newIndex;
            },
          );
        },
        selectedItemColor: starbucksPrimaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white.withOpacity(0.8),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.free_breakfast), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.redeem), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: ""),
        ],
      ),
    );
  }
}

class StarBucsFirstPage extends StatelessWidget {
  const StarBucsFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String backImg =
        "https://i.ibb.co/2Pz33q7/2021-12-16-12-21-42-cleanup.png";
    const String freequencyImg =
        "https://i.ibb.co/QcVn97y/2021-12-16-1-33-11.png";
    final List<Map<String, dynamic>> recommendMenu = [
      {
        "name": "돌체쿠키라떼",
        "imgUrl":
            "https://i.ibb.co/SwGPpzR/9200000003687-20211118142543832.jpg",
      },
      {
        "name": "아이스 홀리데이 돌체 쿠키 라떼",
        "imgUrl":
            "https://i.ibb.co/JHVXZ72/9200000003690-20211118142702357.jpg",
      },
      {
        "name": "스노우 민트 초콜릿",
        "imgUrl":
            "https://i.ibb.co/M91G17c/9200000003693-20211118142933650.jpg",
      },
      {
        "name": "아이스 스노우 민트 초콜릿",
        "imgUrl":
            "https://i.ibb.co/jyZK4C9/9200000003696-20211118143125337.jpg",
      },
      {
        "name": "스노우 민트 초콜릿 블렌디드",
        "imgUrl":
            "https://i.ibb.co/DKkV0rw/9200000003699-20211118143249044.jpg",
      },
    ];
    const String eventImg = "https://i.ibb.co/Fb0q43T/IMG-F9-BA5-CBCB476-1.jpg";
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                snap: false,
                floating: true,
                expandedHeight: 252,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Stack(
                    children: [
                      Positioned.fill(
                        bottom: 60,
                        child: Image.network(
                          backImg,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        left: 24,
                        right: 24,
                        bottom: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "한 해의 마무리,\n수고 많았습니다.",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "11 ★ until next Reward",
                                        style: TextStyle(
                                            color: starbucksAccentColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        child: LinearProgressIndicator(
                                          backgroundColor:
                                              Colors.grey.withOpacity(0.2),
                                          value: 0.083,
                                          minHeight: 10,
                                          valueColor: AlwaysStoppedAnimation(
                                              starbucksAccentColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 28,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: "1",
                                        style: TextStyle(
                                          fontSize: 38,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: " / ",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      TextSpan(
                                        text: "12 ★",
                                        style: TextStyle(
                                          color: starbucksAccentColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(52),
                  child: Container(
                    height: 52,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 12),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("눌렸다");
                            },
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.mail_outline,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "What's New",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          GestureDetector(
                            onTap: () {
                              print("눌렸다");
                            },
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.confirmation_num_outlined,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Copon",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Stack(
                            children: [
                              const Icon(
                                Icons.notifications_outlined,
                                color: Colors.grey,
                                size: 32,
                              ),
                              Positioned(
                                right: 2,
                                top: 2,
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: starbucksPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StarBucsSecondPage extends StatelessWidget {
  const StarBucsSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class StarbucsThirdPage extends StatelessWidget {
  const StarbucsThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
