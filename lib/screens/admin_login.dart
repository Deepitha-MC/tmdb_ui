import 'package:flutter/material.dart';
import 'package:tmdb/constants/input_decoration.dart';
import 'package:tmdb/services/database.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        flexibleSpace: Container(
          // height: 500,
          width: 200,
          // height: Size.fromHeight(50.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00C854), Color(0xFF00C853)],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
          child: const Center(
            child: Text(
              'Admin portal',
              style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF00C854), Color(0xFF00C853)],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight),
                ),
                child: MaterialButton(
                  minWidth: 200,
                  height: 70,
                  onPressed: () {
                    Navigator.pushNamed(context, '/insert_song');
                  },
                  child: const Text(
                    'Insert Song',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF00C854), Color(0xFF00C853)],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight),
                ),
                child: MaterialButton(
                  minWidth: 200,
                  height: 70,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                            title: const Center(
                              child: Text('Enter Song name',
                                  style: TextStyle(fontFamily: 'prodSans')),
                            ),
                            actions: [
                              TextField(
                                  cursorColor: Colors.green,
                                  controller: _titleController,
                                  decoration: inputDecoration.copyWith(
                                      labelText: 'Title')),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                clipBehavior: Clip.antiAlias,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF00C854),
                                          Color(0xFF00C853)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.topRight),
                                  ),
                                  child: MaterialButton(
                                    child: const Text('Delete'),
                                    onPressed: () {
                                      Database()
                                          .deleteSong(_titleController.text);
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          elevation: 10,
                                          backgroundColor: Colors.green,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20))),
                                          content: Text('Song ' +
                                              _titleController.text +
                                              ' deleted from the database'),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  child: const Text(
                    'Delete Song',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
