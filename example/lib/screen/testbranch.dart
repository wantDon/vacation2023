import 'package:flutter/material.dart';
import 'package:flutter_pdfview_example/file_explorer.dart';
class SerchScreen extends StatelessWidget {
  const SerchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(

          children: [
            //탐색 설명
            Container(
              color: Colors.blue,
              height: 300,
              child: Center(
                child: Text(
                  '탐색 설명',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            //탐색 버튼 푸쉬와 팝으로 탐색창 구현하기.
            SizedBox(
              height: 200,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
              ),
              onPressed: (){
                print('TextButton');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FileExplorer()
                  ),
                );
              },
              child: Text('파일검색',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.blue,

                ),),
            ),
          ],
        ),
      ),
    );
  }
}
