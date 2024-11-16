import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyTodoApp(),
    );
  }
}

class MyTodoApp extends StatefulWidget {
  const MyTodoApp({super.key});

  @override
  State<MyTodoApp> createState() => _MyTodoAppState();
}

class _MyTodoAppState extends State<MyTodoApp> {
 
 final List _todos = [];
 final TextEditingController _textController = TextEditingController();

 void _addTodo(){
  if(_textController.text.isNotEmpty){
     setState(() {
       _todos.add(_textController.text);
       _textController.clear();
     });
  }
 }

 void _removeTodo(int index){
  setState(() {
    _todos.removeAt(index);
  });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: const Text("Todo List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: "Enter a Task"
                  ),
                )),
                IconButton(onPressed: _addTodo, icon: const Icon(Icons.add), tooltip: "Add Task",)
              ],
            ),
            ),
            Expanded(
              child: ListView.builder(
              itemCount: _todos.length, 
              itemBuilder: (context , index){
                return ListTile(
                  title: Text(_todos[index]),
                  trailing: IconButton(onPressed: () => _removeTodo(index), icon: const Icon(Icons.delete)),
                );
              },))            
        ],
      ),
    );
  }
}
