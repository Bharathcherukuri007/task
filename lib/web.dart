import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task/widgets/bullitin_widget.dart';
import 'package:task/widgets/latest_articles.dart';
import 'package:task/widgets/news_widget.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(child: NavBar(), preferredSize: Size(MediaQuery.of(context).size.width - 40, 100)),
      body: Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomScrollView(slivers: [
                        SliverToBoxAdapter(child: NewsWidget(isWeb: true,),)
                      ],),
                    ),
                  ],
                ),
              ),
              Container(
                height: 700,
                child: Row(
                  children: [
                    Expanded(child: 
                    CustomScrollView(slivers: [
                      Bulletin(),
                      
                    ],),
              
                    ),
                    Expanded(child: 
                    CustomScrollView(slivers: [
                      TrendingBulletin(),
                      
                    ],),
                    
                    )
                  ],
                ),
              ),
              Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    
                          color: Color.fromARGB(255,0,188,212),
                          child: Text("Read More Bulletins",  style: TextStyle(color: Colors.white, fontFamily: "Roboto_Slab", fontSize: 14 ,), maxLines: 2, textAlign: TextAlign.left,),
                        )
                  
                      ],
                    ),
                    SizedBox(height: 20,),

              Container(
                height: 300,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(child: LatestArtciles(),)
                        ],
                      ),
                    ),
                    SizedBox(width: 30,),
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(child: Trending(),)
                        ],
                      ),
                    ),
                    SizedBox(width: 30,),
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(child: LatestArtciles(isExplore: true,),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          color: Color.fromARGB(255, 255, 255, 255),
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                          child: Column(
                            children: [
                              Center(child: Text("What's more on Hidoc Dr.",  style: TextStyle(color: Colors.black, fontFamily: "Roboto_Slab", fontSize: 20 , fontWeight: FontWeight.w800), maxLines: 2, textAlign: TextAlign.left,)),
                              SizedBox(height: 20,),
                              Container(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: 250,
                                        width: 600,
                                        color: Color.fromARGB(255, 236, 236, 236),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
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
                                                ],
                                              ),
                                            ),
                                            // Expanded(child: Container()),
                                            Expanded(child: Image.asset("assets/photo.png", fit: BoxFit.cover))
                                        
                                        
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 30,),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                                        // width: MediaQuery.of(context).size.width - 40,
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
                                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      
                  
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          color: Color.fromARGB(255, 204, 242, 246),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Text("Social Network for doctors - A Special feature on Hidoc Dr",  style: TextStyle(color: Colors.black, fontFamily: "Roboto_Slab", fontSize: 15 , fontWeight: FontWeight.w800), maxLines: 2, textAlign: TextAlign.left,)),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                color: Color.fromARGB(255, 0, 188, 212)
                                ),
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                child: Center(child: Text("Visit",  style: TextStyle(color: Colors.white, fontFamily: "Roboto_Slab", fontSize: 18 , fontWeight: FontWeight.w800), maxLines: 2, textAlign: TextAlign.left,))
                              
                              ,)
                      
                      
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0 , 3.0),
                              blurRadius: 0,
                            )
                            
                          ]
                        ),
                        child: Image.asset("assets/photo.png", fit: BoxFit.cover,),),
                        SizedBox(width: 30,),
                        Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0 , 3.0),
                              blurRadius: 0,
                            )
                            
                          ]
                        ),
                        child: Image.asset("assets/photo.png", fit: BoxFit.cover,),),
                        Expanded(child: Container()),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Expanded(child: Image.asset("assets/photo1.png", fit: BoxFit.cover,),)
                    ],
                  )
            ],
          ),
        )
      ),
    );
  }
}


class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Expanded(child: Container()),
          Image.asset("assets/photo2.png", height: 80, width: 80,),
          Expanded(flex: 1, child: Container()),
          Expanded(flex: 2, child: Text.rich(TextSpan(
            text: "Social | Cases | Quizzes | ",
            style: TextStyle(color: Colors.black, fontFamily: "Roboto_Slab", fontSize: 15),
            children: [
              TextSpan(
                text: "Articles",
                style: TextStyle(color: Colors.blue, fontFamily: "Roboto_Slab", fontSize: 15)
              ),
               TextSpan(
                text: " | Drugs | Webinars | Calculators | GuideLines | Surveys | News | Clinical Trails",
                style: TextStyle(color: Colors.black, fontFamily: "Roboto_Slab", fontSize: 15)
              ),

            ]

          ))),
          Expanded(flex: 1, child: Container()),
          Icon(Icons.search, size: 30, color: Colors.grey,),
          // Expanded(child: Container()),
          Icon(Icons.menu, size: 30, color: Colors.grey,),
          // Expanded(child: Container()),
          ClipOval(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey)
              ),
              padding: EdgeInsets.all(10),
              child: Center(child: Text("G", style: TextStyle(fontSize: 20, color: Colors.grey),)),
            ),
          )


        ],
      ),

    );
  }
}

class NewsWeb extends StatelessWidget {
  String title;
  String description;
  String link;
  NewsWeb({super.key, required this.title, required this.description, required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      width: MediaQuery.of(context).size.width - 200,
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                // width: MediaQuery.of(context).size.width - 300,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 222, 220, 220),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                
                ),
                padding: EdgeInsets.all(50),
                child: Icon(Icons.newspaper, size: 60, color: Colors.grey,),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                      height: 70,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 9, 149, 196),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20))
                      ),
                      child: Column(
                        
                        children: [
                          Text("Points", style: TextStyle(color: Colors.white, fontFamily: "Roboto_Slab"),),
                          Text("2", style: TextStyle(fontFamily: "Roboto_Slab", fontWeight: FontWeight.w800, fontSize: 20, color: Colors.white),)
                        ],
                      ),
                    ))
            ],
          ),
          SizedBox(width: 300,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Colors.black, fontFamily: "Roboto_Slab", fontSize: 18, fontWeight: FontWeight.bold), maxLines: 4, textScaleFactor: 1, textAlign: TextAlign.start,),
                SizedBox(height: 10,),
                Text(description, style: TextStyle(color: Colors.black, fontFamily: "Roboto_Slab", fontSize: 15,), maxLines: 2, textScaleFactor: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.start,),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (() async{
                        
                          // await launchUrl(Uri.parse(link));

                        
                      }),
                      child: Text("Read full article to earn points", style: TextStyle(color: Color.fromARGB(255, 9, 149, 196), fontStyle: FontStyle.italic, decoration: TextDecoration.underline),)),
                  ],
                ),

              ],
            ),
          
        ],
      
    ));
  }
}