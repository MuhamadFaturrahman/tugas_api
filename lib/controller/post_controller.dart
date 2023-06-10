import 'dart:convert';
import 'dart:io';
import 'package:kel_2_api/models/album.dart';
import 'package:kel_2_api/models/comment.dart';
import 'package:kel_2_api/models/photo.dart';
import 'package:kel_2_api/models/post.dart';
import 'package:kel_2_api/services/post_services.dart';

class PostController {
  Future<List<Post>> fetchAll() async {
    return await PostService().fetch().then((res) {
      if (res.statusCode == HttpStatus.ok) {
        var jsonData = jsonDecode(res.body);
        return List.generate(
            jsonData.length,
            (index) => Post.fromMap(
                  jsonData[index],
                ));
      } else {
        throw Exception();
      }
    });
  }

  Future<List<Comment>> fetchComment(int id) async {
    return await PostService().fetchComments(id).then((res) {
      if (res.statusCode == HttpStatus.ok) {
        var jsonData = jsonDecode(res.body);
        return List.generate(
            jsonData.length, (index) => Comment.fromMap(jsonData[index]));
      } else {
        throw Exception();
      }
    });
  }
