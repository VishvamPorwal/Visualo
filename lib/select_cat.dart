import 'package:flutter/material.dart';
import 'package:visualo/chooseShape.dart';
import 'package:visualo/home.dart';

class SelectCat extends StatelessWidget {
  SelectCat({ Key? key }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Choose Category : ", style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _createBody(),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 120, 8, 2),
                child: Container(
                  height: 140,
                  width: 140,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/logo.png"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
Widget _createBody() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
        
    ),
    
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return getGridTile(index, context);
      },
      padding: const EdgeInsets.all(4.0),
    );
  }

  GridTile getGridTile(int index, BuildContext context) {
    List<String> catList = [];
  catList.add("Basic Shapes",);
  catList.add("dynamic");
    //if (_selectionMode) {
      return GridTile(
         
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.tealAccent, width: 3.0), borderRadius : BorderRadius.circular(18)),
            child: InkWell(
              onTap: (){
                if(index==1){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                }
                else{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChooseShape()));
                }
              },
              borderRadius: BorderRadius.circular(16.0),
              child: Center(child: Text(catList[index],style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))
              // child: Image.asset(
              //   _imageList[index],
              //   fit: BoxFit.cover,
                
              // ),
            ),
          )
      );
  }