import 'package:flutter/material.dart';
void main(){
  runApp(myapp());
}
class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  Stream<String>evenOrOdd(){
    return Stream.periodic(Duration(seconds: 2),(computationCount) => "$computationCount",);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Center(child: Text("COUNTER")),backgroundColor: Colors.blueGrey),backgroundColor: Colors.grey,
      body: Center(
        child: Container(color: Colors.blueGrey,width: 300,height: 300,
          child: StreamBuilder(
            builder: (context, snapshot) {
              if(snapshot.hasData){
                var data = snapshot.data;
                return Center(child: Text("$data",style: TextStyle(fontSize: 30),));
              }
              else{
                return Center(child: CircularProgressIndicator(),);
              }
            },
            stream: evenOrOdd(),
          ),
        ),
      ),
    );
  }
}

