import "package:flutter/material.dart";
import 'package:firebase_admob/firebase_admob.dart';
import 'dart:io' show Platform;

// 1-2. 탭 화면 (각 화면 import)

// 1-2. 탭 화면 (Stateless -> Stateful)
class MainPage extends StatefulWidget {
  // 1-2. 탭 화면 (_selectedTabIndex 변수 옮김)
  // 1-2. 탭 화면 (탭 인덱스 설정)
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedTabIndex = 0;

  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutter', 'firebase', 'admob'],
    testDevices: <String>[],
  );

  BannerAd bannerAd = BannerAd(
    adUnitId: BannerAd.testAdUnitId,
    size: AdSize.banner,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
  );

  @override
  void initState() {
    // TODO: implement initState
    FirebaseAdMob.instance.initialize(
        appId: 'ca-app-pub-9993888033176045~5660132668'); // Android Test App ID
    bannerAd..load()..show();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // 1-1. 상단화면 (제목 수정)
        title: Text('M o v i e'),
        // 1-1. 상단화면 (좌측 버튼 추가)
        leading: Icon(Icons.menu),

        // 1-1. 상단화면 (우측 팝업 버튼 및 이벤트 추가)
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("예매율순"),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text("큐레이션"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("최신순"),
                  value: 2,
                )
              ];
            },
            icon: Icon(Icons.sort),
            onSelected: (value) {
              if (value == 0)
                print("예매율순");
              else if (value == 1)
                print("큐레이션");
              else
                print("최신순");
            },
          )
        ],
      ),

      // 1-2. 탭 화면 (List, Grid Widget 연동)
      body: _buildPage(_selectedTabIndex),

      // 1-2. 탭 화면 (bottomNavigationBar 추가)
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            title: Text('List'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            title: Text('Grid'),
          )
        ],

        currentIndex: _selectedTabIndex,    //이놈의 역할은??

        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
            print("$_selectedTabIndex Tab Clicked");
          });
        },
      ),
    );
  }
}

// 1-2. 탭 화면 (State 구현)

// 1-2. 탭 화면 (List, Grid Widget 반환)
Widget _buildPage(index){
  if(index ==0)
    return Container();
  else
    return Container();
}