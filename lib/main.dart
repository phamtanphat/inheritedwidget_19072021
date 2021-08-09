import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Demo1InheritedWidget(
          child: Ongba(
            child: Chame(),
          ),
        ),
      ),
    );
  }
}

class Demo1InheritedWidget extends InheritedWidget{
  Widget child;
  int count = 10;

  Demo1InheritedWidget({required this.child}) : super(child : child);

  static Demo1InheritedWidget? off(BuildContext context){
    Demo1InheritedWidget? demo1inheritedWidget = context.dependOnInheritedWidgetOfExactType();
    return demo1inheritedWidget;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
   return false;
  }

}

class Ongba extends StatefulWidget {

  Widget child;

  Ongba({required this.child});

  @override
  _OngbaState createState() => _OngbaState();
}

class _OngbaState extends State<Ongba> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}


class Chame extends StatefulWidget {

  @override
  _ChameState createState() => _ChameState();
}

class _ChameState extends State<Chame> {
  @override
  Widget build(BuildContext context) {
    Demo1InheritedWidget? demo1 = Demo1InheritedWidget.off(context);
    return Container(
      child: Center(
        child: Text( demo1 == null ? "null" : demo1.count.toString()),
      ),
    );
  }
}
