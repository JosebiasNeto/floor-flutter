import 'package:flutter/material.dart';
import 'Item.dart';
import 'package:floor/floor.dart';
import 'itemdatabase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lista de Compras'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ItemManager{
  Future<void> databaseInsert(Item item) async {
    final database = await $FloorItemDatabase.databaseBuilder("item_database.db").build();
    final itemDao = database.itemDao;
    await itemDao.insertItem(item);
  }

  Future<List<Item>> databaseGetList() async {
    final database = await $FloorItemDatabase.databaseBuilder("item_database.db").build();
    final itemDao = database.itemDao;
    return itemDao.getItens();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  List<Item> itens = [];
  ItemManager itemManager = ItemManager();

  void initList() async{
    await itemManager.databaseInsert(Item("laranja", false, null));
    itens = await itemManager.databaseGetList();
  }

  void delete(Item item){
    setState((){
      itens.remove(item);
    });
  }

  bool checado = true;

  CardItem(Item item){
    return Card(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Row(
        children: [
          Checkbox(value: item.checked,
              onChanged: (bool? isCheck) => {
            setState((){
              item.checked = isCheck!;
            })}),
          Text(item.nome),
          IconButton(
            padding: EdgeInsets.only(left: 250),
            color: Colors.red,
            onPressed: () => delete(item),
            icon: const Icon(Icons.delete),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
              itemCount: itens.length,
              itemBuilder: (context, index){
                final item = itens[index];
                return CardItem(item);
              }
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          initList()
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}