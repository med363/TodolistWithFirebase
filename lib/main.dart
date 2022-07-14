import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.orange
    ),
    home: MyApp()
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /*define list*/
  List todos = [];
  String input = "";
  /*define enter of to do list*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*temporairy memory we can deleted*/
    todos.add("item1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My todo for today"),
      ),
      /*butto faire l'action to show dialog bar*/
        floatingActionButton: FloatingActionButton(onPressed:(){
          /*Ajout dialog bar to ad new itew*/
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
            title: Text('Add Todolist'),
              content: TextField(
                onChanged: (String value){
                  input = value;
                },
              ),
              actions: [
                FlatButton(onPressed: (){
                  setState((){
    todos.add(input);
    /*hide dialogue bar */
    Navigator.pop(context,true);
                  });

                }, child: Text("Add"))
              ],
            );
            /*when click add item will aded in list */
            Navigator.of(context).pop();

        });

        } ,child: Icon(Icons.add, color: Colors.white,),),
      body: ListView.builder(itemCount: todos.length,itemBuilder: (BuildContext context, int index){
        return Dismissible(key: Key(todos[index]),
            background: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              child: Icon(Icons.delete,color: Colors.white),
            ),
            /*swipe to delete*/
            onDismissed: (direction){
              setState((){
                todos.removeAt(index);
              });

            },
            child: Card(
          shadowColor: Colors.blue,
          /*shadow*/
          elevation: 4,
          /*margin*/
          margin: EdgeInsets.all(8),
          /*add shape*/
          shape: RoundedRectangleBorder(borderRadius: 
          BorderRadius.circular(16)),
          child: ListTile(title: Text(todos[index]),
          /*add neew ico to delete*/
          /*trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: (){
            setState(()=> todos.removeAt(index)
            );
          },
          ),*/
          ),
        )
    );},
    )
    );
  }
}

