import 'package:flutter/material.dart';

var dataObjects = [
    {
      "name": "La Fin Du Monde",
      "style": "Bock",
      "ibu": "65"
    },
    {
      "name": "Sapporo Premiume",
      "style": "Sour Ale",
      "ibu": "54"
    },
    {
      "name": "Duvel", 
      "style": "Pilsner", 
      "ibu": "82"
    },
    {
      "name": "Bohema", 
      "style": "Pilsner", 
      "ibu": "22"
    },  
    {
      "name": "Caracu", 
      "style": "Pilsen", 
      "ibu": "40"
    },
    {
      "name": "Devassa", 
      "style": "Pilsner", 
      "ibu": "55"
    },
    {
      "name": "Skol", 
      "style": "Pilsner", 
      "ibu": "40"
    },
        {
      "name": "Antartica", 
      "style": "Pilsner", 
      "ibu": "60"
    },
        {
      "name": "Duvel", 
      "style": "Pilsner", 
      "ibu": "82"
    },
        {
      "name": "Duvel", 
      "style": "Pilsner", 
      "ibu": "82"
    },
        {
      "name": "Duvel", 
      "style": "Pilsner", 
      "ibu": "82"
    },
        {
      "name": "Duvel", 
      "style": "Pilsner", 
      "ibu": "82"
    },
        {
      "name": "Duvel", 
      "style": "Pilsner", 
      "ibu": "82"
    },
        {
      "name": "Duvel", 
      "style": "Pilsner", 
      "ibu": "82"
    },
        {
      "name": "Duvel", 
      "style": "Pilsner", 
      "ibu": "82"
    },
        {
      "name": "Duvel", 
      "style": "Pilsner", 
      "ibu": "82"
    },
        {
      "name": "Duvel", 
      "style": "Pilsner", 
      "ibu": "82"
    },
        {
      "name": "Duvel", 
      "style": "Pilsner", 
      "ibu": "82"
    },
  ];



void main() {

  MyApp app = MyApp();

  runApp(app);

}





class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    

    return MaterialApp(

      theme: ThemeData(primarySwatch: Colors.deepPurple),

      debugShowCheckedModeBanner:false,

      home: Scaffold(

        appBar: AppBar( 

          title: const Text("Dicas"),

          ),

        body:  Center(
              child: MyTileWidget(objects: dataObjects, columnNames: ["Nome", "Estilo", "IBU"], propertyNames: ["name", "style", "ibu"]),),

        bottomNavigationBar: NewNavBar(),

      ));

  }   

}

class MyTileWidget extends StatelessWidget {
  List<Map<String, dynamic>> objects;
  final List<String> columnNames;
  final List<String> propertyNames;

  MyTileWidget({this.objects = const [], this.columnNames = const [], this.propertyNames = const []});

  @override
  
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: objects.length,
      itemBuilder: (context, index) {
        final obj = objects[index];

        final columnTexts = columnNames.map((col) {
          final prop = propertyNames[columnNames.indexOf(col)];
          return Text("$col: ${obj[prop]}");
        }).toList();

        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: columnTexts,
          ),
        );
      },
    );
  }
}





class NewNavBar extends StatelessWidget {

  NewNavBar();



  void botaoFoiTocado(int index) {

    print("Tocaram no botão $index");

  }



  @override

  Widget build(BuildContext context) {

    return BottomNavigationBar(onTap: botaoFoiTocado, items: const [

      BottomNavigationBarItem(
        label: "Cafés",
        icon: Icon(Icons.coffee_outlined),
      ),
      BottomNavigationBarItem(
          label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
      BottomNavigationBarItem(label: "Nações", icon: Icon(Icons.flag_outlined))
    ]);
  }
}


class DataBodyWidget extends StatelessWidget {

  List objects;

  DataBodyWidget( {this.objects = const [] });



  @override

  Widget build(BuildContext context){
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

      rows: objects.map( 

        (obj) => DataRow(

            cells: propertyNames.map(

              (propName) => DataCell(Text(obj[propName]))

            ).toList()

          )

        ).toList());
  }}