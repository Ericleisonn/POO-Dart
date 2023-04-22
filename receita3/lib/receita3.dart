import 'package:flutter/material.dart';



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
        appBar: NewAppBar(),
        body: DataBodyWidget(objects:const [
          "La Fin Du Monde - Bock - 65 ibu",
          "Sapporo Premiume - Sour Ale - 54 ibu",
          "Duvel - Pilsner - 82 ibu"
        ]),
        bottomNavigationBar: NewNavBar(
          icons: const [
            Icon(Icons.coffee_outlined),
            Icon(Icons.local_drink_outlined),
            Icon(Icons.flag_outlined)
            ])
      ));

  }
}
class NewAppBar extends StatelessWidget with PreferredSizeWidget {
  NewAppBar();
  Widget build(BuildContext context){
    return AppBar(
      title: const Text("Dicas"),
      actions: [
        PopupMenuButton(
          itemBuilder: (context){
            return const [
              PopupMenuItem<int>(
                value: 0,
                child: Text("Cinza")),
              PopupMenuItem<int>(
                value: 0,
                child: Text("Amarelo")),
              PopupMenuItem<int>(
                value: 0,
                child: Text("Vermelho")),
            ];
})]);
  }
    @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class NewNavBar extends StatelessWidget {
  // NewNavBar();
  late List<Icon> icons;
  NewNavBar({this.icons = const []});
  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }
  @override
    Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: botaoFoiTocado, 
      items: icons.map((icon) => BottomNavigationBarItem(label: "Botão",icon: icon)).toList());
  }}


class DataBodyWidget extends StatelessWidget {
  List<String> objects;
  DataBodyWidget( {this.objects = const [] });
  Expanded processarUmElemento(String obj){
    return Expanded(                
          child: Center(child: Text(obj)),
        );
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: objects.map( 
      (obj) => Expanded(
        child: Center(child: Text(obj)))).toList());
}}