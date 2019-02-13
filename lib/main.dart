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

// 如果想使用asset 目录下的图标，那么需要自定义TabController 而自定义TabController 则需要with SingleTickerProviderStateMixin，并且实现 initState()  dispose() 方法
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  var _currentIndex = 0;
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
  void initState() {
    super.initState();
    //初始化
    _tabController = new TabController(vsync: this, length: tabTitle.length);
    //添加监听，记录当前切换到的页面索引
    _tabController.addListener(() {
      setState(() => _currentIndex = _tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
    Widget _getTabBar(int index) {
      var tabbar = new TabBar(
        controller: _tabController,
        tabs: <Widget>[
          Column(
            children: <Widget>[
              Image(
                  image: index == 0
                      ? AssetImage('images/home_selected.png')
                      : AssetImage('images/home.png'),
                  width: 20,
                  height: 20),
              Container(
                child: Text(tabTitle[0]),
                padding: EdgeInsets.only(top: 1.0),
              )
            ],
          ),
          Column(children: <Widget>[
            Image(
              image: index == 1
                  ? AssetImage('images/category_selected.png')
                  : AssetImage('images/category.png'),
              width: 20,
              height: 20,
            ),
            Container(
              child: Text(tabTitle[1]),
              padding: EdgeInsets.only(top: 1.0),
            )
          ]),
          Column(children: <Widget>[
            Image(
              image: index == 2
                  ? AssetImage('images/cart_selected.png')
                  : AssetImage('images/cart.png'),
              width: 20,
              height: 20,
            ),
            Container(
              child: Text(tabTitle[2]),
              padding: EdgeInsets.only(top: 1.0),
            )
          ]),
          Column(children: <Widget>[
            Image(
              image: index == 3
                  ? AssetImage('images/mine_selected.png')
                  : AssetImage('images/mine.png'),
              width: 20,
              height: 20,
            ),
            Container(
              child: Text(tabTitle[3]),
              padding: EdgeInsets.only(top: 1.0),
            )
          ]),
        ],
        labelColor: Colors.red,
        labelStyle: TextStyle(
          fontSize: 14,
        ),
        isScrollable: false,
        unselectedLabelColor: Colors.white,
        indicatorColor: Colors.purple,
      );
      return tabbar;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: _getTabBar(_currentIndex),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        Center(child: Text(tabTitle[0])),
        Center(child: Text(tabTitle[1])),
        Center(child: Text(tabTitle[2])),
        Center(child: Text(tabTitle[3]))
      ]),
    );
  }
}
