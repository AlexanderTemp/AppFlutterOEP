import 'package:flutter/cupertino.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import "package:audioplayers/audioplayers.dart";
import 'package:toast/toast.dart';
import 'Widgets/BotonPersonalizado.dart';


class PantallaInicioSesion extends StatefulWidget {
  @override
  _PantallaInicioSesionState createState() => _PantallaInicioSesionState();
}

class _PantallaInicioSesionState extends State<PantallaInicioSesion>{
  // referencia  de la base de datos
  bool showSpinner = false;
  bool val = false;
  TextEditingController _cedulaEdicionTexto = TextEditingController();
  TextEditingController _fechanac = TextEditingController();
  DateTime selectedDate = DateTime.now();
  int anio = DateTime.now().year - 18;

  _selectDate(BuildContext context) async {
    //_firestore.collection('').add({data});
    final DateTime? fechaescogida = await showDatePicker(
      context: context,
      initialDate: DateTime(anio),
      firstDate: DateTime(1940, 1),
      lastDate: DateTime(anio),
    );
    if (fechaescogida != null && fechaescogida != selectedDate)
      setState(() {
        selectedDate = fechaescogida;
        var date =
            "${fechaescogida.toLocal().day}/${fechaescogida.toLocal().month}/${fechaescogida.toLocal().year}";
        _fechanac.text = date;
      });
  }

  void reproducir() {
    final player = AudioPlayer();
    player.play(AssetSource("press.wav"));
  }
/*
  _seleccDatosDesdeFireBase({required String carnet,required String fechanac}) async {
    PersonalData p;

    await DBReferencia.child('datorgpro')
        .once()
        .then((DataSnapshot datasnapshot) {
      print(datasnapshot.value);
      datasnapshot.value.forEach((key, values) {
        if (key == carnet) {
          if (values['datnac'] == fechanac) {
            val = true;
            p = new PersonalData(
              carnet: key,
              nombres: values['nombres'],
              apat: values['apat'],
              amat: values['amat'],
              ciudad: values['ciudad'],
              estado: values['estado'],
              jurado: values['jurado'],
              localidad: values['localidad'],
              mesa: values['mesa'],
              mili: values['mili'],
              pais: values['pais'],
              recinto: Recinto(
                latitud: values['recinto']['lat'],
                longitud: values['recinto']['lon'],
                lugardevotacion: values['recinto']['lugarvoto'],
              ),
              qr: values['qr'],
              perfil: values['prof'],
            );
          }
        }
      });
    });
    //print(key);
    if (p == null) {
      //print('es falso');
      Toast.show(
          'NO existe el registro de los datos introducidos ¡Verifique sus datos!',
          duration: Toast.lengthLong,
          gravity: Toast.center);
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PantallaSesionPrincipal(per: p)));
    }
  }
*/
  bool esNumero(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context){
    ToastContext().init(context);
    return Scaffold(
      body:ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/organo.png',
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Expanded(
                      child: Image.asset('assets/account.png'),
                    ),
                    SizedBox(
                      height: 17.0,
                    ),
                    Text(
                      'Identifícate',
                      style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
                margin: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Color(0xff400D54),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [new BoxShadow(blurRadius: 40.0)],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xffdddddd),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(70, 30, 70, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'Cédula de Identidad',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      TextField(
                        controller: _cedulaEdicionTexto,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontSize: 50.0,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 30.0,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurpleAccent, width: 2.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 3.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                        ),
                        style: TextStyle(fontSize: 25.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Fecha de Nacimiento',
                        style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      GestureDetector(
                        onTap: () =>_selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            keyboardType: TextInputType.datetime,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                            textAlign: TextAlign.center,
                            controller: _fechanac,
                            decoration: InputDecoration(
                              labelText: "",
                              icon: Icon(
                                Icons.calendar_today,
                                color: Colors.deepPurpleAccent,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32.0),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurpleAccent, width: 2.0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.greenAccent, width: 3.0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32.0),
                                ),
                              ),
                            ),
                            validator: (String? value) {
                              if (value != null && value.isEmpty)
                                return "Por favor introduzca fecha de Nacimiento";
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                        child: GestureDetector(
                          onLongPress: () => HapticFeedback.vibrate(),
                          onTap: () async {
                            reproducir();
                            HapticFeedback.vibrate();
                            setState(() {
                              showSpinner = true;
                              //limpiar datos erróneos
                            });
                            if (esNumero(_cedulaEdicionTexto.text.toString()) ==
                                false) {
                              Toast.show("Ci solo datos numéricos",
                                  duration: Toast.lengthLong,
                                  gravity: Toast.bottom);
                            } else {
                              //envio a la página nueva y/o tener que
                              print(_cedulaEdicionTexto.text);
                              print(_fechanac.text);
                              /*
                              _seleccDatosDesdeFireBase(
                                  carnet: _cedulaEdicionTexto.text,
                                  fechanac: _fechanac.text);*/
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          },
                          child: BotonPersonalizado(
                            texto: 'ENTRAR',
                            colort: Colors.white,
                            colorfondo: Color(0xff400D54),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}