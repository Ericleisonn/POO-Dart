import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class DataService {
  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]);

  List<String> columnsNames = [''];
  List<String> propertyNames = [''];
  

  void carregar(index) {
    var res = null;
    var size = opSelect.toString();
    if (index == 0){ 
      propertyNames = ["blend_name", "origin", "variety"];
      columnsNames = ['Nome', 'Origem', 'Variedade'];

      print('carregar #1 - antes de carregarCafes');
      res = carregarCafes(size);
      print('carregar #2 - carregarCervejas retornou $res');
    }
    else if (index == 1) {
      propertyNames = ['name', 'style', 'ibu'];
      columnsNames = ['Nome', 'Estilo', 'IBU'];

      print('carregar #1 - antes de carregarCervejas');
      res = carregarCervejas(size);
      print('carregar #2 - carregarCervejas retornou $res');
    }
    else if (index == 2) {
      propertyNames = ['nationality', 'language', 'capital'];
      columnsNames = ['Nacionalidade', 'Lingua', 'Capital'];

      print('carregar #1 - antes de carregarNacoes');
      res = carregarNacoes(size);
      print('carregar #2 - carregarNacoes retornou $res');
    }
  }

  Future<void> carregarCervejas(size) async {
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/beer/random_beer',
        queryParameters: {'size': size});

    print('carregarCervejas #1 - antes do await');
    var jsonString = await http.read(beersUri);
    print('carregarCervejas #2 - depois do await');
    var beersJson = jsonDecode(jsonString);
    tableStateNotifier.value = beersJson;
  }

  Future<void> carregarCafes(size) async {
    var coffeeUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/coffee/random_coffee',
        queryParameters: {'size': size});

    print('carregarCafes #1 - antes do await');
    var jsonString = await http.read(coffeeUri);
    print('carregarCafes #2 - depois do await');
    var coffeeJson = jsonDecode(jsonString);
    tableStateNotifier.value = coffeeJson;
  }

  Future<void> carregarNacoes(size) async {
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/nation/random_nation',
        queryParameters: {'size': size});

    print('carregarCervejas #1 - antes do await');
    var jsonString = await http.read(beersUri);
    print('carregarCervejas #2 - depois do await');
    var nationJson = jsonDecode(jsonString);
    tableStateNotifier.value = nationJson;
  }

}

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
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Dicas"),
          ),
          body: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyRadiusButton(),
                  ValueListenableBuilder(
                  valueListenable: dataService.tableStateNotifier,
                  builder: (_, value, __) {
                    return DataTableWidget(
                        jsonObjects: value,
                        propertyNames: dataService.propertyNames,
                        columnNames: dataService.columnsNames);
                  }),
                ],
          ))),
          bottomNavigationBar:
              NewNavBar(itemSelectedCallback: dataService.carregar),
        ));
  }
}

class NewNavBar extends HookWidget {
  final _itemSelectedCallback;

  NewNavBar({itemSelectedCallback})
      : _itemSelectedCallback = itemSelectedCallback ?? (int) {}

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
        onTap: (index) {
          state.value = index;

          _itemSelectedCallback(index);
        },
        currentIndex: state.value,
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
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;

  final List<String> columnNames;

  final List<String> propertyNames;

  DataTableWidget(
      {this.jsonObjects = const [],
      this.columnNames = const ["Nome", "Estilo", "IBU"],
      this.propertyNames = const ["name", "style", "ibu"]});

  @override
  Widget build(BuildContext context) {
    return Container(
          child: DataTable(
            columns: columnNames
                .map((name) => DataColumn(
                    label: Expanded(
                        child: Text(name,
                            style: TextStyle(fontStyle: FontStyle.italic)))))
                .toList(),
            rows: jsonObjects
                .map((obj) => DataRow(
                    cells: propertyNames
                        .map((propName) => DataCell(Text(obj[propName])))
                        .toList()))
                .toList())
        );
  }
}


enum QuantList {
  five(5,'5'), ten(10, '10'), fifteen(15,'15');
  
  final int id;
  final String value;
  const QuantList(this.id, this.value);
}

class MyRadiusButton extends StatefulWidget{
  MyRadiusButton();

  @override 
  _MyRadiusButton createState() => _MyRadiusButton();
}

var opSelect = 5;

class _MyRadiusButton extends State<MyRadiusButton>{
  QuantList? option = QuantList.five;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[200],
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text("Quantidade de itens listados", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Text('5'),
                  Radio(
                    value: QuantList.five,
                    groupValue: option,
                    onChanged: (QuantList? id) {
                      setState(() {
                         
                        option = QuantList.five;
                        opSelect = QuantList.five.id;
                      });
                    },
                  ),
                ],
              ),

              Row(
                children: [
                  Text('10'),
                  Radio(
                    value: QuantList.ten,
                    groupValue: option,
                    onChanged: (QuantList? id) {
                      setState(() {
                        option = QuantList.ten;
                        opSelect = QuantList.ten.id;
                      });
                    },
                  ),
                ],
              ),
              
              Row(
                children: [
                  Text('15'),
                  Radio(
                    value: QuantList.fifteen,
                    groupValue: option,
                    onChanged: (QuantList? id) {
                      setState(() {
                        option = QuantList.fifteen;
                        opSelect = QuantList.fifteen.id;
                      });
                    },
                  ),
                ],
              ),
              
            ],
          )
            ]
          )
        )
      );
  }

}

