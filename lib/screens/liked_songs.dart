import 'package:flutter/material.dart';
import 'package:tmdb/components/songGrid.dart';
import 'package:tmdb/constants/input_decoration.dart';
import 'package:tmdb/services/database.dart';
import 'package:get_storage/get_storage.dart';

// ignore: must_be_immutable
class LikedSongsWidget extends StatefulWidget {
  double width;
  LikedSongsWidget({Key? key, required this.width}) : super(key: key);

  @override
  State<LikedSongsWidget> createState() => _LikedSongsWidgetState();
}

class _LikedSongsWidgetState extends State<LikedSongsWidget> {
  List<String> titles = ['1.Show Liked Songs', '2.Liked Song By Title'];
  String selectedVal = '1.Show Liked Songs';
  String searchingValue = '';
  String index = '1';
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Database _db = Database();
    final box = GetStorage();

    return Container(
      color: Colors.grey.withAlpha(10),
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: SizedBox(
                    width: 500,
                    child: TextFormField(
                      cursorColor: Colors.green,
                      decoration: inputDecoration.copyWith(
                          labelText:
                              ' search by entering ${selectedVal.toString().split('.')[1]}'),
                      onFieldSubmitted: (String value) {
                        setState(() {
                          isSearching = true;
                          searchingValue = value;
                          index = selectedVal.split('.')[0];
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: size.width / 10),
                SizedBox(
                  height: 50,
                  width: 500,
                  child: DropdownButtonFormField(
                    // Initial Value
                    value: selectedVal.toString(),

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: titles.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items.split('.')[1],
                          style: const TextStyle(fontSize: 12),
                        ),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedVal = newValue!;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Center(
              child: isSearching
                  ? songGrid(
                      future: _db.handleLikedSongsRequests(
                          box.read('uname'), index, searchingValue))
                  : Text('Results will appear here'),
            ),
          )
        ],
      ),
    );
  }
}
