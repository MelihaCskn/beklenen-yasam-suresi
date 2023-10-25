
import 'package:beklenenyasamsuresi/hesap.dart';
import 'package:beklenenyasamsuresi/user_data.dart';
import 'package:flutter/material.dart';

class SonucGoster extends StatefulWidget{
  final UserData userData;
  SonucGoster(this.userData, {super.key});
  @override
  State<SonucGoster> createState() => _SonucGosterState(userData);
}

class _SonucGosterState extends State<SonucGoster> {
  final UserData userData;
  _SonucGosterState(this.userData);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("SONUÇLAR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         Expanded(
            flex: 9,
              child: Center(child: Text(Hesap(userData).hesapla().round().toString(),style: TextStyle(color: Colors.white,fontSize: 30),))),
          Expanded(
            flex: 1,
              child: ElevatedButton(
                onPressed:() {
                  Navigator
                      .pop(context);
                },
                style: ElevatedButton.styleFrom(primary: Colors.white),
               child:const Text("GERİ DÖN",style: TextStyle(color: Colors.blueGrey),),
              ))
        ],
      ),
    );

  }
}