import 'package:flutter/material.dart';
void main() {
MyApp app = MyApp();
runApp(app);
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Qual a sua idade?"),
          centerTitle: true,
        ),
        body: NewBody(),
      ));
}
}

class NewBody extends StatefulWidget {
NewBody();

@override
_NewBodyState createState() => _NewBodyState();
}
enum Respostas {Sim, Nao, JaParei}


class _NewBodyState extends State<NewBody> {
List<bool> checkBooks = [false,false,false,false,false,false];
double _curretRange = 20;

_NewBodyState();

@override
Widget build(BuildContext context) {
return Scrollbar(
child: SingleChildScrollView(
child: Padding(
padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
child: Container(
child: Column(
children: [
Form(
child: Center(
child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch ,
children: <Widget>[
  TextFormField(
    decoration: const InputDecoration(
      hintText: 'Nome',
      icon: Icon(Icons.person),
    ),
  ),
  Padding(
    padding: const EdgeInsets.symmetric(
        vertical: 15, horizontal: 15),
    child: Container(
      child: Container(
        child: Column(children: [
          Container(
            height: 10,
          ),
          Container(
            child: Column(children: [
              const Text("Quantos anos você tem?"),
              Row(
                children: [
                  Checkbox(
                    value: checkBooks[0],
                    onChanged: (check) {
                      setState(() {
                        checkBooks[0] = !checkBooks[0];
                      });
                    },
                  ),
                  const Text("5-10")
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkBooks[1],
                    onChanged: (check) {
                      setState(() {
                        checkBooks[1] = !checkBooks[1];
                      });
                    },
                  ),
                  const Text("11-16")
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkBooks[2],
                    onChanged: (check) {
                      setState(() {
                        checkBooks[2] = !checkBooks[2];
                      });
                    },
                  ),
                  const Text("16-22")
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkBooks[3],
                    onChanged: (check) {
                      setState(() {
                        checkBooks[3] = !checkBooks[3];
                      });
                    },
                  ),
                  const Text("22-30")
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkBooks[4],
                    onChanged: (check) {
                      setState(() {
                        checkBooks[4] = !checkBooks[4];
                      });
                    },
                  ),
                  const Text("31-36")
                ],
              ),
            ]),
          ),
          const Text("Você ainda frequenta a escola?"),
          Row(
            children: [
              Radio(
                value: Respostas.Sim,
                groupValue: Respostas,
                onChanged:(respostas0) {
                  setState(() {});
                },
              ),
              const Text("Sim"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: Respostas.Nao,
                groupValue: Respostas,
                onChanged:(respotas1) {
                  setState(() {});
                },
              ),
            const Text("Não"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: Respostas.JaParei,
                groupValue: Respostas,
                onChanged: (respostas2) {
                  setState(() {});
                },
              ),
            const Text("Parei recentemente"),
            ],
          ),Row(
            children: [
              Radio(
                value: Respostas.JaParei,
                groupValue: Respostas,
                onChanged: (respostas3) {
                  setState(() {});
                },
              ),
            const Text("Parei faz tempo"),
            ],)
        ]),
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.symmetric(
        vertical: 15, horizontal: 120),
    child: ElevatedButton.icon(
      label: Text('Enviar'),
      icon: Icon(Icons.send),
      onPressed: () {
        final snackBar = SnackBar(
          content: const Text('Enviado com Sucesso!'),
          action: SnackBarAction(
            label: 'Voltar',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    ),
  ),
],
),
)),
],
)),
),
));
}
}