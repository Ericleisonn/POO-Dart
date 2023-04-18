import 'package:flutter/material.dart';

class BottomItens extends StatelessWidget {
 final List<Icon> icons;
  BottomItens({this.icons = const []});
  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: botaoFoiTocado,
        items: icons
            .map((obj) => BottomNavigationBarItem(icon: obj, label: 'Button'))
            .toList());
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
  const MyApp();
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
home: Scaffold(
        appBar: NewAppBar(),
        body: NewBody(),
        bottomNavigationBar: BottomItens(
          icons: const [
            Icon(Icons.coffee_outlined),
            Icon(Icons.local_drink_outlined),
            Icon(Icons.flag_outlined)
            ],),
      ));
  }
}
void main() {
   MyApp app = MyApp();
  runApp(app);
}
