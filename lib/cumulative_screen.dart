import 'package:flutter/material.dart';
import 'package:goodhabbitsmonitor/cumulative.dart';

class Cumulative extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var Counter = CumCounter.of(context);
    return Scaffold(

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(child: Center(child: Text('Great!!!',style: TextStyle(fontSize: 50,color: Colors.blue),),),),
            Container(child: Center(child: Text('Your score today is :',style: TextStyle(fontSize: 30,color: Colors.blue),),),),


            Text(
              '${Counter.habits.length*5}',
                style: TextStyle(fontSize: 100,color: Colors.blue)
            ),
          ],
        ),

      ),

    );
  }
}