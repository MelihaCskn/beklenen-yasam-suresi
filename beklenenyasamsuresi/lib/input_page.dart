// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:beklenenyasamsuresi/container.dart';
import 'package:beklenenyasamsuresi/iconcinsiyet.dart';
import 'package:beklenenyasamsuresi/result.dart';
import 'package:beklenenyasamsuresi/user_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String secilicinsiyet = "";
  double icilensigara = 0.0;
  double sporsayisi = 0.0;
  int boy = 160;
  int kilo = 60;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Belenen Yaşam Süresi"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: MyContainer(
                        onpres: () {}, child: buildRowOutLineButton("BOY")),
                  ),
                  Expanded(
                    child: MyContainer(
                      onpres: () {},
                      child: buildRowOutLineButton("KİLO"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: MyContainer(
                  onpres: () {},
                  child: Column(children: [
                    Text("Haftada Kaç Gün Spor Yapıyorsun",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    Text(sporsayisi.round().toString(),
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    Slider(
                      min: 0,
                      max: 7,
                      value: sporsayisi,
                      onChanged: (double newValue) {
                        setState(() {
                          sporsayisi = newValue;
                        });
                      },
                    )
                  ])),
            ),
            Expanded(
              flex: 3,
              child: MyContainer(
                  onpres: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Günde Kac Sigara İçiyorsun?",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      Text(icilensigara.round().toString(),
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      Expanded(
                        child: Slider(
                            min: 0,
                            max: 40,
                            value: icilensigara,
                            onChanged: (double newValue) {
                              setState(() {
                                icilensigara = newValue;
                              });
                            }),
                      )
                    ],
                  )),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: MyContainer(
                      onpres: () {
                        setState(() {
                          secilicinsiyet = "KADIN";
                        });
                      },
                      renk: secilicinsiyet == "KADIN"
                          ? Colors.green
                          : Colors.white,
                      child: MyColumn(
                        icon: FontAwesomeIcons.venus,
                        data: "KADIN",
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      onpres: () {
                        setState(() {
                          secilicinsiyet = "ERKEK";
                        });
                      },
                      renk: secilicinsiyet == "ERKEK"
                          ? Colors.green
                          : Colors.white,
                      child: MyColumn(
                        icon: FontAwesomeIcons.mars,
                        data: "ERKEK",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SonucGoster(
                                    UserData(
                                        boy: boy,
                                    kilo: kilo,
                                    sporsayisi: sporsayisi,
                                    secilicinsiyet: secilicinsiyet,
                                    icilensigara: icilensigara))));
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text(
                    "HESAPLA",
                    style: TextStyle(color: Colors.black54),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Row buildRowOutLineButton(String birimcesidi) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              "$birimcesidi",
              style: TextStyle(fontSize: 25, color: Colors.black54),
            )),
        SizedBox(
          width: 2,
        ),
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              birimcesidi == "BOY" ? boy.toString() : kilo.toString(),
              style: TextStyle(fontSize: 30, color: Colors.indigo),
            )),
        SizedBox(
          width: 7,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      birimcesidi == "BOY" ? boy++ : kilo++;
                    });
                  },
                  child: Icon(FontAwesomeIcons.plus)),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    birimcesidi == "BOY" ? boy-- : kilo--;
                  });
                },
                child: Icon(FontAwesomeIcons.minus),
              ),
            )
          ],
        )
      ],
    );
  }
}
