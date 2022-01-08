import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tmdb/components/songGrid.dart';
import 'package:tmdb/services/database.dart';
// import 'package:tmdb/services/user.dart';

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
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: TextFormField(
                        cursorColor: Colors.green,
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
                                  color: Colors.lightGreen,
                                ),
                                Text(
                                  'Search...',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.lightGreen,
                                      fontSize: 18,
                                      fontFamily: 'prodSans'),
                                )
                              ],
                            ),
                          ),
                          hintText: 'example ->Bleed',
                          hintStyle: const TextStyle(
                              fontFamily: 'prodSans',
                              fontSize: 16,
                              color: Colors.lightGreen),
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
                    backgroundColor: Colors.lightGreen,
                    child: Text(
                      box.read('uname').toString()[0],
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    box.read('uname').toString(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 20),
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
              child: SongGrid(
                future: isSearching
                    ? Database().searchSongTitle(searchTitle)
                    : Database().getSongList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
