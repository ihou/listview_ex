import 'package:flutter/material.dart';
import 'package:listview_ex/listview_ex.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Material(
        child: Container(
          color: Colors.white,
          child: ListViewEx(
            header: Container(
              height: 60,
              alignment: Alignment.center,
              color: Colors.red,
              child: const Text("Header", style: textStyle),
            ),
            footer: Container(
              height: 60,
              alignment: Alignment.center,
              color: Colors.blue,
              child: const Text("Footer", style: textStyle),
            ),
            children: List<int>.generate(100, (index) => index)
                .map((e) => SizedBox(
                height: 40, child: Text(e.toString(), style: textStyle)))
                .toList(),
          ),
        ),
      ),
    );
  }
}
