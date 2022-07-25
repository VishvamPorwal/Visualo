import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visualo/ar.dart';

class ChooseShape extends StatefulWidget {
  const ChooseShape({ Key? key }) : super(key: key);

  @override
  _ChooseShapeState createState() => _ChooseShapeState();
}

class _ChooseShapeState extends State<ChooseShape> {
 List<String> _imageList = [];
 List<String> shapeList = [];
 List<int> _selectedIndexList = [];
  //bool _selectionMode = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Choose Shapes", style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _createBody(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("You can select multiple shapes at a time", style : TextStyle(fontSize: 15)),
              ),
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
      bottomNavigationBar : _selectedIndexList.isEmpty? null: 
      SizedBox(height : 60,child: ElevatedButton(
        onPressed:(){
          if(_selectedIndexList.contains(0)) shapeList.add("Cube");
          if(_selectedIndexList.contains(1)) shapeList.add("Cylinder");
          if(_selectedIndexList.contains(2)) shapeList.add("Sphere");
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AR(shapes: shapeList))).then((value)=>setState((){
            shapeList.clear();
            _selectedIndexList.clear();
          }));
        }, 
        child: Text("Next", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)))
    );
  }

  @override
  void initState() {
    super.initState();

    _imageList.add('assets/cube.png');
    _imageList.add('assets/cylinder.png');
    _imageList.add('assets/sphere.png');

  
  }

  // void _changeSelection({required bool enable, required int index}) {
  //   _selectionMode = enable;
  //   _selectedIndexList.add(index);
  //   if (index == -1) {
  //     _selectedIndexList.clear();
  //   }
  // }

  Widget _createBody() {
    return StaggeredGridView.countBuilder(
      shrinkWrap : true,
      crossAxisCount: 4,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      primary: false,
      itemCount: _imageList.length,
      itemBuilder: (BuildContext context, int index) {
        return getGridTile(index);
      },
      staggeredTileBuilder: (int index) => StaggeredTile.count(2, index.isEven ? 2 : 4),
      padding: const EdgeInsets.all(4.0),
    );
  }

  GridTile getGridTile(int index) {
    //if (_selectionMode) {
      return GridTile(
          header: GridTileBar(
            leading: Icon(
              _selectedIndexList.contains(index) ? Icons.check_circle_outline : null,
              color: _selectedIndexList.contains(index) ? Colors.green : null,
              size: 30,
            ),
            
          ),
          child: GestureDetector(
            child: Container(
              decoration:  _selectedIndexList.contains(index) ? BoxDecoration(border: Border.all(color: Colors.tealAccent, width: 10.0), borderRadius : BorderRadius.circular(18)):
                          BoxDecoration(border: Border.all(color: Colors.tealAccent, width: 3.0), borderRadius : BorderRadius.circular(18)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  _imageList[index],
                  fit: BoxFit.cover,
                  
                ),
              ),
            ),
            // onLongPress: () {
            //   setState(() {
            //     _changeSelection(enable: false, index: -1);
            //   });
            // },
            onTap: () {
              setState(() {
                if (_selectedIndexList.contains(index)) {
                  _selectedIndexList.remove(index);
                } else {
                  _selectedIndexList.add(index);
                }
              });
            },
          ));
    //} else {
    //   return GridTile(
    //     child: InkResponse(
    //       child: ClipRRect(
    //         borderRadius: BorderRadius.circular(16.0),
    //         child: Image.network(
    //           _imageList[index],
    //           fit: BoxFit.cover,
              
    //         ),
    //       ),
    //       onTap:  () {
    //         setState(() {
    //           _changeSelection(enable: true, index: index);
    //         });
    //       },
    //     ),
    //   );
    // }
  }
}