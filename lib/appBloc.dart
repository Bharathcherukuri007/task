import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:task/new.dart';
import 'package:task/service_layer.dart';
class AppBloc{

  BehaviorSubject<List<News>> news = BehaviorSubject.seeded([]);
  BehaviorSubject<dynamic?> allData = BehaviorSubject.seeded(null);
BehaviorSubject<List<Bulletin>> bulletin = BehaviorSubject.seeded([]);
BehaviorSubject<List<TrendingBulletin>> trendingbulletin = BehaviorSubject.seeded([]);
BehaviorSubject<List<LatestArticles>> latestArticles= BehaviorSubject.seeded([]);
BehaviorSubject<List<LatestArticles>> exploreArticles= BehaviorSubject.seeded([]);
BehaviorSubject<String> specialityName = BehaviorSubject.seeded("");
  List<News> n = [];

  void add(dynamic data){
    allData.add(data);
  }
    String url =  "http://devapi.hidoc.co:8080/HidocWebApp/api/getArticlesByUid?";
  Future<void> getNews() async{

     var res =  http.MultipartRequest('POST', Uri.parse(url), )
    ..fields["userId"] = "423914"
    ..fields["sId"] = "500";
    var response = await res.send();
    response.headers.putIfAbsent("Access-Control-Allow-Origin", () => "*");
    response.headers.putIfAbsent("Access-Control-Allow-Methods", () =>  "POST, GET, OPTIONS, PUT, DELETE, HEAD");
    try{
       if(response.statusCode == 200) {
      var body = await (response.stream.bytesToString());
      var jsonbody = await jsonDecode(body);

      print(jsonbody["data"]["news"].length);
      for(int i=0;i<jsonbody["data"]["news"].length ;i++){
        n.add(News.fromJSON(jsonbody["data"]["news"][i]));

      }
      news.add(n);
      List<Bulletin> res = [];
      for(int i=0; i<jsonbody["data"]["trandingArticle"].length ;i++){
        res.add(Bulletin.fromJSON(jsonbody["data"]["trandingArticle"][i]));

      }
      bulletin.add(res);
      
       List<TrendingBulletin> tb = [];
      for(int i=0; i<jsonbody["data"]["trandingBulletin"].length ;i++){
        tb.add(TrendingBulletin.fromJSON(jsonbody["data"]["trandingBulletin"][i]));

      }
      trendingbulletin.add(tb);
      List<LatestArticles> la = [];
      for(int i=0; i<jsonbody["data"]["latestArticle"].length ;i++){
        la.add(LatestArticles.fromJSON(jsonbody["data"]["latestArticle"][i]));

      }
      latestArticles.add(la);
      List<LatestArticles> explore  = [];
      for(int i=0; i<jsonbody["data"]["exploreArticle"].length ;i++){
        explore.add(LatestArticles.fromJSON(jsonbody["data"]["exploreArticle"][i]));

      }
      exploreArticles.add(explore);
      specialityName.add(jsonbody["data"]["specialityName"]);




    
    }
    

    }
    catch(e){
      print(e);
    }
    
  }

  
  
  
}