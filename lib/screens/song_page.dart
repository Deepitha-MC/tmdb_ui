import 'dart:io';
import 'dart:ui';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:tmdb/screens/review_page.dart';
import 'package:tmdb/services/database.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tmdb/constants/input_decoration.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

void htmlOpenLink(String url) {
//  String url = 'https://flutter.dev';
  html.window.open(url, '_blank');
}

// ignore: must_be_immutable
class SongPage extends StatefulWidget {
  Map<String, dynamic> data;

  SongPage({Key? key, required this.data}) : super(key: key);
  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController review_descController = TextEditingController();
    int rating = 10;
    final box = GetStorage();
    return Scaffold(
      body: SingleChildScrollView(
          child: FutureBuilder(
              future: Database().getAllData(widget.data['songID'] as int),
              builder: (context, AsyncSnapshot<dynamic> snap) {
                if (snap.connectionState == ConnectionState.done) {
                  // rating = int.parse(snap.data['ratings']);

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //  SizedBox(height: height / 18),
                      Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.network(
                              snap.data['coverURL'],
                              fit: BoxFit.cover,
                              width: width,
                              height: height,
                            ),

                            ClipRRect(
                              // Clip it cleanly.
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  width: width,
                                  height: height,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                        Colors.black.withOpacity(0.3),
                                        Colors.black.withOpacity(0.9),
                                      ])),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            Positioned(
                              left: width / 20,
                              child: Hero(
                                tag: snap.data['songID'],
                                child: Card(
                                  elevation: 10,
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.network(
                                    snap.data['coverURL'],
                                    width: 340,
                                    height: 520,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/images/pp,840x830-pad,1000x1000,f8f8f8.u2.jpg',
                                        width: 500,
                                        height: 500,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 100,
                              left: width / 2.5,
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                      text: snap.data['songName'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'prodSans',
                                        fontSize: snap.data['songName']
                                                    .toString()
                                                    .length >
                                                28
                                            ? 20
                                            : 40,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '       |       ' +
                                              snap.data['duration'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 180,
                              left: width / 2.5,
                              child: Container(
                                color: Colors.transparent,
                                width: width / 1,
                                child: RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'prodSans'),
                                      children: [
                                        const TextSpan(
                                          text: 'Released on :  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18),
                                        ),
                                        TextSpan(
                                          text: snap.data['releaseYear']
                                                      .toString()
                                                  //     .split('T')[0] ==
                                                  ==
                                                  '0000-00-00'
                                              ? '\n'
                                              : snap.data['releaseYear']
                                                  .toString(),
                                          // .split('T')[0] +
                                          // '\n',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18,
                                            fontFamily: 'prodSans',
                                          ),
                                        ),
                                        const TextSpan(
                                          text: '\nArtist :  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18),
                                        ),
                                        TextSpan(
                                          text: snap.data['artist'] + '\n',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18,
                                            fontFamily: 'prodSans',
                                          ),
                                        ),
                                        const TextSpan(
                                          text: 'Album :  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18),
                                        ),
                                        TextSpan(
                                          text: snap.data['album'] + '\n',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18,
                                            fontFamily: 'prodSans',
                                          ),
                                        ),
                                        const TextSpan(
                                          text: 'RecordingHouse :  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18),
                                        ),
                                        TextSpan(
                                          text: snap.data['recordingHouse'] +
                                              '\n',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18,
                                            fontFamily: 'prodSans',
                                          ),
                                        ),
                                        const TextSpan(
                                          text: 'Language :  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18),
                                        ),
                                        TextSpan(
                                          text: snap.data['lang'] + '\n',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18,
                                            fontFamily: 'prodSans',
                                          ),
                                        ),
                                        const TextSpan(
                                          text: 'Genre :  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18),
                                        ),
                                        TextSpan(
                                          text: snap.data['genre'] + '\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'prodSans',
                                              fontSize: 18),
                                        ),
                                        const TextSpan(
                                          text: 'Where to listen :  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18),
                                        ),
                                        TextSpan(
                                          text:
                                              snap.data['songURL'].toString() +
                                                  '\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'prodSans',
                                              fontSize: 18),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            // Positioned(
                            //   top: 286,
                            //   left: width / 2.0,
                            //   child: Html(
                            //       data:
                            //           // snap.data['songURL']
                            //           "<a href={snap.data['songURL']}>youtube</a>"),
                            // ),

                            Positioned(
                                top: 411,
                                left: 1093,
                                child: Center(
                                  child: Html(
                                      data: ''' <iframe width="400" height="300"
src="${snap.data['songURL'].toString().replaceAll('watch', 'embed').replaceAll('?v=', '/')}">
</iframe> '''),
                                )),
                            Positioned(
                              top: 560,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Rating : ' +
                                        (snap.data['ratings']).toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              top: 620,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      clipBehavior: Clip.antiAlias,
                                      child: MaterialButton(
                                        color: Colors.green,
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  title: const Center(
                                                      child: Text('Rating')),
                                                  actions: [
                                                    RatingBar.builder(
                                                      initialRating:
                                                          double.parse(snap
                                                              .data['ratings']
                                                              .toStringAsFixed(
                                                                  0)),
                                                      minRating: 1,
                                                      maxRating: 10,
                                                      direction:
                                                          Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 10,
                                                      itemPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              horizontal: 4.0),
                                                      itemBuilder:
                                                          (context, _) =>
                                                              const Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                      ),
                                                      onRatingUpdate: (rate) {
                                                        rating = rate as int;
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: 100,
                                                      width: 200,
                                                      child: TextField(
                                                        maxLines: 4,
                                                        cursorColor:
                                                            Colors.white,
                                                        controller:
                                                            review_descController,
                                                        decoration:
                                                            inputDecoration
                                                                .copyWith(
                                                          labelText:
                                                              'Description',
                                                        ),
                                                      ),
                                                    ),
                                                    Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          10,
                                                        ),
                                                      ),
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      child: MaterialButton(
                                                        color: Colors.green,
                                                        onPressed: () {
                                                          Database().addRating(
                                                              widget.data[
                                                                  'songID'],
                                                              box.read('uname'),
                                                              rating,
                                                              review_descController
                                                                  .text);
                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {});
                                                        },
                                                        child: const Text(
                                                            'Submit'),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              });
                                        },
                                        child: const Text('Add rating/review'),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      clipBehavior: Clip.antiAlias,
                                      child: MaterialButton(
                                        color: Colors.green,
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return ReviewPage(
                                              songID: widget.data['songID'],
                                            );
                                          }));
                                        },
                                        child: const Text('review'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //back button
                            Positioned(
                              top: 20,
                              left: 20,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      /*   Text(
              widget.data['title'],
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.black,
                    )
                  ]),
              width: MediaQuery.of(context).size.width / 1.1,
              height: 300,
              child: Center(child: Text(widget.data.toString())),
            ), */
                    ],
                  );
                } else {
                  return Center(
                    child: SizedBox(
                      height: 500,
                      width: 500,
                      child: Lottie.network(
                          'https://assets9.lottiefiles.com/packages/lf20_lrjha2vi.json'),
                    ),
                  );
                }
              })),
    );
  }
}
