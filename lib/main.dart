import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Login App',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Quicksand'
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF2D3E50),
        elevation: 3,
        title: Text('Login App',
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: SingleChildScrollView(
        child:Padding(
        padding: EdgeInsets.only(top: 8, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:15),
            Text('Login',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 15),
            Text("Email",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),),
           Container(
             width: 365,
             child:  TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan Email',
                focusedBorder: OutlineInputBorder(),
                isDense: true
              ),
            ),),
            SizedBox(height: 15,),
            Text("Password",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),),
            Container(
             width: 365,
             child:  TextField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan Password',
                focusedBorder: OutlineInputBorder(),
                isDense: true,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  }, 
                  icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                  color: Colors.black,),
              ),
            ),),
            SizedBox(height: 15,),
            SizedBox(
              width: 100,
              height: 40,
              child:  ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF2D3E50)
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
              }, 
            child: Text("Masuk",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),)),
            ),
            SizedBox(height: 10,),
            SizedBox(height: 10,),
          ],
        ),)),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Container>myList = List.generate(18, (index) {
    return Container(
      color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255),),
  );
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Quicksand'
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xFF2D3E50),
        elevation: 3,
        title: Text('Grid View',
        style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
      ),
        body: Stack(
          children: [
            GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 10,
          ),
          children: 
            myList,
        ),
        Positioned(
          top: 620,
          left: 300,
          child: Container(
            width: 80,
            height: 80,
            child: FloatingActionButton(
          onPressed: (){
            _displayDialog(context);
          },
          backgroundColor: Color(0xFF2D3E50),
          child: Icon(Icons.info_outline_rounded),
          ),
          ))
          ],
        )
      ),
    );
  }
  Future<Future>_displayDialog(BuildContext context) async{
    return showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Ini adalah aplikasi untuk contoh Grid View'),
        );
      });
  }
}