import 'package:flutter/material.dart';

import '../screens/profile_screen.dart';

import '../widgets/drawer_item.dart';
import '../widgets/my_flat_button.dart';
import '../widgets/my_outline_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _pageIndex = 0;
  PageController _pageController;
  PageController _appBarController;
  List<Map<String, Object>> _pages;

  void drawerItemOnPressed(int index) async {
    Navigator.of(context).pop();
    if (_pageIndex < index) {
      for (int i = _pageIndex; i <= index; i++) {
        _pageIndex = i;
        _appBarController.animateToPage(
          i,
          duration: _pageIndex == i
              ? Duration(milliseconds: 50)
              : Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        _pageController.animateToPage(
          i,
          duration: _pageIndex == i
              ? Duration(milliseconds: 50)
              : Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        await Future.delayed(Duration(milliseconds: 200));
      }
    } else {
      for (int i = _pageIndex; i >= index; i--) {
        _pageIndex = i;
        _appBarController.animateToPage(
          i,
          duration: _pageIndex == i
              ? Duration(milliseconds: 50)
              : Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        _pageController.animateToPage(
          i,
          duration: _pageIndex == i
              ? Duration(milliseconds: 50)
              : Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        await Future.delayed(Duration(milliseconds: 200));
      }
    }

    setState(() {});
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      keepPage: false,
    );
    _appBarController = PageController(
      initialPage: 0,
      keepPage: false,
    );
    _pages = [
      {
        'title': 'Home',
        'page': Container(
          child: Center(
            child: Text('This is home screen'),
          ),
        ),
      },
      {
        'title': 'Notifications',
        'page': Container(
          child: Center(
            child: Text('This is notification screen'),
          ),
        ),
      },
      {
        'title': 'Messages',
        'page': Container(
          child: Center(
            child: Text('This is messages screen'),
          ),
        ),
      },
      {
        'title': 'Profile',
        'page': ProfileScreen(),
      },
    ];
    super.initState();
  }

  void displayBottomSheet() {
    Navigator.of(context).pop();
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) => ClipPath(
        clipper: _BottomSheetClipper(),
        child: Container(
          padding: const EdgeInsets.only(
            top: 32.0,
            left: 22.0,
            right: 22.0,
            bottom: 8.0,
          ),
          height: MediaQuery.of(context).size.height * 0.22,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Are You Sure You Want \nTo SignOut?',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subhead,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: Colors.white,
                    child: Text(
                      'Signout',
                      style: Theme.of(context).textTheme.button,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  OutlineButton(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Stay Signed In',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: ClipPath(
        clipper: _DrawerClipper(),
        child: Drawer(
          child: Container(
            padding: EdgeInsets.only(
              top: mediaQuery.padding.top,
              right: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                MyFlatButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                DrawerItem(
                  text: 'Home',
                  myIndex: 0,
                  selectedIndex: _pageIndex,
                  onPressed: () {
                    drawerItemOnPressed(0);
                  },
                ),
                DrawerItem(
                  text: 'Notifications',
                  myIndex: 1,
                  selectedIndex: _pageIndex,
                  onPressed: () {
                    drawerItemOnPressed(1);
                  },
                ),
                DrawerItem(
                  text: 'Messages',
                  myIndex: 2,
                  selectedIndex: _pageIndex,
                  onPressed: () {
                    drawerItemOnPressed(2);
                  },
                ),
                DrawerItem(
                  text: 'Profile',
                  myIndex: 3,
                  selectedIndex: _pageIndex,
                  onPressed: () {
                    drawerItemOnPressed(3);
                  },
                ),
                Spacer(),
                FlatButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: displayBottomSheet,
                  child: RichText(
                    text: TextSpan(
                      text: 'Not You? ',
                      style: Theme.of(context).textTheme.body1,
                      children: [
                        TextSpan(
                          text: 'Sign Out',
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .copyWith(decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              //top spacing
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              //my custom appbar
              ClipPath(
                clipper: _AppBarClipper(),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  width: mediaQuery.size.width,
                  height: _pageIndex == _pages.length - 1
                      ? mediaQuery.size.height * 0.2
                      : mediaQuery.size.height * 0.15,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MyOutlineButton(
                          child: Icon(
                            Icons.home,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
                        Transform.translate(
                          offset: Offset(0, 12),
                          child: Container(
                            height: mediaQuery.size.height * 0.15,
                            width: mediaQuery.size.width * 0.7,
                            alignment: Alignment.center,
                            child: PageView.builder(
                              pageSnapping: true,
                              controller: _appBarController,
                              physics: BouncingScrollPhysics(),
                              itemCount: _pages.length,
                              itemBuilder: (ctx, index) => Column(
                                children: <Widget>[
                                  Text(
                                    _pages[index]['title'],
                                    style: textTheme.title,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              onPageChanged: (index) {
                                setState(() {
                                  _pageIndex = index;
                                  _pageController.animateToPage(
                                    index,
                                    duration: Duration(milliseconds: 1200),
                                    curve: Curves.elasticOut,
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                        MyOutlineButton(
                          child: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {
                            _scaffoldKey.currentState.openEndDrawer();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height * 0.6,
                child: PageView.builder(
                  pageSnapping: true,
                  controller: _pageController,
                  physics: BouncingScrollPhysics(),
                  itemCount: _pages.length,
                  itemBuilder: (ctx, index) {
                    return _pages[index]['page'];
                  },
                  onPageChanged: (index) {
                    _pageIndex = index;
                    setState(() {
                      _appBarController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 1200),
                        curve: Curves.elasticOut,
                      );
                    });
                  },
                ),
              ),
            ],
          ),
          _pageIndex == _pages.length - 1
              ? Positioned(
                  top: mediaQuery.size.height * 0.13,
                  left: (mediaQuery.size.width / 2) - (110 / 2),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Container(
                      height: 110,
                      width: 110,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 80,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _DrawerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(size.width / 2.7, 0);
    path.quadraticBezierTo(0, size.height / 2, size.width / 2.7, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class _AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.7,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class _BottomSheetClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width / 2,
      0,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
