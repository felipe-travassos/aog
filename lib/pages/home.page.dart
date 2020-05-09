import 'package:aog/widgets/logo.widget.dart';
import 'package:aog/widgets/submit-form.dart';
import 'package:aog/widgets/sucess.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  // Mask dinheiro
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.lightBlue;
  var _gasCtrl = MoneyMaskedTextController();
  var _alcCtrl = MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar álcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
       duration: Duration(
         milliseconds: 1200,
       ),
      color: _color,
       child: ListView(
        children: <Widget>[
          Logo(),
          _completed
              ? Sucess(
                  result: _resultText,
                  reset: reset,
                )
              : SubmitForm(
                  gasCtrl: _gasCtrl,
                  alcCtrl: _alcCtrl,
                  busy: _busy,
                  submitFunc: calculate,
                )
        ],
      ), 
        ),
    );
  }

  Future calculate() {
    double alc = double.parse(
          _alcCtrl.text.replaceAll(new RegExp(r'[,.]'), ''),
        ) /
        100;

    double gas = double.parse(
          _gasCtrl.text.replaceAll(new RegExp(r'[,.]'), ''),
        ) /
        100;

    double res = alc / gas;

    setState(() {
      _color = Colors.lightGreen;
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(
        const Duration(seconds: 1), (){
        setState(() {
              
                if (res >= 0.7) {
                  _resultText = "Compensa utilizar Gasolina!";
                } else {
                  _resultText = "Compensa utilizar Alcool!";
                }
                _busy = false;
                _completed = true;
                });
              });
            
  }
  reset() {
    setState(() {
      _alcCtrl = new MoneyMaskedTextController();
      _gasCtrl = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
      _color = Colors.lightBlue;
    });
  }

}
