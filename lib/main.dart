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
        body: CounterPage(
          child: ChildWidget(),
        ),
      ),
    );
  }
}

class CounterPage extends StatefulWidget {

  Widget child;

  CounterPage({required this.child});

  @override
  _CounterPageState createState() => _CounterPageState();
}

// state object
class _CounterPageState extends State<CounterPage> {
  int count = 0;

  void setCount(){
    setState(() {
      count += 1;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Demo2InheritedWidget(child: widget.child, state: this),
            ElevatedButton(
                onPressed: (){
                  setCount();
                },
                child: Text("Increment"))
          ],
        ),
      ),
    );
  }
}

class Demo2InheritedWidget extends InheritedWidget{

  Widget child;
  _CounterPageState state;

  Demo2InheritedWidget({required this.child , required this.state}) : super(child : child);

  static Demo2InheritedWidget? of(BuildContext context){
    Demo2InheritedWidget? demo2 = context.dependOnInheritedWidgetOfExactType();
    return demo2;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class ChildWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Demo2InheritedWidget? demo2inheritedWidget = Demo2InheritedWidget.of(context);
    return Container(
      child: Text(
          demo2inheritedWidget != null ? demo2inheritedWidget.state.count.toString() : "null"),
    );
  }
}

