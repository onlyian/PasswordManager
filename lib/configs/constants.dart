import 'package:flutter/material.dart';
import '../models/password_model.dart';

class Constants {
  static List<passwords> passwordData = [
    passwords("Netflix ", "kipruto@gmail.com",
        "https://pngimg.com/uploads/netflix/netflix_PNG15.png"),
    passwords("Twitter", "kipruto@gmail.com",
        "https://img.freepik.com/free-icon/twitter_318-674515.jpg"),
    passwords("Google ", "kipruto@gmail.com",
        "https://cdn-icons-png.flaticon.com/128/2702/2702602.png"),
    passwords("Dribbble Pro", "kipruto@gmail.com",
        "https://cdn.freebiesupply.com/logos/large/2x/dribbble-icon-1-logo-png-transparent.png"),
    passwords("Instagram ", "kipruto@gmail.com",
        "https://cdn-icons-png.freepik.com/256/1409/1409946.png?ga=GA1.1.308614930.1741333099&semt=ais_hybrid"),
  ];

  static List<String> addressData = ["twitter", "facebook", "Instagram",];

  static List<String> cardData = ["KCB","6234-8700-2666-3733","Kipruto Ian", "4/30", "Visa","345"];

  static List<String> websiteList = ["twitter", "facebook", "Instagram"];
}
