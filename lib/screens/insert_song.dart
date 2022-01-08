import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tmdb/constants/input_decoration.dart';
import 'package:tmdb/services/database.dart';

class InsertSong extends StatelessWidget {
  const InsertSong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController _titleController = TextEditingController();
    TextEditingController _artistController = TextEditingController();
    TextEditingController _releaseYearController = TextEditingController();
    TextEditingController _durationController = TextEditingController();
    TextEditingController _coverURLController = TextEditingController();
    TextEditingController _countryController = TextEditingController();
    TextEditingController _recordingHouseController = TextEditingController();
    TextEditingController _songURLController = TextEditingController();
    TextEditingController _albumController = TextEditingController();
    TextEditingController _languageController = TextEditingController();
    TextEditingController _genreController = TextEditingController();
    // TextEditingController _ratingController = TextEditingController();
    // TextEditingController _reviewController = TextEditingController();
    final _key = GlobalKey<FormState>();
    return Scaffold(
      appBar: PreferredSize(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF00C854), Color(0xFF00C853)],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight),
            ),
            child: const Center(
              child: Text(
                'Insert Song',
                style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          preferredSize: Size(MediaQuery.of(context).size.width, 100)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 120,
            ),
            Form(
              key: _key,
              child: Center(
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                          controller: _titleController,
                          cursorColor: Colors.green,
                          validator: RequiredValidator(
                            errorText: 'Song Name is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Song Name',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                          controller: _artistController,
                          cursorColor: Colors.green,
                          validator: RequiredValidator(
                            errorText: "Artist's Name is required ",
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: "Artist's name",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                          controller: _releaseYearController,
                          cursorColor: Colors.green,
                          validator: RequiredValidator(
                            errorText: 'Release Year is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Release Year',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                          controller: _durationController,
                          cursorColor: Colors.green,
                          validator: RequiredValidator(
                            errorText: 'Song Duration is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Song Duration',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                          controller: _coverURLController,
                          cursorColor: Colors.red,
                          validator: RequiredValidator(
                            errorText: 'Poster URL is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Poster URL',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                          controller: _countryController,
                          cursorColor: Colors.green,
                          validator: RequiredValidator(
                            errorText: 'Country is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Country',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                          controller: _recordingHouseController,
                          cursorColor: Colors.green,
                          validator: RequiredValidator(
                            errorText: 'recording house is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Recording House',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                          controller: _songURLController,
                          cursorColor: Colors.green,
                          validator: RequiredValidator(
                            errorText: 'Song URL is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Song URL',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                          controller: _albumController,
                          cursorColor: Colors.green,
                          validator: RequiredValidator(
                            errorText: 'Album is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Album',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                          controller: _languageController,
                          cursorColor: Colors.green,
                          validator: RequiredValidator(
                            errorText: "Song's Language is required",
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Language',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                          controller: _genreController,
                          cursorColor: Colors.green,
                          validator: RequiredValidator(
                            errorText: 'Genre is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Genre',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(14),
                    //   ),
                    //   child: SizedBox(
                    //     width: 600,
                    //     child: TextFormField(
                    //       controller: _ratingController,
                    //       cursorColor: Colors.green,
                    //       validator: RequiredValidator(
                    //         errorText: 'Rating required',
                    //       ),
                    //       decoration: inputDecoration.copyWith(
                    //         labelText: 'Song rating',
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 40,
                    // ),
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(14),
                    //   ),
                    //   child: SizedBox(
                    //     width: 600,
                    //     child: TextFormField(
                    //       controller: _reviewController,
                    //       cursorColor: Colors.green,
                    //       validator: RequiredValidator(
                    //         errorText: 'song review is required',
                    //       ),
                    //       decoration: inputDecoration.copyWith(
                    //         labelText: 'song review',
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
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
                  height: 50,
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      Database().addSong(
                        _titleController.text,
                        _artistController.text,
                        _releaseYearController.text,
                        _durationController.text,
                        _coverURLController.text,
                        _countryController.text,
                        _recordingHouseController.text,
                        _songURLController.text,
                        _albumController.text,
                        _languageController.text,
                        _genreController.text,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          elevation: 10,
                          backgroundColor: Colors.green,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          content: Text('Song ' +
                              _titleController.text +
                              ' inserted to the database'),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            )
            /* MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home_page');
                  },
                  child: const Text(
                    'Bypass',
                  ),
                ), */
          ],
        ),
      ),
    );
  }
}
