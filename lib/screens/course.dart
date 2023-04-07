import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import 'homepage.dart';

class coursePage extends StatefulWidget {
  const coursePage({super.key});

  @override
  State<coursePage> createState() => _coursePageState();
}
class _coursePageState extends State<coursePage> {
  var carouselController = CarouselController();
  var carouselController1 = CarouselController();
  int ind=0;
  IconData icon = Icons.sunny;
  bool value=false;
  final items = ['App Development','Web Development','Game Development','Data Structures',
               'Programming','Machine Learning','Data Science','Others'];
  int index = 1;
  var bright = Brightness.light;
  double lft=23;
  String sel = "Popular";
  TextStyle text = const TextStyle(fontSize: 12, color: Colors.black);
  TextStyle textsel = const TextStyle(fontSize: 12, color: Color.fromARGB(255, 255, 162, 0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        titleSpacing: 8,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Image(image: AssetImage('assets/icon.jpeg'), height: 40),
            Text(" CipherSchools", style: text.apply(fontSizeFactor: 1.45))
          ],
        ),
        actions: [
          PopupMenuButton(
            offset: Offset(0, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/compass.svg',
                  height: 20,
                  width: 20,
                ),
                const Text(
                  " Browse",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Icon(Icons.arrow_drop_down_rounded,color: Colors.black,)
              ],
            ),
            itemBuilder: (context) {
              return items.map((String item) {
                return PopupMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            onSelected: (String? value) {
              switch (value) {
                case 'Web Development':
                  print(items[1]);
                  break;
                case 'App Development':
                  print(items[0]);
                  break;
              }
            },
          ),
          //theme mode
          ConstrainedBox(
            constraints: BoxConstraints.tight(Size(44, 20)),
            child: Center(
              child: Stack(
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Switch(
                    value: value,
                    trackColor: MaterialStateProperty.all(Colors.blueGrey.shade700),
                    thumbColor: MaterialStateProperty.all(Colors.orange),
                    thumbIcon: MaterialStateProperty.all(Icon(Icons.circle,size:20 ,color: Colors.white,)),
                    onChanged: (val) =>setState(() {
                      value=val;
                      if(val){
                        icon=Icons.nightlight;
                        lft=3;
                        bright=Brightness.dark;
                        }
                      else{
                        icon=Icons.sunny;
                        lft=23;
                        bright=Brightness.dark;
                        }
                    }) ,
                    ),
                  ),
                  Positioned(top: 15,left: lft,child: Icon(icon,size: 17,color: Colors.yellow,)),
                  ]),
            ),
          ),
          IconButton(
            onPressed: (){}, 
            iconSize: 25,
            constraints: BoxConstraints.tight(Size(30, 20)),
            icon: Icon(Icons.notifications_none_rounded,color: Colors.black,),
            ),
          IconButton(
            onPressed: (){}, 
            iconSize: 25,
            constraints: BoxConstraints.tight(Size(40, 20)),
            icon: Icon(Icons.search_rounded,color: Colors.black,),
            ),
        ],
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.3),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CarouselSlider(
                carouselController: carouselController,
                items: [1,2,3,4].map((e) => Container(width: double.maxFinite,color: Colors.blueGrey.shade700,child: Center(child: Text(e.toString(),style: TextStyle(fontSize: 30),)),)).toList(), 
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                  setState(() {
                    ind=index;
                  });
                },),
              ),
              Positioned(
                top: 90,
                child: IconButton(
                onPressed: () {carouselController.previousPage();},
                icon: Icon(Icons.arrow_back),
                ),
              ),
              Positioned(
                top: 90, right: 8,
                child: IconButton(
                onPressed: () {carouselController.nextPage();},
                icon: Icon(Icons.arrow_forward),
                  ),
              ),
              Positioned(
                bottom: 10,left: MediaQuery.of(context).size.width*0.4,
                  child: DotsIndicator(dotsCount: 4,position: ind.toDouble(),
                  decorator: DotsDecorator(
                      color: Colors.white.withOpacity(0.3),
                      activeColor: Colors.orangeAccent,
                      activeSize: Size.square(6),
                      size: Size.square(6),
                      spacing: EdgeInsets.all(8)
                    ),
                )
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12,20,12,20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recommended Courses",style: TextStyle(fontSize: 18,letterSpacing: 0.5,fontWeight: FontWeight.bold),),
                PopupMenuButton(
                  offset: Offset(10, 45),
                  initialValue: "Popular",
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Text(sel,style: TextStyle(fontSize: 16),),
                      Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  ) ,
                  itemBuilder: (context) => ["Popular","Latest"].map((e) => PopupMenuItem(value: e,child: Text(e))).toList(),
                  onSelected: (value) => setState(() {
                    sel=value;
                  }),
                  ),
              ],
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              CarouselSlider(
                carouselController: carouselController1,
                items: [1, 2, 3, 4]
                    .map((e) => Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey.shade700,
                          ),
                          width: 300,
                          child: Center(child: Text(e.toString(),style: TextStyle(fontSize: 30),)),
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 250,
                  viewportFraction: 0.5,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      ind = index;
                    });
                  },
                ),
              ),
              Positioned(
                top: 90,
                child: IconButton(
                  onPressed: () {
                    carouselController1.previousPage();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              Positioned(
                top: 90,
                right: 8,
                child: IconButton(
                  onPressed: () {
                    carouselController1.nextPage();
                  },
                  icon: Icon(Icons.arrow_forward),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          color: Colors.white,
          shadows: [
            BoxShadow(
                blurRadius: 25,
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1)
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FloatingActionButton(
                  heroTag: "home",
                  onPressed: () {
                    setState(() {
                      index = 0;
                    });
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => MyHomePage()),
                        (route) => false);
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        size: 28,
                        color:
                            index == 0 ? Colors.amber.shade700 : Colors.black,
                      ),
                      Text(
                        "Home",
                        style: index == 0 ? textsel : text,
                      )
                    ],
                  )),
              FloatingActionButton(
                  heroTag: "course",
                  onPressed: () {
                    setState(() {
                      index = 1;
                    });
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => coursePage()),
                        (route) => false);
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/book.svg',
                          height: 30,
                          width: 30,
                          color: index == 1
                              ? Colors.amber.shade700
                              : Colors.black),
                      Text(
                        "Course",
                        style: index == 1 ? textsel : text,
                      )
                    ],
                  )),
              FloatingActionButton(
                  heroTag: "trending",
                  onPressed: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/compass.svg',
                          height: 28,
                          width: 28,
                          color: index == 2
                              ? Colors.amber.shade700
                              : Colors.black),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Trending",
                        style: TextStyle(
                          fontSize: 11,
                          color:
                              index == 2 ? Colors.amber.shade700 : Colors.black,
                        ),
                      )
                    ],
                  )),
              FloatingActionButton(
                  heroTag: "profile",
                  onPressed: () {
                    setState(() {
                      index = 3;
                    });
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 28,
                        color:
                            index == 3 ? Colors.amber.shade700 : Colors.black,
                      ),
                      Text(
                        "Profile",
                        style: index == 3 ? textsel : text,
                      )
                    ],
                  )),
            ]),
      ),
    );
  }
}
