import 'package:flutter/material.dart';
import 'package:validation/screens/dashboardpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  final _key=GlobalKey<FormState>();


  TextEditingController tec_username=new TextEditingController();
  TextEditingController tec_password=new TextEditingController();
  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body:Padding(

        padding: const EdgeInsets.all(15),
      child:
      Form(



        key: _key,
      child
      :Column(

        children: [
          TextFormField(

            controller: tec_username,
            validator: (val)
              {
                if(val?.length==0)
                  {
                    return "Username empty";
                  }
                return null;
              },
            decoration: InputDecoration(
              labelText: "Enter username",
              icon: Icon(Icons.email),
              )
            ),
          TextFormField(
            controller: tec_password,
            validator: (val)
              {
                if(val!.length>6)
                  {
                    return "password must 6 digit";
                  }
              },
              decoration: InputDecoration(
                  labelText: "Enter Your Password")
          ),


          ElevatedButton(onPressed: ()
              {

                if(_key.currentState!.validate())
                  {
                   // print(tec_username.text);


                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Dashboardpage(tec_username.text,tec_password.text)));


                    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Validation Success"),));
                  }else
                    {
                      print("not valid");
                    }
              }, child: Text("submit"))
        ],)
      )
      //This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}
