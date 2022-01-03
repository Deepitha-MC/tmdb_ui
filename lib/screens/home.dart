import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moviedb/components/moviesgrid.dart';
import 'package:moviedb/services/database.dart';
import 'package:moviedb/services/user.dart';

class HomeWidget extends StatefulWidget {
  double width;
  HomeWidget({Key? key, required this.width}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final _searchController = TextEditingController();

  bool isSearching = false;

  String searchTitle = '';
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withAlpha(10),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 40, top: 10),
                  child: SizedBox(
                    width: widget.width / 5.6,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        controller: _searchController,
                        onFieldSubmitted: (value) {
                          if (value != '') {
                            setState(() {
                              isSearching = true;
                              searchTitle = value;
                            });
                          } else {
                            setState(() {
                              isSearching = false;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          label: SizedBox(
                            width: 100,
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.search,
                                  color: Colors.amber,
                                ),
                                Text(
                                  'Search...',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                          hintText: 'example ->The Matrix',
                          hintStyle: const TextStyle(fontSize: 12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: widget.width / 2.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.red,
                    child: Text(
                      box.read('uname').toString()[0],
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    box.read('uname').toString(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 8,
            child: Center(
              child: MoviesGrid(
                future: isSearching
                    ? Database().searchMovie(searchTitle)
                    : Database().getMovieList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
