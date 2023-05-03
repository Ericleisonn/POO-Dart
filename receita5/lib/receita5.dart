// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
var dataObjects = [];

     // EXERCÍCIO 1 
//  1. No print da classe HookWidget, as mudanças de estado de um botão para outra da bottomNavigationBar são contabilizadas no console, ou seja, em toda mudança de estado de qualquer classe, elas são contabilizadas e o ícone é redenrizado novamente.

void main() {

  MyApp app = MyApp();

  runApp(app);

}



class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    print("no build da classe $MyApp");
    

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        appBar: AppBar( 
          title: const Text("Dicas"),
          ),
        body: DataTableWidget(jsonObjects:dataObjects),
        bottomNavigationBar: NewNavBar2(),
      ));}}

class DataTableWidget extends StatelessWidget {

  final List jsonObjects;

  DataTableWidget( {this.jsonObjects = const [] });



  @override

  Widget build(BuildContext context) {
    print("no build da classe $DataTableWidget");

    

    var columnNames = ["Nome","Estilo","IBU"],

        propertyNames = ["name", "style", "ibu"];

    

    return DataTable(

      columns: columnNames.map( 

                (name) => DataColumn(

                  label: Expanded(

                    child: Text(name, style: const TextStyle(fontStyle: FontStyle.italic))

                  )

                )

              ).toList()       

      ,

      rows: jsonObjects.map( 
        (obj) => DataRow(cells: propertyNames.map((propName) => DataCell(Text(obj[propName]))).toList())
        ).toList());}}


class NewNavBar2 extends StatefulWidget {
  NewNavBar2();
  @override
  _ItemCounterState createState() => _ItemCounterState();
  }
  class _ItemCounterState extends State<NewNavBar2> {
    _ItemCounterState();
    int state = 0;
    void buttonTapped(int index) {
    print("Tocaram no botão $index");
  }
    @override
  Widget build(BuildContext context) {
    print("no build da classe NewNavBar2");
      return BottomNavigationBar(
        onTap: (index){
          setState(() {
            state = index;
          });
  },
  currentIndex: state,
  items: const [
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
              label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
          BottomNavigationBarItem(
              label: "Nações", icon: Icon(Icons.flag_outlined))
        ]);
  }}