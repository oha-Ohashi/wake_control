import 'dart:async';
import 'package:flutter/material.dart';
import 'req.dart' as req;
import 'person.dart' as person;

class MyFrame extends StatefulWidget {
  const MyFrame({super.key});

  @override
  State<MyFrame> createState() => _MyFrameState();
}

class _MyFrameState extends State<MyFrame> {
  Timer? _timer;
  String _log1 = "log 1";
  String _testText = "---";
  String _res2 = "teaaaaaaaaaaaaaaaaa";
  Widget _res3 = Text("res3");

  Map<String, String> _param = {
    'mode': 'hello',
    'name': 'aaa',
    'value': 'aaa'
  };

  void disp() {
    setState(() {
      _log1 = '${new DateTime.now().millisecond}';
    });
    req.fetchData(_param).then((value){
      setState(() {
        _testText = value;
      });
    });
  }

  void test2() {
    String json = '{"result":"seccess","data":[{"name":"ota","type":"morning","wake":447,"depart":510,"status":"","buzzerStatus":"oncall","callTime":700,"responseTime":0,"lastLogin":1010,"lastPing":""},{"name":"okada","type":"morning","wake":450,"depart":-1,"status":"","buzzerStatus":"--","callTime":0,"responseTime":0,"lastLogin":2020,"lastPing":""},{"name":"wakasugi","type":"morning","wake":"10/12_22:58","depart":"10/12_22:58","status":"lime","buzzerStatus":"responded","callTime":1728743188392,"responseTime":1728743190459,"lastLogin":3050,"lastPing":""},{"name":"tanaka","type":"onboard","wake":"done","depart":"done","status":"lime","buzzerStatus":"responded","callTime":500,"responseTime":640,"lastLogin":6010,"lastPing":""},{"name":"tester","type":"night","wake":"done","depart":"10/12_22:58","status":"lime","buzzerStatus":"responded","callTime":1728741312832,"responseTime":1728741315070,"lastLogin":"","lastPing":1728865894054}]}';
    
    setState(() {
      _res2 = '${new DateTime.now().millisecond}';
    });
  }

  void test3(){
    String json = '{"result":"success","data":[{"name":"ota","type":"morning","wake":447,"depart":510,"status":"","buzzerStatus":"oncall","callTime":700,"responseTime":0,"lastLogin":1010,"lastPing":""},{"name":"okada","type":"morning","wake":450,"depart":-1,"status":"","buzzerStatus":"--","callTime":0,"responseTime":0,"lastLogin":2020,"lastPing":""},{"name":"wakasugi","type":"morning","wake":"10/12_22:58","depart":"10/12_22:58","status":"lime","buzzerStatus":"responded","callTime":1728743188392,"responseTime":1728743190459,"lastLogin":3050,"lastPing":""},{"name":"tanaka","type":"onboard","wake":"done","depart":"done","status":"lime","buzzerStatus":"responded","callTime":500,"responseTime":640,"lastLogin":6010,"lastPing":""},{"name":"tester","type":"night","wake":"done","depart":"10/12_22:58","status":"lime","buzzerStatus":"responded","callTime":1728741312832,"responseTime":1728741315070,"lastLogin":"","lastPing":1728865894054}]}';

    setState(() {
      //_res3 = person.aa(json);
    });
  }

  @override
  void initState() {
    super.initState();

    //_startLoop();
    _startTimer();
  }


  void _startTimer() {
    // 1秒ごとに_fetchDataを実行
    _timer = Timer.periodic(Duration(milliseconds: 500), (Timer t) => disp());
  }
  
  @override
  void dispose() {
    // タイマーをキャンセル
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          title: const Text(
            'Test',
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(_log1),
              Text(_testText),
              //Text(_status),
              ElevatedButton(
                child: Text('１つ目'),
                onPressed: disp,
              ),

              Text(_res2),
              ElevatedButton(
                child: Text('2つ目'),
                onPressed: test2,
              ),

              _res3,
              ElevatedButton(
                child: Text('3つ目'),
                onPressed: test3,
              ),
            ],
          ),
        ),
      );
  }
}