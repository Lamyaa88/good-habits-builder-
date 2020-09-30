import 'dart:math';

import 'package:flutter/material.dart';
import 'package:goodhabbitsmonitor/cumulative_screen.dart';
import 'package:goodhabbitsmonitor/habit.dart';
import 'package:goodhabbitsmonitor/cumulative.dart';
class Home extends StatelessWidget {
  List<Habit> items = List.generate(30, (i) {
    return Habit(
        habit: 'habit $i', isCheck: false);
  });
  @override
  Widget build(BuildContext context) {
    CumCounter cart = CumCounter.of(context);
    return StatefulBuilder(
      builder: (context, StateSetter setState) {
        return Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Text(''
                'Total Points ',style: TextStyle(fontSize: 20),),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 0, right: 25),
                child: Container(child: Center(child: Text( '(${cart.habits.length*5})',style: TextStyle(fontSize:20),),),)
              ),
              IconButton(icon: Icon(Icons.assignment_turned_in), onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Cumulative()));
              },)
            ],
          ),
          body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, i) {
                return Card(
                  color: Colors.pink.shade200,
                  margin: EdgeInsets.all(2),
                  child: ListTile(
                    title: Row(
                      children: <Widget>[
                        Expanded(child: Text(items[i+1].habit)),
                        Checkbox(
                          value: items[i].isCheck,
                          onChanged: (value) {
                            setState(() {
                              items[i].isCheck = !items[i].isCheck;
                              if (items[i].isCheck) {
                                cart.habits.add(items[i]);
                              } else {
                                cart.habits.remove(items[i]);
                              }
                            });
                          },
                        )
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}