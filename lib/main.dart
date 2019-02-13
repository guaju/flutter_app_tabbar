import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'tabbar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Tab> list1 = new List();
  List<Widget> list2 = new List();
  var tabTitle = ['首页', '分类', '购物车', '我的'];
  var tabIcon = [
    Icon(Icons.home),
    Icon(Icons.category),
    Icon(Icons.shopping_cart),
    Icon(Icons.perm_contact_calendar)
  ];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 4; i++) {
      list1.add(new Tab(text: tabTitle[i], icon: tabIcon[i]));
      list2.add(new Column(children: <Widget>[
        tabIcon[i],
        Container(
          child: Text(tabTitle[i]),
          padding: EdgeInsets.only(top: 1.0),
        )
      ]));
    }
    var tabbar = new TabBar(
      tabs: list2,
      labelColor: Colors.red,
      labelStyle: TextStyle(
        fontSize: 14,
      ),
      isScrollable: false,
      unselectedLabelColor: Colors.white,
      indicatorColor: Colors.purple,
      controller: DefaultTabController.of(context),
    );

    return new DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: tabbar,
        ),
        body: TabBarView(children: <Widget>[
          Center(child: Text(tabTitle[0])),
          Center(child: Text(tabTitle[1])),
          Center(child: Text(tabTitle[2])),
          Center(child: Text(tabTitle[3]))
        ]),
      ),
    );
  }
}
