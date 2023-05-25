import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:task/appBloc.dart';
import 'package:task/widgets/bullitin_widget.dart';
import 'package:task/widgets/latest_articles.dart';
import 'package:task/widgets/news_widget.dart';
import 'dart:math' as math;

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  AppBloc? _appBloc;
  bool loadMore = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
     _appBloc!.getNews();
    });
  }
  @override
  Widget build(BuildContext context) {
    _appBloc ??= Provider.of<AppBloc>(context);
    return Scaffold(
      appBar: PreferredSize(child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -300,
            left: -350,
            bottom: 0,
            
            child: ClipOval(
              child: Container(
                
                decoration: BoxDecoration(
                  
                  color: Color.fromRGBO(250, 200, 163, 30),
                  
            
                ),
                height: 600, width: 600,),
            )),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${DateTime.now().hour} : ${DateTime.now().minute}", style: const TextStyle(fontFamily: "Roboto_Slab", fontSize: 15, fontWeight: FontWeight.w900, color: Colors.white)),
                                Container(
                                  height: 10,
                                  width: 20,
                                  color: Colors.yellow,
                                )
                        
                              ],
                            )),
                Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlue[100],
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                                    ),
                                    child: Center(child: Text("hidoc", style: TextStyle(fontFamily: "Roboto_Slab", fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),)),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipOval(
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      
                                      // padding: EdgeInsets.all(30),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white)
                                      ),
                                      child: Center(child: Icon(Icons.home, size: 20, color: Colors.white,)),
                                    ),
                                  ),
                                  Expanded(flex: 1, child: Container()),
                                  Container(
                                    height: 30,
                                    width: 100,
                                    child: Center(child: Text("ARTICLES", style: TextStyle(fontFamily: "Roboto_Slab", fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black),)),
                                  ),
                                  Expanded(flex: 1, child: Container()),
                                ],
                              ),
                            ),

              ],
            ),
          ),
        ],
      ), preferredSize: Size(MediaQuery.of(context).size.width -40, MediaQuery.of(context).size.height * 0.2)),
      
      body: Container(
        margin: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder(
          stream: _appBloc!.news.stream,
          builder: (context, snapshot) {
            if(snapshot.data == null){
              return CircularProgressIndicator();
            }
            return Stack(
              children: [
                Positioned.fill(
                  top: 300,
                  right: 0,
            bottom: 0,
            left: 150,

                  child: CustomPaint(painter: RPSCustomPainter(), size: Size(MediaQuery.of(context).size.width * 0.2,(MediaQuery.of(context).size.width*0.5833333333333334).toDouble())),),
                CustomScrollView(
                  slivers: [SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                        Container(
                          child: Column(
                            children: [
                              // Expanded(child: Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text("${DateTime.now().hour} : ${DateTime.now().minute}", style: const TextStyle(fontFamily: "Roboto_Slab", fontSize: 15, fontWeight: FontWeight.w900, color: Colors.black)),
                              //     Container(
                              //       height: 10,
                              //       width: 20,
                              //       color: Colors.yellow,
                              //     )
                          
                              //   ],
                              // )),
                              // Expanded(
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Container(
                              //         height: 30,
                              //         width: 100,
                              //         decoration: BoxDecoration(
                              //           color: Colors.lightBlue[100],
                              //           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                              //         ),
                              //         child: Center(child: Text("hidoc", style: TextStyle(fontFamily: "Roboto_Slab", fontSize: 15, fontWeight: FontWeight.w900, color: Colors.white),)),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // Expanded(
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Container(
                              //         height: 30,
                              //         width: 100,
                              //         child: Center(child: Text("ARTICLES", style: TextStyle(fontFamily: "Roboto_Slab", fontSize: 20, fontWeight: FontWeight.w900, color: Colors.black),)),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                          
                              // Row(
                              //   children: [
                              //     Container(
                              //       width: MediaQuery.of(context).size.width - 40,
                              //       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                              //       decoration: BoxDecoration(
                              //       color: Colors.white,
                              //         borderRadius: BorderRadius.all(Radius.circular(10)),
                              //         // border: Border.all(color: Colors.white70),
                              //         boxShadow: [
                              //           BoxShadow(
                              //             color: Colors.grey,
                              //             offset: Offset(0.0 , 1.0),
                              //             blurRadius: 0,
                              //           )
                                        
                              //         ]
                              //       ),
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //         children: [
                              //           Expanded(child: Container()),
                              //           Text("Data"),
                              //            Expanded(child: Container()),
                              //           Icon(Icons.arrow_drop_down, )
                          
                              //       ]),
                              //     )
                              //   ],
                              // ),
                              
                            ],
                          ),
                          
                        ),
                        
                          
                      ],
                          
                    ),
                  ),
                  SliverToBoxAdapter(child: NewsWidget()),
                  Bulletin(),
                  TrendingBulletin(),
                  SliverToBoxAdapter(child: SizedBox(height: 20,)),
                  SliverToBoxAdapter(child: InkWell(
                    onTap: (() {
                      setState(() {
                        loadMore = true;
                      });
                    }),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    
                          color: Colors.orange,
                          child: Text("Read More Bulletins",  style: TextStyle(color: Colors.white, fontFamily: "Roboto_Slab", fontSize: 14 ,), maxLines: 2, textAlign: TextAlign.left,),
                        )
                  
                      ],
                    ),
                  ),),
                  // SliverToBoxAdapter(child: Container(
                  //   child: Stack(
                  //           children: [
                  //             Positioned(
                  //     bottom: 0,
                  //     right: 0,
                  //     child: CustomPaint(painter: RPSCustomPainter(),  size: Size(100,600),)),
                  //           ],
                  //         ),
                  // ),),
                  if(loadMore)...[

                    SliverToBoxAdapter(child: SizedBox(height: 20,)),
                    SliverToBoxAdapter(child: LatestArtciles(),),
                    SliverToBoxAdapter(child: SizedBox(height: 20,)),
                    SliverToBoxAdapter(child: Trending(),),
                    SliverToBoxAdapter(child: SizedBox(height: 20,)),
                    SliverToBoxAdapter(child: LatestArtciles(isExplore: true,)),
                  SliverToBoxAdapter(child: SizedBox(height: 10,),),
                  SliverToBoxAdapter(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  
                        color: Colors.orange,
                        child: Center(child: Text("Explore Hidoc Dr.",  style: TextStyle(color: Colors.white, fontFamily: "Roboto_Slab", fontSize: 14 ,), maxLines: 2, textAlign: TextAlign.left,)),
                      )
                  
                    ],
                  ),),
                  
                  ],
                  SliverToBoxAdapter(child: SizedBox(height: 10,),),
                  SliverToBoxAdapter(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        child: Center(child: Text("What's more on Hidoc Dr.",  style: TextStyle(color: Colors.black, fontFamily: "Roboto_Slab", fontSize: 20 , fontWeight: FontWeight.w800), maxLines: 2, textAlign: TextAlign.left,)),
                      )
                  
                    ],
                  ),),
                  SliverToBoxAdapter(child: SizedBox(height: 10,),),
                  SliverToBoxAdapter(child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 600,
                    
                    color: Color.fromARGB(255, 236, 236, 236),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                           child: Text("News",  style: TextStyle(color: Colors.black, fontFamily: "Roboto_Slab", fontSize: 20 , fontWeight: FontWeight.w800), maxLines: 2, textAlign: TextAlign.left,),
                         ),
                         SizedBox(height: 20,),
                         Padding(
                           padding: const EdgeInsets.all(15.0),
                           child: Text("Experts addressing burnout discuss the importance not only of self-care, but also of improving work place conditions",  style: TextStyle(color: Colors.black, fontFamily: "Roboto_Slab", fontSize: 12 , fontWeight: FontWeight.w400), maxLines: 2, textAlign: TextAlign.left,),
                         ),
                         Expanded(child: Container()),
                         Image.asset("assets/photo.png", fit: BoxFit.cover,)


                      ],
                    ),
                  ),),
                  SliverToBoxAdapter(child: SizedBox(height: 20,),),
                  SliverToBoxAdapter(child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipOval(
                              child: Container(
                                color: Color.fromARGB(255, 227, 241, 253),
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.emoji_events_outlined, color: Colors.blue,),),
                            ),
                              SizedBox(width: 20,),
                              Text("Quizzes :",  style: TextStyle(color: Colors.black, fontFamily: "Roboto_Slab", fontSize: 18 , fontWeight: FontWeight.w800), maxLines: 2, textAlign: TextAlign.left,),
                              SizedBox(width: 10,),
                              Expanded(child: Text("participate and win exciting prizes",  style: TextStyle(color: Color(0xfff474747), fontFamily: "Roboto_Slab", fontSize: 12 , fontWeight: FontWeight.w400), maxLines: 2, textAlign: TextAlign.left,)),


                          ],
                        ),
                        Divider(color: Colors.grey[400], thickness: 1,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipOval(
                              child: Container(
                                color: Color.fromARGB(255, 227, 241, 253),
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.calculate_outlined, color: Colors.blue,),),
                            ),
                              SizedBox(width: 20,),
                              Expanded(child: Text("Medical Calculators :",  style: TextStyle(color: Colors.black, fontFamily: "Roboto_Slab", fontSize: 18 , fontWeight: FontWeight.w800), maxLines: 2, textAlign: TextAlign.left,)),
                              Expanded(child: Text("Get Access to 800+ Evidence based calculators",  style: TextStyle(color: Color(0xfff474747), fontFamily: "Roboto_Slab", fontSize: 12 , fontWeight: FontWeight.w400), maxLines: 3, textAlign: TextAlign.left,)),


                          ],
                        ),
                        Divider(color: Colors.grey[400], thickness: 1,),


                      ],
                    ),
                  ),),
                  SliverToBoxAdapter(child: SizedBox(height: 20,),),
                  SliverToBoxAdapter(child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width - 40,
                    color: Color.fromARGB(255,  255, 234, 203),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text("Social Network for doctors - A Special feature on Hidoc Dr",  style: TextStyle(color: Colors.black, fontFamily: "Roboto_Slab", fontSize: 15 , fontWeight: FontWeight.w800), maxLines: 2, textAlign: TextAlign.left,)),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(255, 253, 153, 0),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          child: Center(child: Text("Visit",  style: TextStyle(color: Colors.white, fontFamily: "Roboto_Slab", fontSize: 18 , fontWeight: FontWeight.w800), maxLines: 2, textAlign: TextAlign.left,))
                        
                        ,)


                      ],
                    ),
                  ),),
                  SliverToBoxAdapter(child: SizedBox(height: 40,))
                  // SliverList(delegate: SliverChildBuilderDelegate(((context, index) {
                  //   return ListView.builder(
                  //     itemCount: 100,
                  //     itemBuilder: ((context, index) {
                  //     return Text("data");
                  //   }));
                  // }), ))
                  ],
                  
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 252, 232, 211)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
     
         
    Path path0 = Path();
    path0.moveTo(size.width*0.9998083,size.height*0.0088000);
    path0.lineTo(size.width,size.height*0.9998286);
    path0.lineTo(size.width*0.2500667,size.height*0.9965286);
    path0.quadraticBezierTo(size.width*-0.0480500,size.height*0.4454286,size.width*0.4784167,size.height*0.2906143);
    path0.quadraticBezierTo(size.width*1.0053583,size.height*0.1979429,size.width*0.9982583,size.height*0.0100143);
    path0.lineTo(size.width*0.4255000,size.height*0.5469429);

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}






