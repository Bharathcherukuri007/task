import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:task/appBloc.dart';

class BulletinWidget extends StatelessWidget {
  String title;
  String description;
  bool isTrending;
  bool start;
  bool end;
  BulletinWidget({super.key, required this.title, required this.description, this.isTrending = false, this.start = false, this.end = false});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      padding: (!isTrending || end )? EdgeInsets.all(20) : EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
         color: isTrending ? Color.fromARGB(255, 216, 235, 238) : null,
         borderRadius: start ? BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)) : end ? BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)) : null

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(!isTrending)
          
            Divider(color: Color.fromARGB(255, 9, 149, 196), thickness: 5, endIndent: 150,),
          SizedBox(height: 20,),
          Text(title, style: TextStyle(fontFamily: "Roboto_Slab", fontSize: isTrending ? 16 : 20, fontWeight: isTrending ? FontWeight.w800 : FontWeight.bold), maxLines: 2, textAlign: TextAlign.left,),
          SizedBox(height: 20,),
          ReadMoreText(description, trimLines: 3,
                  style: TextStyle(color: Color(0xff474747), fontFamily: "Roboto_Slab"),
                  colorClickableText: Color.fromARGB(255, 9, 149, 196),
                  trimMode: TrimMode.Line,
            
                  trimCollapsedText: 'Read more',
                  moreStyle: TextStyle(decoration: TextDecoration.underline, fontSize: 15, color: Color.fromARGB(255, 9, 149, 196), fontFamily: "Roboto_Slab"),
                  lessStyle: TextStyle(decoration: TextDecoration.underline, fontSize: 15, color: Color.fromARGB(255, 9, 149, 196), fontFamily: "Roboto_Slab"),
                  trimExpandedText: ' Less',)



        ],
      ),
    );
  }
}

class Bulletin extends StatefulWidget {
  const Bulletin({super.key});

  @override
  State<Bulletin> createState() => _BulletinState();
}

class _BulletinState extends State<Bulletin> {
  AppBloc? _appBloc;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if(_appBloc!.news.value != null && _appBloc!.news.value.isNotEmpty){
        // _appBloc!.getNews();
      
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    _appBloc ??= Provider.of<AppBloc>(context);
    return StreamBuilder(
      stream: _appBloc!.bulletin.stream,
      builder: ((context, snapshot) {
      if(snapshot.data == null || snapshot.data!.isEmpty){
        return SliverList(delegate: SliverChildBuilderDelegate(((context, index) {
          return Center(child: CircularProgressIndicator());
        })));
        
      }
      return SliverList(delegate: SliverChildBuilderDelegate(((context, index) {
        if(index == 0){
          return Container(
            
            width: MediaQuery.of(context).size.width - 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10, left: 10, top:10),
                  child: Text("Hidoc Bulletin", style: TextStyle(color: Colors.black, fontSize: 26, fontFamily: "Roboto_Slab", fontWeight: FontWeight.w800),)),
                BulletinWidget(title: snapshot.data![index].articleTitle!, description: snapshot.data![index].articleDescription!)

              ],
            ),
          );
        }
        return BulletinWidget(title: snapshot.data![index].articleTitle!, description: snapshot.data![index].articleDescription!);
        
      }), childCount: snapshot.data!.length));
      
    }));
  }
}

class TrendingBulletin extends StatefulWidget {
  const TrendingBulletin({super.key});

  @override
  State<TrendingBulletin> createState() => _TrendingBulletinState();
}

class _TrendingBulletinState extends State<TrendingBulletin> {
  AppBloc? _appBloc;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if(_appBloc!.news.value != null && _appBloc!.news.value.isNotEmpty){

      
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    _appBloc ??= Provider.of<AppBloc>(context);
    return StreamBuilder(
      stream: _appBloc!.trendingbulletin.stream,
      builder: ((context, snapshot) {
      if(snapshot.data == null || snapshot.data!.isEmpty){
        return SliverList(delegate: SliverChildBuilderDelegate(((context, index) {
          return Center(child: CircularProgressIndicator());
        })));

        
      }
       return SliverList(delegate: SliverChildBuilderDelegate(((context, index) {
        if(index == 0){
          return Container(
            
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Color.fromARGB(255,218,235,239),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10, left: 10, top:10),
                  child: Text("Trending Hidoc Bulletin", style: TextStyle(color: Colors.black, fontSize: 26, fontFamily: "Roboto_Slab", fontWeight: FontWeight.w800),)),
                BulletinWidget(title: snapshot.data![index].articleTitle!, description: snapshot.data![index].articleDescription!, isTrending: true, start: index ==0, end: index == snapshot.data!.length-1,)

              ],
            ),
          );
        }
        return BulletinWidget(title: snapshot.data![index].articleTitle!, description: snapshot.data![index].articleDescription!, isTrending: true,  start: index ==0, end: index == snapshot.data!.length-1);
        
      }), childCount: snapshot.data!.length));
        
      
      
    }));
  }
}

