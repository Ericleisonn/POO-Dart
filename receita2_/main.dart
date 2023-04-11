import 'package:flutter/material.dart';

class BottomItens extends StatelessWidget {
  BottomItens();
  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");}
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: botaoFoiTocado, items: const [
      BottomNavigationBarItem(
        label: "Cafés",
        icon: Icon(Icons.coffee_outlined),),
      BottomNavigationBarItem(
          label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
      BottomNavigationBarItem(label: "Nações", icon: Icon(Icons.flag_outlined))]);
  }}


class NewAppBar extends StatelessWidget implements PreferredSizeWidget{
  NewAppBar();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  Widget build(BuildContext context){
    return AppBar(title: const Text("Dicas"));
  }
} 
class NewBody extends StatelessWidget {
  NewBody();
  @override
  Widget build(BuildContext context) {
    return Column(children: const [
          Expanded(
            child: Text("La Fin Du Monde - Bock - 65 ibu"),
          ),
          Expanded(
            child: Text("Sapporo Premiume - Sour Ale - 54 ibu"),
          ),
          Expanded(
            child: Text("Duvel - Pilsner - 82 ibu"),
          )
        ]);
  }}
class MyApp extends StatelessWidget{
  MyApp();
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
home: Scaffold(
        appBar: NewAppBar(),
        body: NewBody(),
        bottomNavigationBar: BottomItens(),
      ));
  }
}
void main() {
   MyApp app = MyApp();
  runApp(app);
}
