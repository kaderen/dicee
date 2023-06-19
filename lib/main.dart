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

//başta sağ sol zar foto numaralarına 1 atıyoruz. Skorlara ise =0
class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int knumber = 0;
  int mnumber = 0;

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

  // İki zarı da hareket ettirmek için yeni bir fonksiyon ekliyoruz.
  void bothDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      print("leftDiceNumber= $leftDiceNumber");
      print("rightDiceNumber=$rightDiceNumber");
    });
  }

// Burada skoru yazacağımız fonsiyon oluşturuyorum
  void skor1() {
    setState(() {
      if (leftDiceNumber > rightDiceNumber) {
        knumber += 1;
      } else if (leftDiceNumber == rightDiceNumber) {
      } else {
        mnumber += 1;
      }
    });
  }

  void reset() {
    setState(() {
      knumber = 0;
      mnumber = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 78,
            child: Row(
              children: [
                //Expanded yaptığın containerleri oranlı bir şekilde bölüyor.
                // Bu expanded yerlerine flex in kaç olduğunu da yazarsak eğer
                //diğer containerlerin kaç kıtı şeklinde olmasını istersem o şekilde ayarlayacak.
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Center(
                        //yazıyla alakalı değiştirmek istediğim her şeyi text'in içerisinde
                        // style: TextStyle olarak ilerliyorum.
                        child: Text(
                      "KADER",
                      style: TextStyle(fontSize: 25, color: Colors.limeAccent),
                    )),

                    //Containerimin içindeyim artık ve buna border vermek istersem, rengini değiştirmek
                    //ya da büyütüp küçültmek. Her şeyi DECORATION'un içerisinde yapacağım.
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    //Padding vererek ne kadar büyültmek ya da küçültmek istediğimi ayarladım. edgeInsets. all dersem hepsi.
                    // Ama only dersem, nerden istersem o köşeyi büyültüp küçültürüm.
                    padding: const EdgeInsets.only(bottom: 9, top: 9),
                    child: Container(
                        child: Center(child: Text(knumber.toString())),
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.white),
                          color: Colors.blueAccent,
                        )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 9, top: 9),
                    child: Container(
                      child: Center(child: Text(mnumber.toString())),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          color: Colors.teal),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Center(
                      child: Text(
                        "MEHMET",
                        style:
                            TextStyle(fontSize: 25, color: Colors.limeAccent),
                      ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        ),
                        color: Colors.teal),
                  ),
                ),
              ],
            ),
          ),
          Row(
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
              ),
            ],
          ),
          //ClipRReact. Rectangle mizi yuvarlak yapmayı sağladı.
          ClipRRect(
            borderRadius: BorderRadius.circular(360),
            child: TextButton(
              onPressed: () {
                bothDice();
                skor1();
              },
              style: ButtonStyle(
                overlayColor: MaterialStatePropertyAll(Colors.white),
              ),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.red.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(7, 7))
                  ],
                  color: Colors.red,
                ),
                child: Center(
                    child: Text(
                  "Both Dice",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ),
          TextButton(onPressed: () {
            reset();
          }, child: Text("Sıfırla")),
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
