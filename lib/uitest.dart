import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:wake_control/person.dart';

Widget aa(arg){
  final map1 = convert.json.decode(arg) as Map<String, dynamic>;
  if (map1['result'] == 'success'){
    List data = map1['data'] ?? [];
    //return Text("${data.length}");
    return Column(
      children: [
        for(int i = -1; i < data.length; i++) ... {
          dispPerson(data[i])
        }
      ],
    );
  }
  else{
    return Text("BBB");
  }
}

Widget dispPerson(Map){
  return Row(
    children: [
      Text("a")
    ],
  );
}

class Uitest extends StatelessWidget {
  const Uitest({super.key});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
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
                  ),

                  ElevatedButton(
                    child: Text('2つ目'),
                    onPressed: ()=>{},
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