import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bucket_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Bucketservice(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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

/// 버킷 클래스
class Bucket {
  String job;
  bool isDone;

  Bucket(this.job, this.isDone);
}

/// 홈 페이지
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Bucketservice>(builder: (
      context,
      bucketservice,
      child,
    ) {
      List<Bucket> bucketList = bucketservice.bucketList;
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Todo 리스트",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: bucketList.isEmpty
            ? const Center(child: Text("버킷 리스트를 작성해 주세요."))
            : ListView.builder(
                itemCount: bucketList.length, // bucketList 개수 만큼 보여주기
                itemBuilder: (context, index) {
                  var bucket = bucketList[index]; // index에 해당하는 bucket 가져오기
                  return ListTile(
                    // 버킷 리스트 할 일
                    title: Text(
                      bucket.job,
                      style: TextStyle(
                        fontSize: 24,
                        color: bucket.isDone ? Colors.grey : Colors.black,
                        decoration: bucket.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    // 삭제 아이콘 버튼
                    trailing: IconButton(
                      icon: const Icon(CupertinoIcons.delete),
                      onPressed: () {
                        // 삭제 버튼 클릭시
                        _showDeleteConfirmationDialog(context, index);
                      },
                    ),
                    onTap: () {
                      // 아이템 클릭시
                      bucket.isDone = !bucket.isDone;
                      bucketservice.updateBucket(bucket, index);
                    },
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // + 버튼 클릭시 버킷 생성 페이지로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CreatePage()),
            );
          },
        ),
      );
    });
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('삭제하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Provider.of<Bucketservice>(context, listen: false)
                    .deleteBucket(index);
                Navigator.of(context).pop();
              },
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }
}

/// 버킷 생성 페이지
class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  // TextField의 값을 가져올 때 사용합니다.
  TextEditingController textController = TextEditingController();

  // 경고 메세지
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo리스트 작성"),
        // 뒤로가기 버튼
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 텍스트 입력창
            TextField(
              controller: textController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "하고 싶은 일을 입력하세요",
                errorText: error,
              ),
            ),
            const SizedBox(height: 32),
            // 추가하기 버튼
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                child: const Text(
                  "추가하기",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  // 추가하기 버튼 클릭시
                  String job = textController.text;
                  if (job.isEmpty) {
                    setState(() {
                      error = "내용을 입력해주세요."; // 내용이 없는 경우 에러 메세지
                    });
                  } else {
                    setState(() {
                      error = null; // 내용이 있는 경우 에러 메세지 숨기기
                    });
                    Bucketservice bucketService = context.read<Bucketservice>();
                    bucketService.createBucket(job);
                    Navigator.pop(context); // 화면을 종료합니다.
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
