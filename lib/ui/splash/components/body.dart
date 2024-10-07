import 'package:e_commerce/consts.dart';
import 'package:e_commerce/ui/home/catalogu_screen.dart';
import 'package:e_commerce/ui/splash/components/splash_content.dart';
import 'package:flutter/material.dart';


class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() =>
      _BodyState(); //untuk membuat state (perubahan dri pada widget)
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  final PageController _pageController = PageController(); //yang mengelola navigasi antar halaman
  // List<String> product = List.generate(
  //   10, (index) => "Product ${index + 1}" //untuk membuat wadah product/generate product
  //   );

//dasar pengambilan data dari API
  List<Map<String, String>> splashData = [
    {
      "text": "Smart, Gorgeous & Fashionable \nCollection Explor Now",
      "image": 'assets/images/screen_1(2).png',
    },
    {
      "text": "There Are Many Beautiful And Attractive\n Plants To Your Room",
      "image": 'assets/images/screen_3(2).png',
    },
    {
      "text": "Smart, Gorgeous & Fashionable \nCollection Explor Now",
      "image": 'assets/images/screen_3(2).png',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea( //biar ga ketutupan sistem
        child: Column(
          children: [
            Expanded( //untuk mengisi kekososngan yang ada biar proposional
              flex: 4, //untuk memenuhi raung kosong yang ada
              child: SizedBox(
              //membawa widget ke tengah sepeti sumbu x dan y dan di tngh 0.0, mengikuti titik kordinat
                child: PageView.builder( //untuk menampung/membangun data". mengatur swipe activity" 
                controller:  _pageController, //untuk mengatur page view
                onPageChanged: (value) { //mau manggil sebuah argumen, dmn argumen trsbut berfungsi untuk mewakili sebuah data int maka gunakanlah argumen value
                  // inisial(awal) state method untuk statefulwidget behaviour
                  setState(() {
                    currentPage = value;
                  });
                },
                  itemCount: splashData.length, //untuk menghitung/membatasi hasil swipe
                  itemBuilder: (context, index) => SplashContent( //banyak data, baawaan
                    text: splashData[index]['text']!, //bank operator (important/harus masuk)
                    image: splashData[index]["image"]!,
                  ), //karna dia list jd harus make index
                ), //untuk memisah dri logic
              ),
            ),
            Expanded(
                child: 
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                List.generate( //menghasilkan sejumlah dots" sesuai panjang splash data
                  splashData.length,
                   (index) => _dotsIndicator(index: index))  //method // Menghasilkan list [0, 1, 2]
            )),
           Padding(
             padding: const EdgeInsets.only(bottom: 20.0, left: 30.0, right: 30.0,), //agar jaraknya 8 semua
             child: SizedBox(
              width: double.infinity, //infinity itu seperti titik kordinat
               child: ElevatedButton( //button yang paling normal atau blm ada styling
                  style: ElevatedButton.styleFrom(  
                  backgroundColor: primaryLightColor, 
                ),
                  onPressed: () {
                    if (currentPage == splashData.length - 1) { //banyaknya data  ini untuk kembali ke splashData dimana dimulai dri 0
                    //code yang di gunakan untuk berpindah antar halaman (button)
                    //jika datanya sudah selesai maka akan berpindah halaman, splash data ada 3 sdgkn index dimulai dri 0 jdi di kurang jadi 1
                      Navigator.push( //untuk menggantikan halaman lain
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const CataloguScreen())  
                        );
                    } else {
                      _pageController.animateToPage( //untuk mengatur page viwe
                         currentPage + 1,  
                        duration: animationDuration,  //kalau belum halaman terakhir dia akan menggerakkah halamannya menggunakan animetopage
                        curve: Curves.ease //untuk animasi
                        );
                     
                    }
                  }, //representasi dri function kosongan, 
                  child: Text(
                    currentPage == splashData.length - 1 ? "Start" : "next", //kalau nilainya true dia bakal starr, dan kalau 
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0)
                    ),
                  )
                ),
             ),
           )
          ],
        ),
      ),
    );
  }

  //code untuk logika indicator (yg ada titik 3)
  AnimatedContainer _dotsIndicator({required int index}) { 
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: currentPage == index ? primaryLightColor : primaryColor,
        borderRadius: BorderRadius.circular(5)
      ),
      width: currentPage == index ? 36 : 20, //kalau di halaman yg aktif widthnya bakal 25 dan warnanya primary kalau ga aktif sebaliknya
      height: 10, duration: animationDuration,
    );
  }
}
