import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';


final ValueNotifier<List> twitter =  ValueNotifier([]);
final ValueNotifier<List> tableStateNotifier =  ValueNotifier([]);


class DataService extends ChangeNotifier{
  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]);

  List<String> columnsNames = [''];
  List<String> propertyNames = [''];


  void carregar(index){
    var counter$ = ValueNotifier(0);
    if (index == 0){
      columnsNames = ['Nome', 'Sabor', 'Preço'];
      propertyNames = ['name', 'flavor', 'price'];
      carregarCafes();
      // print("Index == 0");
    }
    else if (index == 1){
      columnsNames = ['Nome', 'Estilo', 'IBU'];
      propertyNames = ['name', 'style', 'ibu'];
      carregarCervejas();
      // print("Index == 1");

      }
    else if (index ==2){
      columnsNames = ['Nome', 'Linguagem', 'Presidente'];
      propertyNames = ['name', 'language', 'president'];
      carregarNacoes();
      // print("Index == 2");
    }
  }

 void carregarCafes(){
    tableStateNotifier.value = [{
            "name": "Santa Clara",
            "flavor": "Suave",
            "price": "55,35"
            },
            {
            "name": "Kimimo",
            "flavor": "Amargo",
            "price": "38,90"
            },
            {
            "name": "Maratá", 
            "flavor": "Intermediário", 
            "price": "50,50"
            }
          ];

    }
 void carregarNacoes(){
    tableStateNotifier.value = [{
            "name": "Brasil",
            "language": "Português",
            "president": "Leves"
            },
            {
            "name": "China",
            "language": "Chinese",
            "president": "Xi Jinping"
            },
            {
            "name": "Rússia", 
            "language": "Russian ", 
            "president": "Vladimir Putin"
            }
          ];
}
  void carregarCervejas(){
    tableStateNotifier.value = [{
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
            }
          ];
}}
final dataService = DataService();




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

        body:ValueListenableBuilder(

          valueListenable: dataService.tableStateNotifier,

          builder:(_, value, __){

            return DataTableWidget(

              jsonObjects:value, 

              propertyNames: dataService.propertyNames,

              columnNames: dataService.columnsNames

            );

          }

        ),

        bottomNavigationBar: NewNavBar(itemSelectedCallback: dataService.carregar),

      ));

  }



}





class NewNavBar extends HookWidget {
  var itemSelectedCallback;
  // NewNavBar();
  NewNavBar({this.itemSelectedCallback}){
    itemSelectedCallback ??= (_){} ;
  } 



  @override

  Widget build(BuildContext context) {
    var state = useState(1);
    return BottomNavigationBar(
      onTap: (index){
        state.value = index;
        itemSelectedCallback(index); 
      }, 

      currentIndex: state.value,

      items: const [

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







class DataTableWidget extends StatelessWidget {



  final List jsonObjects;

  final List<String> columnNames;

  final List<String> propertyNames;



  DataTableWidget( {this.jsonObjects = const [], this.columnNames = const [], this.propertyNames= const [],});



  @override

  Widget build(BuildContext context) {

    return DataTable(

      columns: columnNames.map( 

                (name) => DataColumn(

                  label: Expanded(

                    child: Text(name, style: TextStyle(fontStyle: FontStyle.italic))

                  )

                )

              ).toList()       

      ,

      rows: jsonObjects.map( 

        (obj) => DataRow(

            cells: propertyNames.map(

              (propName) => DataCell(Text(obj[propName]))

            ).toList()

          )

        ).toList());

  }



}