import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerPeso = TextEditingController();
  TextEditingController _controllerAltura = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    if(!(_controllerPeso.text.isEmpty || _controllerAltura.text.isEmpty)) {
      double peso = double.tryParse(_controllerPeso.text);
      double altura = double.tryParse(_controllerAltura.text);
      double imc = peso/(altura*altura);
      if(imc < 18.5) {
        setState(() {
          _textoResultado = "Abaixo do peso";
        });
      } else if(imc <= 24.9) {
        setState(() {
          _textoResultado = "Peso normal";
        });
      } else if(imc <= 29.9) {
        setState(() {
          _textoResultado = "Sobrepeso";
        });
      } else if(imc <= 34.9) {
        setState(() {
          _textoResultado = "Obesidade grau 1";
        });
      } else if(imc <= 39.9) {
        setState(() {
          _textoResultado = "Obesidade grau 2";
        });
      } else {
        setState(() {
          _textoResultado = "Obesidade grau 3";
        });
      }
    } else {
      setState(() {
        _textoResultado = "Insira algum valor nos campos Peso e Altura";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMC app"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Calcular IMC",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                decoration: InputDecoration(labelText: "Peso (KG)"),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                controller: _controllerPeso,
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                decoration: InputDecoration(labelText: "Altura (Metros)"),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                controller: _controllerAltura,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white70,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  _textoResultado,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}