class Produto{
  double preco;
  String descricao;
  String validade;

  Produto ({required this.preco,required this.descricao,required this.validade});
  // Produto (this.preco,this.descricao,this.validade);
  //Named Parameters ***
  //Sound Null Safety ***
  String ExibeProduto() { 
    return "Produto: $descricao, Preço: $preco, Validade: $validade";
  }
  String toString() {
  return "$descricao";
  }
}




class Item {
  Produto produto;
  double quantidade;
  // double total(){
  //   return this.quantidade * produto.preco;
  // }

  double total() => quantidade *produto.preco;
  Item({required this.produto,required this.quantidade});

  String ExibeItem(){ 
    return "Produto: ${produto.descricao}, Quantidade: $quantidade, Preço TOTAL: ${total()}";
  }
  
    String toString() {
  return "$produto";
  }
 }
  
 

class Venda {
  final String data;
  final List<Item> itens;
  double total() => itens.fold(0,(sum,e) => sum+ e.total());


  Venda({required this.data,required this.itens});
  String toString() {
  return "Data: $data, Itens: $itens, Total da venda : ${total()}";
  }
  String ExibeVenda(){ 
    return "Itens: $itens, Data: $data, Total da venda: ${total()}";
  }
}


void main() {

  Produto prod1 = Produto(preco: 6.75 ,descricao: "PITÚ 1L",validade: "25/05/2023");
  Produto prod2 = Produto(preco: 10 ,descricao: "Coca-cola 2L",validade: "22/09/2024");
  Produto prod3 = Produto(preco: 35 ,descricao: "Cupim KG",validade: "31/03/2023");

  Item item1 = Item(produto:prod1,quantidade:72);
  Item item2 = Item(produto:prod2,quantidade:93);
  Item item3 = Item(produto:prod3,quantidade:67);

  Venda venda1 = Venda(data:"23/02/2023",itens:[item1,item2]);
  Venda venda2 = Venda(data:"23/02/2023",itens:[item3]);
  Venda venda3 = Venda(data:"24/02/2023",itens:[item1,item3]);
  


  print ("PRODUTOS: ${prod1.ExibeProduto()}");
  // print("\n\n");
  print("ITENS: ${item1.ExibeItem()}");
  // print("\n\n");
  print("VENDA: ${venda1.ExibeVenda()}");
  print("\n\n");

}
