import 'package:flutter/material.dart';
import "dart:math";

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.deepPurple,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void random(bool isLeft) {
    setState(() {
      if (isLeft) {
        leftDiceNumber = Random().nextInt(6) +
            1; //normalde bu 0 ile 5 arasındaki sayılar demek. O yüzden +1 ekliyoeuz ve 1 ile 6 arası oluyor.
        print("diceeNumber = $leftDiceNumber");
      } else {
        rightDiceNumber = Random().nextInt(6) + 1;
        print("diceeNumber = $rightDiceNumber");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          //expended class : yatay ve dikey tuttuğumuzda kullanışlı bir görünüm için kullanacağız gibi .
          //Ekranı tamamen dolduracak şekilde ayarladı. Görsel ekranın dışına taşmayacak bir şekilde
          //yatayda kenarlara yapıştı.
          //İki tane expandedli image ekledik bu sefer de horizontal yani yatayda ikisini eşit paylaştırdı
          //Yatayda ikiye bölerek iki görseli taşmayacak şekilde ekledi.
          Expanded(
            //Ama diyelim ki soldaki sağdakinin iki katı genişliğinde olsun istedik. O zaman da flex isimli
            //widget'i ekleyeceğiz. Geniş olmasını istediğimiz görselin expandedine girip flex:2 , daha
            //küçük olmasını istediğime ise flex: 1 yazacağım. Kaç katı istersem bu şekilde sayıları güncelleyebiliriz.
            //expand :genişlik
            //flex: 2,
            child: TextButton(
                onPressed: () {
                  random(true);
                },
                child: Image.asset("images/dice$leftDiceNumber.png")),
            //Normalde image'yi böyle eklemiştik.child:
            //Image(image: AssetImage("images/dice1.png",),),
          ),

          Expanded(
            //flex: 1,
            child: TextButton(
                onPressed: () {
                  random(false);
                },
                child: Image.asset("images/dice$rightDiceNumber.png")),
          )
        ],
      ),
    );
  }
}




//DART FUNCTION : 
//DART CARIABLES : 
//DATA TYPES : Dart statically type languages..
//-Boolean  : True or False.
//String: Kelime
//int:Sayı
// dynamic: her ikisi
//STATEFUL: Hareket ettirilebilir. / STATELESS: Hareket ettirilemez.
//random number içim yeni bir libraray'e sahip olacağız. MATH LİBRARAY

