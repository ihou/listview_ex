<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

ListViewEx is just like ListView in flutter framework.it has the same fields. All you need to do is
replace ListView with ListViewEx,after that your got header property and footer property,they are
just normal widget.

## Features

![](./showcase/listview_ex.gif)

## Getting started

Replace your ListView with ListViewEx

## Usage

```dart

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
                .map((e) =>
                SizedBox(
                    height: 40, child: Text(e.toString(), style: textStyle)))
                .toList(),
          ),
        ),
      ),
    );
  }
}

```
