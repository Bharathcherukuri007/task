import 'dart:core';

import 'package:flutter/material.dart';
class News{
  
  String? id;
  String? title;
  String? url;
  String? urlToImage;
  String? description;
  String? speciality;
  String? newsUniqueId;
  String? trendingLatest;
  String? publishedAt;

  News.fromJSON(dynamic json){
    this.id = json["id"].toString();
    this.title = json["title"];
    this.url = json["url"];
    this.urlToImage = json["urlToImage"];
    this.description = json["description"];
    this.speciality = json["speciality"];
    this.newsUniqueId = json["newsUniqueId"];
    this.trendingLatest = json["trendingLatest"].toString();
    this.publishedAt = json["publishedAt"];
  }
  
  

}

class Bulletin{
  String? articleTitle;
  String? articleDescription;
  String? redirectLink;
  Bulletin.fromJSON(dynamic json){
    this.articleTitle = json["articleTitle"].toString();
    this.articleDescription = json["articleDescription"].toString();
    this.redirectLink = json["redirectLink"].toString();

  }

}

class TrendingBulletin{
  String? articleTitle;
  String? articleDescription;
  String? redirectLink;
  TrendingBulletin.fromJSON(dynamic json){
    this.articleTitle = json["articleTitle"].toString();
    this.articleDescription = json["articleDescription"].toString();
    this.redirectLink = json["redirectLink"].toString();

  }
}

class LatestArticles{
  String? articleTitle;
  String? articleDescription;
  String? redirectLink;
  LatestArticles.fromJSON(dynamic json){
    this.articleTitle = json["articleTitle"].toString();
    this.articleDescription = json["articleDescription"].toString();
    this.redirectLink = json["redirectLink"].toString();

  }
}