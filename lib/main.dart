import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/time_model.dart';
import 'package:todo_app/todo_model.dart';
import 'package:intl/intl.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context)=>TodoModel(),
        child:  MyHomePage(),
      ),
    );
  }
}
class MyHomePage extends StatelessWidget {
  String? formattedDateTime="hh";

  MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (Timer t){
     var time= Provider.of<TodoModel>(context,listen: false);
      time.updateRemainingTime();
    });
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Todo Application", style: TextStyle(color: Colors.white),),
        leading: IconButton(icon: const Icon(Icons.menu, color: Colors.white70,),
          onPressed: () {  },),
      ),
      body:  Column(
        children: <Widget>[
      Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        children:  <Widget>[
          const SizedBox(height: 20,),
          Consumer<TodoModel>(builder: (context,time,child){
            return Text(time.getTime().toString(),
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 45,
                  fontWeight: FontWeight.bold
              ),);
          }),
          const Text("current time",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,),),
          const SizedBox(height: 20,),
        ],
      ),
          Expanded(child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(60)),
                color: Colors.white),
            child:Consumer<TodoModel>(
              builder: (context,todo,child) {
                return ListView.builder(
                    itemCount: todo.taskList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(
                              left: 32, right: 32, top: 8, bottom: 8),
                          title: Text(todo.taskList[index].title,
                            style: const TextStyle(color: Colors.black87,
                                fontWeight: FontWeight.bold),),
                          subtitle: Text(todo.taskList[index].detail,
                            style: const TextStyle(color: Colors.black45,
                                fontWeight: FontWeight.bold),),

                          trailing: const Icon(
                            Icons.check_circle, color: Colors.greenAccent,),
                        ),
                        margin: const EdgeInsets.only(bottom: 8,
                            left: 16,
                            right: 16),
                      );
                    }
                );
              }
            ) ,
          ))
      ]
    ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Provider.of<TodoModel>(context,listen: false).addTaskInList();
        },
      ),

    );
  }
}


