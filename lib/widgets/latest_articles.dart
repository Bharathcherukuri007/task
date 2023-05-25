import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:task/appBloc.dart';

class LatestArtciles extends StatefulWidget {
  bool isExplore;
  LatestArtciles({super.key, this.isExplore = false});


  @override
  State<LatestArtciles> createState() => _LatestArtcilesState();
}

class _LatestArtcilesState extends State<LatestArtciles> {
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
      stream: widget.isExplore ? _appBloc!.exploreArticles.stream : _appBloc!.latestArticles.stream,
      builder: ((context, snapshot) {
      if(snapshot.data == null ){
        return Center(child: CircularProgressIndicator());
        
        
      }
      return Container(
      width: MediaQuery.of(context).size.width - 40,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff474747))
      ),
      child: Column(
        children: [
          Text(widget.isExplore ? " Explore more in Articles" : "Latest Articles", style: TextStyle(fontFamily: "Roboto_Slab", fontSize:  20, fontWeight: FontWeight.w800), maxLines: 2, textAlign: TextAlign.left,),
          SizedBox(height: 10,),
          Container(
            height: 150,
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                return LatestArticleWidget(title: snapshot.data![index].articleTitle!,);

              
            })),
          )

          

        ],
      ),
    );
      
    }));
  }
}

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
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
      stream: _appBloc!.bulletin.stream,
      builder: ((context, snapshot) {
      if(snapshot.data == null ){
        return Center(child: CircularProgressIndicator());
        
        
      }
      return Container(
      width: MediaQuery.of(context).size.width - 40,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff474747))
      ),
      child: Column(
        children: [
          Text("Trending Articles", style: TextStyle(fontFamily: "Roboto_Slab", fontSize:  20, fontWeight: FontWeight.w800), maxLines: 2, textAlign: TextAlign.left,),
          SizedBox(height: 10,),
          Container(
            height: 250,
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                if(index == 0){
                  return Column(
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
                      SizedBox(height: 10,),
                      Text(snapshot.data![index].articleTitle!, style: TextStyle(fontFamily: "Roboto_Slab", fontSize: 14 ,), maxLines: 2, textAlign: TextAlign.left,),

                    ],
                  );
                }
                return TrendingArticleWidget(title: snapshot.data![index].articleTitle!,);

              
            })),
          )

          

        ],
      ),
    );
      
    }));
  }
}
class LatestArticleWidget extends StatelessWidget {
  String title;
  LatestArticleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        
      ),
      child: Column(
        children: [
          Divider(color: Color(0xff474747), thickness: 1,),
          Text(title, style: TextStyle(fontFamily: "Roboto_Slab", fontSize: 14 ,), maxLines: 2, textAlign: TextAlign.left,),
          

        ],
      ),
    );
  }
}
class TrendingArticleWidget extends StatelessWidget {
  String title;
  TrendingArticleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        
      ),
      child: Column(
        children: [
          Divider(color: Color(0xff474747), thickness: 1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 222, 220, 220),
                  
                
                ),
                padding: EdgeInsets.all(10),
                child: Icon(Icons.newspaper, size: 40, color: Colors.grey,),
              ),
              SizedBox(width: 10,),
              Expanded(flex: 3, child: Text(title, style: TextStyle(fontFamily: "Roboto_Slab", fontSize: 14 ,), maxLines: 3, textAlign: TextAlign.left,)),
            ],
          ),
          

        ],
      ),
    );
  }
}