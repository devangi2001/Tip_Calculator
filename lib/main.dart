import "package:flutter/material.dart";

void main()  {
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip calculator',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue ,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:HomePage("Tip Calculator"),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage(this.title);
  String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController tipvalue = TextEditingController();
 bool _secureText = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("TIP CALCULATOR"),),
        body: Center(
           child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" ENTER AMOUNT", style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20),),
                    TextField(controller: tipvalue,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Write here",
                            labelText: " AMOUNT ",
                            labelStyle: TextStyle(
                              fontSize: 25,
                              color: Colors.black),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon :  Icon(_secureText ? Icons.remove_red_eye:Icons.calculate_rounded),
                              onPressed: (){
                                setState(() {
                                  _secureText = !_secureText;
                                });
                                },
                            )
                        ),
                    ),
                    ElevatedButton(
                      child: Text("NEXT"),
                      onPressed: ()
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Secondscreen(value: tipvalue.text)));},
                    ),
                  ]
              ),
               )
        ));
  }
}


class Secondscreen extends StatefulWidget{
  String value;
  Secondscreen({this.value});

  @override
  _SecondscreenState createState() => _SecondscreenState(value);
}

class _SecondscreenState extends State<Secondscreen>{
  _SecondscreenState(this.tipvalue);
  String tipvalue;
  double _percentage;
  double _tipp;

  void _calculation(){
    setState(() {  _percentage = ((double.parse(tipvalue) * double.parse(perc.text))/100);
    _tipp = (double.parse(tipvalue) + _percentage);

    print(tipvalue);
    print(_tipp);
    });

  }

  final TextEditingController perc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tip calculator"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: perc,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: ' ENTER PERCENTAGE'),),
              ElevatedButton(
                onPressed: (_calculation),
                child: Text('CALCULATE'),),
              Text('Tip entered: $tipvalue'),
              Text('Total Bill: $_tipp'),
            ],
          ),
        ),
      ),
    );
  }
}
