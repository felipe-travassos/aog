
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Input extends StatelessWidget {
  var label = "";
   var ctrl = MoneyMaskedTextController();
  
  Input({
    @required this.label,
    @required this.ctrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
            children: <Widget>[
              Container(
                width: 100,
                alignment: Alignment.centerRight,
                child: Text(
                  label, //chamando o label
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontFamily: "Big Shoulders Display",
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: TextFormField(
                  controller: ctrl,// chamnando o controler das mask dinheiro
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontFamily: "Big Shoulders Display",
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          );
  }
}