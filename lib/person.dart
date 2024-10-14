import 'package:flutter/material.dart';


class Person extends StatefulWidget {
  const Person({
    super.key,
    required this.name,
    required this.type,
    required this.wake,
    required this.depart,
    required this.commuteCode,
    required this.buzzerStatus,
    required this.callTime,
    required this.responseTime,
    required this.lastLogin,
    required this.lastPing,
  });

  final String name;
  final String type;
  final String wake;
  final String depart;
  final String commuteCode;
  final String buzzerStatus;
  final String callTime;
  final String responseTime;
  final String lastLogin;
  final String lastPing;

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  String _res = "";

  Color _commuteCodeColor = Colors.red;
  Icon _typeIcon = const Icon(
    Icons.house,
    color: Colors.grey,
    size: 24,
  );

  String _replacePoolStr(String arg){
    if(_pool.containsKey(arg) && _pool[arg] != null){
      return _pool[arg];
    }
    else{
      return '-';
    }
  }
  Color _replacePoolColor(String arg){
    if(_pool.containsKey(arg) && _pool[arg] != null){
      return _pool[arg];
    }
    else{
      return Colors.pink;
    }
  }
  Icon _replacePoolIcon(String arg){
    arg += "_icon";
    if(_pool.containsKey(arg) && _pool[arg] != null){
      return _pool[arg];
    }
    else{
      return Icon(Icons.abc);
    }
  }
  final Map<String, dynamic> _pool = {
    'ota' : '太田',
    'okada' : '岡田',
    'wakasugi' : '若杉',
    'tanaka' : '田中',
    'onboard' : '在艦',
    'night' : '夜帰り',
    'morning' : '朝帰り',
    'red': Colors.red,
    'yellow': Colors.yellow,
    'lime': Colors.green,
    'onboard_icon': const Icon(
      Icons.house,
      color: Colors.grey,
      size: 24,
    ),
    'night_icon': const Icon(
      Icons.mode_night,
      color: Color(0xFF9E42E3),
      size: 24,
    ),
    'morning_icon': const Icon(
      Icons.sunny,
      color: Color.fromARGB(255, 255, 134, 5),
      size: 24,
    )
  };
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
      child: Container(
        width: 10, 
        height: 100,
        /*iro*/color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 120,
              height: 100,
              color: Colors.blueGrey[100],
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                //kokoman
                                color: _replacePoolColor(widget.commuteCode),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            //kokoman
                            _replacePoolStr(widget.name),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                            )
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              // kokoman
                              child: _replacePoolIcon(widget.type),
                            )
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            //kokoman
                            _replacePoolStr(widget.type),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 0.0,
                              ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 90,
              height: MediaQuery.sizeOf(context).height * 1,
              decoration: BoxDecoration(
                /*iro*/color: Colors.transparent,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[50],
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                //kokoman
                                '起床'
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 25,
                          decoration: BoxDecoration(
                            color:  Colors.blueGrey[200],
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                //kokoman
                                '帰艦開始',
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[50],
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                //kokoman
                                'ログイン',
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[200],
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                //kokoman
                                'ブザー',
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 150,
              height: MediaQuery.sizeOf(context).height * 1,
              decoration: BoxDecoration(
                /*iro*/color: Colors.transparent,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[50],
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                //kokoman
                                widget.wake
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 25,
                          decoration: BoxDecoration(
                            color:  Colors.blueGrey[200],
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                //kokoman
                                widget.depart,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[50],
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                //kokoman
                                widget.lastLogin,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[200],
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                //kokoman
                                widget.buzzerStatus,
                                textAlign: TextAlign.start,
                              
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

