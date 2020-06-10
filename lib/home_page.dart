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
        leading: StreamBuilder<int>(
          initialData: 0,
          stream: controller.getOutInt,
          builder: (_, snapshot){
            return Center(
              child: Text(snapshot.data.toString(),
                style: TextStyle(color: Colors.white,)
              ),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white, size: 20,),
        onPressed: () async {
          await _showEditDialog(context, controller);  
        }
      ),
      body: StreamBuilder<List<TodoModel>>(
        initialData: controller.todos,
        stream: controller.output,
        builder: (index, snapshot){
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (_, index){
              return ListTile(
                title: Text(snapshot.data[index].todo),
                leading: IconButton(
                  icon: Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: (){
                    controller.removeModel(snapshot.data[index]);
                  }
                ),
                trailing: Checkbox(
                  value: controller.todos[index].checked, 
                  onChanged: (v){
                    controller.setCheck(snapshot.data[index], index);
                  }
                ),
              );
            }
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
            controller.addModel(TodoModel(todo: textController.text));
            Navigator.pop(context);
          },
        ),
      ],
    )
  );

}