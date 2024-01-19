// ignore_for_file: unnecessary_new, library_private_types_in_public_api, non_constant_identifier_names, unused_element, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item.dart';

void main() => runApp(const App());


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(133, 50, 1, 246)),
        useMaterial3: true,
      ),
      home : HomePage(),
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  var items = new List<Item>.empty();

  HomePage({super.key}) {
    items = [];
    items.add(Item(title: "Banana", done: false));
    items.add(Item(title: "Açúcar", done: true));
    items.add(Item(title: "Feijão", done: false));
  }
    
  @override   
  _HomePageState createState() => _HomePageState();
}
  
class _HomePageState extends State<HomePage> {
 var newTaskCtrl = TextEditingController();  

  void add(){
    if(newTaskCtrl.text.isEmpty) return;
    setState(() {
      widget.items.add(
      Item(
        title: newTaskCtrl.text, 
        done: false
        )
      );
      newTaskCtrl.text = "";

    });
  }  

  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: newTaskCtrl,
          keyboardType: TextInputType.text,
          style: const TextStyle(color: Color.fromARGB(255, 3, 3, 130), 
           fontSize : 22,
           ), 
          decoration:const InputDecoration(
            labelText: "Nova Tarefa",
            labelStyle: TextStyle(color: Color.fromARGB(255, 2, 82, 255)
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, int index) {
          final item = widget.items[index];
          return CheckboxListTile(
            title: Text(item.title),
            key: Key(item.title),
            value: item.done,
            onChanged: (value) {
              setState(() {
                item.done = value!;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 6, 2, 254),
        child: const Icon(Icons.add),
      ),
    );
  }
}