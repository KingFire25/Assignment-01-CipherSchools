
import 'package:app/screens/course.dart';
import 'package:app/screens/routes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Widget createCarousel(String heading,String data)
{
  return InkWell( onTap: () {},
            child: Container(
              margin: EdgeInsets.all(2),padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(color: Color.fromARGB(255, 39, 38, 56),borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const[
                      CircleAvatar(backgroundColor: Colors.white,radius: 30,child: CircleAvatar(child: Icon(Icons.camera_alt),),),
                      Icon(Icons.save_sharp),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:4,right: 4),
                    child: Text(heading,style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),textAlign:TextAlign.start,),
                  ),
                  Text(data,style: TextStyle(color: Colors.white60),)
                ]
              )
              ),
          );
}

class _MyHomePageState extends State<MyHomePage> {
  List<String>heading=["Q-rated Content","Projects","Mentors","Earn CipherPoints"];
  List<String>data=["Unlock quality content with our Q-rated content!",
  "Get the hands-on experience with real-time projects guided by expert mentors!",
  "Start learning from the mentors coming from giant corporations like Microsoft,Google,Amazon,Paypal,etc!",
  "Earn exclusive rewards by developing your skills with us!"];
  TextStyle text =  const TextStyle(fontSize: 12,color: Colors.black);
  TextStyle textsel =  const TextStyle(fontSize: 12,color: Color.fromARGB(255, 255, 162, 0));
  
  int index=0;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const Image(image: AssetImage('assets/icon.jpeg'),height: 40),
            Text(" CipherSchools",style: text.apply(fontSizeFactor: 1.6))
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.format_align_right_rounded),color: Colors.black,iconSize: 32,)
        ],
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.3),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30,),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Welcome to ",
                style: const TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.w600),
                children: [
                  TextSpan(text: 'the Future ',style: TextStyle(color: Colors.amber.shade700,fontSize: 40,fontWeight: FontWeight.bold)),
                  const TextSpan(text: 'of Learning!',style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold)),
                ],
                ),
              ),
            const SizedBox(height: 30,),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Start learning by best creators for",
                  style: const TextStyle( color: Colors.black, fontSize: 20,),
                  children: [
                    TextSpan(
                        text: ' absolutely free !',
                        style: TextStyle(color: Colors.amber.shade700,fontSize: 20)),
                  ],
                ),
              ),
            const SizedBox(height: 30,),
            
            //rating bar
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                      children: [
                            Container(
                              margin: const EdgeInsets.only(left: 70),
                              child: const CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(radius: 20,backgroundImage: AssetImage('assets/image1.jpg')),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 35),
                              child: const CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(radius: 22,backgroundImage: AssetImage('assets/image2.jpg')),
                              ),
                            ),
                            const CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(radius: 20,backgroundImage: AssetImage('assets/image3.jpg')),
                            ),
                    ]),
                    RichText(
                      maxLines: 2,
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: " 50+ \n",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: ' Mentors',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                  const VerticalDivider(thickness: 1,width: 20,),
                  Column(
                    children: [
                      const Text("4.8/5",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Row(
                        children: [
                          RatingBar.builder(
                            itemSize: 20, initialRating: 4.5,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            itemBuilder: (context, index) => const Icon(Icons.star_rounded,color: Colors.amber,size: 10),
                            onRatingUpdate: (rat) {},
                          ),
                          const Text(" Ratings")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            
            //button
            SizedBox(
              width: 250,
              child: ElevatedButton(onPressed: (){}, 
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.amber.shade700),
                child: Row(
                  children: const [
                    Text("Start Learning Now ",style: TextStyle(fontSize: 21),),
                    Icon(Icons.arrow_forward_rounded,size: 25,)
                  ],
                ))
            ),
            
            //carousel
            const SizedBox(height: 50,),
            Container(
              height: 230,
              margin: EdgeInsets.all(5),
              foregroundDecoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.white.withOpacity(0.5),blurRadius: 70,offset: Offset(360, 0)),
                  BoxShadow(color: Colors.white.withOpacity(0.5),blurRadius: 70,offset: Offset(-360, 0)),
                ]
              ),
              child: CarouselSlider.builder(
                itemCount: data.length,
                options: CarouselOptions(
                  enlargeFactor: 0.45,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  height: 200,
                  enlargeCenterPage:true,
                  viewportFraction: 0.58,
                  // autoPlay: true,
                  autoPlayCurve: Curves.easeInOut
                  ),
                itemBuilder: (context,index,real) => createCarousel(heading[index],data[index])
              ),
            ),
            SizedBox(height: 400,)
          ],
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width*0.93,
        decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),color: Colors.white,shadows: [
      BoxShadow(blurRadius: 25,color: Colors.black.withOpacity(0.2),spreadRadius: 1)],),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          FloatingActionButton(
            heroTag: "home",
            onPressed: (){
              setState(() {
                index=0;
              });
              if(context!=mp['\home'])
               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>MyHomePage()), (route) => false);
            },
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.home,size: 28,color: index==0?Colors.amber.shade700:Colors.black,),Text("Home",style: index==0?textsel:text,)],
          )
          ),
          FloatingActionButton(
            heroTag: "course",
            onPressed: (){
              setState(() {
                index=1;
              });
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>coursePage()),(route)=>false);
            },
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SvgPicture.asset('assets/book.svg',height: 30,width: 30,color:index==1?Colors.amber.shade700: Colors.black),Text("Course",style: index==1?textsel:text,)],
          )
          ),
          FloatingActionButton(
            heroTag: "trending",
            onPressed: (){
              setState(() {
                index=2;
              });
            },
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SvgPicture.asset('assets/compass.svg',height: 28,width: 28,color: index==2?Colors.amber.shade700:Colors.black),const SizedBox(height: 3,),Text("Trending",style: TextStyle(fontSize: 11,
                          color:index == 2 ? Colors.amber.shade700 : Colors.black,
                        ),)],
          )
          ),
          FloatingActionButton(
            heroTag: "profile",
            onPressed: (){
              setState(() {
                index=3;
              });
            },
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.person,size: 28,color: index==3?Colors.amber.shade700:Colors.black,),Text("Profile",style: index==3?textsel:text,)],
          )
          ),
        ]
        ),
      ),
    );
  }
}
