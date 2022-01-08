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
        if (val == 'lang') {
          url = 'http://localhost:5000/getLang';
        } else {
          url = 'http://localhost:5000/getSongsByLang';
          query = {'lang': val};
        }
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

  Future addRating(int songID, String uname, rating) async {
    final resp =
        await dio.post('http://localhost:5000/addRating', queryParameters: {
      "songID": songID,
      "ratings": rating,
      "username": uname,
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

  Future addSong(title, plot, year, duration, url, country, production,
      boxOffice, awards, language, genre, director) async {
    final resp = await dio.post('http://localhost:5000/addSong', data: {
      "title": title,
      "plot": plot,
      "year": year,
      "duration": duration,
      "url": url,
      "country": country,
      "production": production,
      "box_office": boxOffice,
      "awards": awards,
      "language": language,
      "genre": genre,
      "director": director,
    });

    return resp.data;
  }
}
