import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:tmdb/services/user.dart';
import '../constants/input_decoration.dart';
import 'package:get/get.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../services/auth.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _key = GlobalKey<FormState>();
  final _auth = Auth();
  bool isClicked = true;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: PreferredSize(
        child: const SizedBox(
          child: Center(
            child: Text(
              'Login',
              style: TextStyle(fontSize: 30, fontFamily: 'prodSans'),
            ),
          ),
        ),
        preferredSize: Size(width, 90),
      ),
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
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: SizedBox(
                      width: 600,
                      child: TextFormField(
                        controller: _usernameController,
                        cursorColor: Colors.green,
                        validator: RequiredValidator(
                          errorText: 'Username is required',
                        ),
                        decoration: inputDecoration.copyWith(
                          labelText: 'username',
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
                          obscureText: true,
                          controller: _passwordController,
                          validator: RequiredValidator(
                              errorText: 'Password is required'),
                          cursorColor: Colors.green,
                          decoration: inputDecoration.copyWith(
                            labelText: 'password',
                          ),
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.green,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    clipBehavior: Clip.antiAlias,
                    child: MaterialButton(
                      minWidth: 280,
                      height: 42,
                      onPressed: () async {
                        var resp = await _auth.register(
                            _usernameController.text, _passwordController.text);
                        if (resp['status'] == 200) {
                          box.write('uname', _usernameController.text);
                          Navigator.pushReplacementNamed(context, '/home_page');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                resp['msg'],
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Create account',
                        style: TextStyle(fontSize: 12, fontFamily: 'prodSans'),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.green,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    clipBehavior: Clip.antiAlias,
                    child: MaterialButton(
                      minWidth: 120,
                      height: 42,
                      onPressed: () async {
                        //login logic needs to be implemented8
                        if (_key.currentState!.validate()) {
                          var resp = await _auth.login(_usernameController.text,
                              _passwordController.text);
                          // print(resp);
                          if (resp['status'] == 200) {
                            box.write('uname', _usernameController.text);
                            Navigator.pushReplacementNamed(
                                context, '/home_page');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  resp['msg'],
                                ),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 12, fontFamily: 'prodSans'),
                      ),
                    ),
                  ),
                  // Card(
                  //   color: Colors.red,
                  //   elevation: 10,
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(14)),
                  //   child: MaterialButton(
                  //     minWidth: 200,
                  //     height: 42,
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, '/admin_login');
                  //     },
                  //     child: const Text(
                  //       'Admin login',
                  //       style: TextStyle(fontSize: 12, fontFamily: 'geomet'),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: width / 1000.0, top: 50),
                child: const Text(
                  'TMDB.',
                  style: TextStyle(
                      fontSize: 70,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
