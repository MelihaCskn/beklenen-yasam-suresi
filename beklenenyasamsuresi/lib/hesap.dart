import 'package:beklenenyasamsuresi/user_data.dart';

class Hesap{
 final UserData userData;

  Hesap(this.userData);

  double hesapla(){
   double sonuc;

   sonuc=65+userData.sporsayisi - userData.icilensigara;
   sonuc=sonuc+ (userData.boy/userData.kilo);

   userData.secilicinsiyet=="KADIN" ?sonuc+2 :sonuc-2;

   return sonuc;
  }
}