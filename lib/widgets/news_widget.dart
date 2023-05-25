import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:task/appBloc.dart';

class NewsWidget extends StatefulWidget {
  bool isWeb ;
  NewsWidget({super.key, this.isWeb = false});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  AppBloc? _appBloc;
  bool isOpen = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async{
     await  _appBloc!.getNews();
    });
  }
  @override
  Widget build(BuildContext context) {
    _appBloc ??= Provider.of<AppBloc>(context);
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                            decoration: BoxDecoration(
                            color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              // border: Border.all(color: Colors.white70),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0 , 1.0),
                                  blurRadius: 0,
                                )
                                
                              ]
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isOpen = !isOpen;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Container()),
                                  Text(_appBloc!.specialityName.value),
                                   Expanded(child: Container()),
                                  Icon(isOpen?  Icons.arrow_drop_down : Icons.arrow_drop_up, )
                                              
                              ]),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      StreamBuilder(
                        stream: _appBloc!.news.stream,
                        builder: ((context, snapshot) {
                          if(snapshot.data == null || snapshot.data!.isEmpty){
                            return CircularProgressIndicator();
                          }
                        //  if(!isOpen){
                        //   return SizedBox();
                        //  }
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.length!,
                            itemBuilder: (context, index) {
                              return widget.isWeb ? NewsWeb(date: snapshot.data![index].publishedAt.toString(), title: snapshot.data![index].title!, description: snapshot.data![index].description!, link: snapshot.data![index].url!) : NewsCard(title: snapshot.data![index].title!, description: snapshot.data![index].description!, link: snapshot.data![index].url!, );
                            }
                          );
                          
                        
                      }))
        ],
      ),
    );
  }
}


class NewsCard extends StatelessWidget {
  String title;
  String description;
  String link;
   NewsCard({super.key,  required this.title, required this.description, required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          // border: Border.all(color: Colors.white70),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0 , 3.0),
              blurRadius: 0,
            )
            
          ]
        ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width- 40,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 222, 220, 220),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
            
            ),
            padding: EdgeInsets.all(50),
            child: Icon(Icons.newspaper, size: 60, color: Colors.grey,),
          ),
          Container(
            padding: EdgeInsets.only(top: 15, left: 15),
            width: MediaQuery.of(context).size.width- 40,
            
            child: Column(
              children: [
                Text(title, style: TextStyle(color: Colors.black, fontFamily: "Roboto_Slab", fontSize: 18, fontWeight: FontWeight.bold), maxLines: 4, textScaleFactor: 1,),
                SizedBox(height: 10,),
                Text(description, style: TextStyle(color: Colors.black, fontFamily: "Roboto_Slab", fontSize: 15,), maxLines: 2, textScaleFactor: 1, overflow: TextOverflow.ellipsis,),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (() async{
                        
                          // await launchUrl(Uri.parse(link));

                        
                      }),
                      child: Text("Read full article to earn points", style: TextStyle(color: Color.fromARGB(255, 9, 149, 196), fontStyle: FontStyle.italic, decoration: TextDecoration.underline),)),
                    Container(
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
                    )
                    
                  ],
                ),

              ],
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
  String date;
  NewsWeb({super.key, required this.title, required this.description, required this.link, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      width: MediaQuery.of(context).size.width - 200,
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 230, 230),
                  
                
                ),
                padding: EdgeInsets.all(50),
                child: Icon(Icons.newspaper, size: 60, color: Colors.grey,),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                      height: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 9, 149, 196),
                        // borderRadius: BorderRadius.only(bottomRight: Radius.circular(20))
                      ),
                      child: Column(
                        
                        children: [
                          Expanded(child: Text("Points", style: TextStyle(color: Colors.white, fontFamily: "Roboto_Slab"),)),
                          Expanded(child: Text("2", style: TextStyle(fontFamily: "Roboto_Slab", fontWeight: FontWeight.w800, fontSize: 15, color: Colors.white),))
                        ],
                      ),
                    ))
            ],
          ),
          SizedBox(width: 20 ,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: Colors.black, fontFamily: "Roboto_Slab", fontSize: 18, fontWeight: FontWeight.bold), maxLines: 4, textScaleFactor: 1,),
                  SizedBox(height: 10,),
                  Text(description, style: TextStyle(color: Colors.black, fontFamily: "Roboto_Slab", fontSize: 15,), maxLines: 2, textScaleFactor: 1, overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 40,),
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
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(date, style: TextStyle(color: Color.fromARGB(255, 9, 149, 196), fontStyle: FontStyle.italic, decoration: TextDecoration.underline),),
                      
                      
                    ],
                  ),
                
                ],
              ),
          ),
          
        ],
      
        ));
  }
}