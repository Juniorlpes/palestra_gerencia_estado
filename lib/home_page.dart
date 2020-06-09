import 'package:flutter/material.dart';
import 'package:open_mind_sm/todo_controller.dart';
import 'package:open_mind_sm/todo_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TodoController controller = TodoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerenciamento/Gerência de estado",
          style: TextStyle(color: Colors.white,)
        ),
        leading: Center(
          child: Text(controller.todos.where((todo) => todo.checked).length.toString(),
            style: TextStyle(color: Colors.white,)
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white, size: 20,),
        onPressed: () async {
          await _showEditDialog(context, controller);  
          setState(() {});
        }
      ),
      body: ListView.builder(
        itemCount: controller.todos.length,
        itemBuilder: (_, index){
          return ListTile(
            title: Text(controller.todos[index].todo),
            leading: IconButton(
              icon: Icon(Icons.remove_circle, color: Colors.red),
              onPressed: (){
                setState(() {
                  controller.todos.remove(controller.todos[index]);
                });
              }
            ),
            trailing: Checkbox(
              value: controller.todos[index].checked, 
              onChanged: (v){
                setState(() {
                  controller.todos[index].checked = v;
                });
              }
            ),
          );
        }
      ),
    );
  }

}

Future<void> _showEditDialog(BuildContext context, TodoController controller){
  var textController = TextEditingController();
  return showDialog(context: context,
    builder: (context) => AlertDialog(
      title: Text("Novo"),
      content: TextField(
        controller: textController,
      ),
      actions: [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text("Add"),
          onPressed: (){
            controller.todos.add(TodoModel(todo: textController.text));
            Navigator.pop(context);
          },
        ),
      ],
    )
  );

}