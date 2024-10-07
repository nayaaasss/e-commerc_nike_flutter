import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/ui/detail/detail_screen.dart';
import 'package:e_commerce/ui/home/components/categories.dart';
import 'package:e_commerce/ui/home/components/item_card.dart';
import 'package:flutter/material.dart';

class CataloguScreen extends StatelessWidget {
  const CataloguScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0, //untuk menghilangkan efek bayangan
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
        title: const Text(
          "Nike",
          style: TextStyle(fontSize: 23, fontFamily: 'poppins'),
        ),
      ),
      body: Column(
        children: [
          const Text(
            "Women",
            style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 17, color: 
                Colors.black
                ),
          ),
          const SizedBox(
            height: 2,
          ),
          //untuk search bar
          Container(
            width: 269,
            height: 52,
            padding: const EdgeInsets.only(
              top: 14,
              left: 16,
              right: 90,
              bottom: 10,
            ),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                //untuk memberi efek rounded
                borderRadius: BorderRadius.circular(14),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x0A000000),
                  blurRadius: 2, //ini untuk blur
                  offset: Offset(0, 4), //ini untuk memberi efek shadow
                  spreadRadius: 2, //untuk memberi efek bayangan
                )
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 80,
                  padding: const EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search_sharp,
                          color: Color.fromARGB(255, 255, 238, 7),
                          size: defaultPadding //ukuran icon
                          ),
                    ],
                  ),
                ),
                const Text(
                  'Looking for shoes',
                  style: TextStyle(
                    color: Color.fromARGB(255, 158, 157, 157),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          const Categories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView.builder(
                //untuk menampilkan widget column sama row
                //main axis selalu mengikut parentsnya, misalkan dia dibungkus sama column maka dia akan mengikuti column
                itemCount: product
                    .length, //buat nampilin sesuai data yang ada di model product
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //mengatur tata letak grid/membungkus (lbh byk opsi dripda slyofer) //dia tuh kyk berlawanan gtu karna cross, klo misalnya dia di warp column trs make cross nnti jdi row, sebaliknya juga gtu
                    crossAxisCount: 2,
                    mainAxisSpacing: defaultPadding,
                    crossAxisSpacing: defaultPadding,
                    childAspectRatio: 0.75 //
                    ),
                itemBuilder: (context, index) => ItemCard(
                  //(context) merepersentsikan halaman yang aktif saat ini
                  product: product[index],
                  press: () => Navigator.push(
                      //untuk pindah halaman
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(product: product[index]))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
