import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final likes;
  final String postId;
  final datePublished;
  final String postUrl;
  final String profImage;

  const Post(
      {required this.datePublished,
      required this.description,
      required this.likes,
      required this.postId,
      required this.postUrl,
      required this.profImage,
      required this.uid,
      required this.username});
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
        datePublished: snapshot['datePublished'],
        description: snapshot['description'],
        likes: snapshot['likes'],
        postId: snapshot['postId'],
        postUrl: snapshot['postUrl'],
        profImage: snapshot['profImage'],
        uid: snapshot['uid'],
        username: snapshot['username']);
  }

  Map<String, dynamic> toJson() => {
        'descripton': description,
        'uid': uid,
        'likes': likes,
        'username': username,
        'postId': postId,
        'datePublished': datePublished,
        'postUrl': postUrl,
        'profImage': profImage
      };
}
