import 'package:flutter/material.dart';
import 'package:post_api/network/ServiceApi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  loginData() async {
    var login = await ApiClient().login(_email.text, _password.text);
    debugPrint(login + " login successful");
  }

  registerData() async {
    var register = await ApiClient().register(_email.text, _password.text);
    debugPrint(register + " register successful");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("post Api"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your Email ",
                      labelText: "Email"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your Password ",
                      labelText: "Password"),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    loginData();
                  },
                  child: Text("Login")),
              ElevatedButton(
                  onPressed: () {
                    registerData();
                  },
                  child: Text("Register"))
            ],
          ),
        ),
      ),
    );
  }
}
