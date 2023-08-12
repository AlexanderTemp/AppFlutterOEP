import 'package:flutter/material.dart';

class BotonPersonalizado extends StatelessWidget {
  String texto;
  Color colort;
  Color colorfondo;
  BotonPersonalizado({required this.texto,required this.colort,required this.colorfondo});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          color: colort,
        ),
      ),
      width: double.infinity,
      height: 40.0,
      margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        //color: Colors.greenAccent[700],
        color: colorfondo,
        boxShadow: [
          new BoxShadow(blurRadius: 8.0),
        ],
      ),
    );
  }
}
