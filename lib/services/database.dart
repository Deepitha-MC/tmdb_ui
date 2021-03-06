import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class Database {
  final dio = Dio();
  Future getAllData(int songID) async {
    final resp = await dio.get(
      'http://localhost:5000/getSongDetails',
      queryParameters: {'songID': songID},
    );
    print(resp.data);
    return resp.data[0];
  }

  Future getSongList() async {
    final resp = await dio.get('http://localhost:5000/');
    print("here");
    print(resp.data[0]['url']);
    return resp.data;
  }

  Future searchSong(id) async {
    final resp = await dio.get('http://localhost:5000/getSongDetails',
        queryParameters: {'song': id});
    // print(resp.data);
    return resp.data;
  }

  Future searchSongTitle(name) async {
    final resp = await dio.get('http://localhost:5000/getSongByTitle',
        queryParameters: {'songName': name});
    // print(resp.data);
    return resp.data;
  }

  Future handleBrowseRequests(val, index) async {
    late String url;
    late Map<String, dynamic> query;
    switch (index) {
      case '1':
        // if (val == 'lang') {
        //   url = 'http://localhost:5000/getLang';
        // } else {
        url = 'http://localhost:5000/getSongsByLang';
        query = {'lang': val};
        // }
        break;
      case '2':
        url = 'http://localhost:5000/getSongsByArtist';
        query = {'artist': val};
        break;
      case '3':
        url = 'http://localhost:5000/getSongsByYear';
        query = {'year': val};
        break;
      case '4':
        url = 'http://localhost:5000/getAlbum';
        query = {'album': val};
        break;
      case '5':
        url = 'http://localhost:5000/getSongsByCountry';
        query = {'country': val};
        break;
      case '6':
        url = 'http://localhost:5000/getSongsByGenre';
        query = {'genre': val};
        break;
      case '7':
        url = 'http://localhost:5000/getSongsRatedAbove';
        query = {'rating': val};
        break;
      case '8':
        url = 'http://localhost:5000/getSongsRatedBelow';
        query = {'rating': val};
        break;
      default:
        url = 'http://localhost:5000/getSongByTitle';
        query = {'songName': val};
        break;
    }
    final resp = await dio.get(url, queryParameters: query);
    // print(resp.data[0]);
    return resp.data;
  }

  Future handleLikedSongsRequests(uname, index, val) async {
    late String url;
    late Map<String, dynamic> query;
    switch (index) {
      case '1':
        if (val == '') {
          url = 'http://localhost:5000/getLikedSongs';
          query = {'username': uname};
        }
        break;
      case '2':
        url = 'http://localhost:5000/getLikedSongByTitle';
        query = {'songName': val, 'username': uname};
    }
    final resp = await dio.get(url, queryParameters: query);
    // print(resp.data[0]);
    return resp.data;
  }

  Future addToLikedSongs(int songID, String uname) async {
    final resp = await dio.post('http://localhost:5000/addToLikedSongs',
        queryParameters: {"songID": songID, "username": uname});
    resp.data;
  }

  Future getLikedSongs(String uname) async {
    final resp = await dio.get('http://localhost:5000/getLikedSongs',
        queryParameters: {"username": uname});
    return resp.data;
  }

  Future addRating(int songID, String uname, rating, String review) async {
    final resp = await dio.post('http://localhost:5000/addRating/',
        queryParameters: {
          "songID": songID,
          "ratings": rating,
          "username": uname,
          "review": review
        });
    resp.data;
  }

  Future getReviews(int songID) async {
    final box = GetStorage();
    final resp = await dio.get('http://localhost:5000/getAllReviews',
        queryParameters: {"songID": songID});
    // print(resp.data);
    return resp.data;
  }

  Future addSong(title, artist, releaseYear, duration, coverURL, country,
      recordingHouse, songURL, album, language, genre) async {
    final resp =
        await dio.post('http://localhost:5000/addSong', queryParameters: {
      "songName": title,
      "artist": artist,
      "releaseYear": releaseYear,
      "duration": duration,
      "coverURL": coverURL,
      "country": country,
      "recordingHouse": recordingHouse,
      "songURL": songURL,
      "album": album,
      "language": language,
      "genre": genre,
    });
    return resp.data;
  }

  Future deleteSong(title) async {
    final resp = await dio.delete('http://localhost:5000/deleteSong',
        queryParameters: {"title": title});
    return resp.data;
  }
}
