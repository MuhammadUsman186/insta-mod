import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_mod/screen/add_post_screen.dart';
import 'package:instagram_mod/screen/feed_screen.dart';
import 'package:instagram_mod/screen/profie_screen.dart';
import 'package:instagram_mod/screen/search_screen.dart';

int webScreenSize = 600;
List<Widget> homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text('notifications,'),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser?.uid ?? '',
  ),
];
