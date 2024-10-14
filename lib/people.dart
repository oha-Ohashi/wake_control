import 'dart:async';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:wake_control/person.dart';
import 'req.dart' as req;
import 'person.dart' as person;

List<Widget> processPeople(arg){
  List<Widget> res = [];
  final map1 = convert.json.decode(arg) as Map<String, dynamic>;
  if (map1['result'] == 'success'){
    List data = map1['data'] ?? [];
    //return Text("${data.length}");
    for(int i = 0; i < data.length; i++) {
      res.add(
        processPerson(data[i])

      );
    }
  }
  
  return res;
}

Widget processPerson(argMap){
  return person.Person(
    name: argMap['name'],
    type: argMap['type'], 
    wake: argMap['wake'], 
    depart: argMap['depart'], 
    commuteCode: argMap['status'], 
    buzzerStatus: argMap['buzzerStatus'], 
    callTime: argMap['callTime'], 
    responseTime: argMap['responseTime'], 
    lastLogin: argMap['lastLogin'], 
    lastPing: argMap['lastPing']
  );
}


class People extends StatefulWidget {
  const People({super.key});

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  Timer? _timer;
  String _timeStamp = "[clock]";
  List<Widget> _contents = [];
  
  Map<String, String> _param = {
    'mode': 'hello',
    'name': 'aaa',
    'value': 'aaa'
  };

  void disp() {
    setState(() {
      //_contents = processPeople('{"result":"success","data":[{"name":"ota","type":"morning","wake":"4431o","depart":"aeoi4321","status":"","buzzerStatus":"oncall","callTime":"4431o","responseTime":"4431o","lastLogin":"4431o","lastPing":"4431o"},{"name":"okada","type":"morning","wake":"43211eaio","depart":"aeio","status":"","buzzerStatus":"--","callTime":"43211eaio","responseTime":"43211eaio","lastLogin":"43211eaio","lastPing":"43211eaio"},{"name":"wakasugi","type":"morning","wake":"10/12_22:58","depart":"10/12_22:58","status":"lime","buzzerStatus":"responded","callTime":"10/12_22:58","responseTime":"10/12_22:58","lastLogin":"10/12_22:58","lastPing":"10/12_22:58"},{"name":"tanaka","type":"onboard","wake":"done","depart":"done","status":"lime","buzzerStatus":"responded","callTime":"done","responseTime":"done","lastLogin":"done","lastPing":"done"},{"name":"tester","type":"night","wake":"done","depart":"10/12_22:58","status":"lime","buzzerStatus":"responded","callTime":"done","responseTime":"done","lastLogin":"done","lastPing":"1728886826500"}]}');
      
      DateTime dt = new DateTime.now();
      _timeStamp = '[clock] ${dt.hour}:${dt.minute}.${dt.second}';
    });
    req.fetchData(_param).then((value){
      _contents = processPeople(value);
    });
  }

  @override
  void initState() {
    super.initState();

    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          
          automaticallyImplyLeading: false,
          title: Text(
            'みんなの状態',
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: Alignment(0,-1),
            child: Container(
              width: 360,
              height: 800,
              /*iro*/color: Colors.blue[100],
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [


                  /*
                  const Person(
                    name: 'ota',
                    type: 'morning',
                    wake: '10/12_2256i',
                    depart: '10/12_2258i',
                    commuteCode: 'red',
                    buzzerStatus: 'responded',
                    callTime: '10/13_0530i',
                    responseTime: '10/13_0540i',
                    lastLogin: '10/13_0539i',
                    lastPing: '10/13_0800i'
                  ),
                  const Person(
                    name: 'wakasugi',
                    type: 'onboard',
                    wake: '10/12_2256i',
                    depart: '10/12_2258i',
                    commuteCode: 'lime',
                    buzzerStatus: 'responded',
                    callTime: '10/13_0530i',
                    responseTime: '10/13_0540i',
                    lastLogin: '10/13_0539i',
                    lastPing: '10/13_0800i'
                  ),
                  const Person(
                    name: 'okada',
                    type: 'night',
                    wake: '10/12_2256i',
                    depart: '10/12_2258i',
                    commuteCode: 'yellow',
                    buzzerStatus: 'responded',
                    callTime: '10/13_0530i',
                    responseTime: '10/13_0540i',
                    lastLogin: '10/13_0539i',
                    lastPing: '10/13_0800i'
                  ),*/

                  for(int i = 0; i < _contents.length; i++) ... {
                    _contents[i]
                  },

                  Text(_timeStamp),

                  ElevatedButton(
                    child: Text('2つ目'),
                    onPressed: () => {
                      
                    }
                  ),

                  for(int i = 0; i < 0; i++) ... {
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      height: 100,
                      color: Color.fromARGB(251, 78, 177, 76),
                      child: Text("aa"),
                    ),
                  }
                ],
              ),

            ),
          ),
        ),
      ),
    );
  }
}