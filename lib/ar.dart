import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import 'package:visualo/chooseShape.dart';

class AR extends StatefulWidget {
  List<String> shapes;
  AR({
    Key? key,
    required this.shapes,
  }) : super(key: key);

  @override
  _ARState createState() => _ARState();
}

class _ARState extends State<AR> {
   late ArCoreController arCoreController;
_onArCoreViewCreated(ArCoreController _arCoreController){
    arCoreController = _arCoreController;
    if(widget.shapes.contains("Sphere"))
    _addSphere(arCoreController);
    if(widget.shapes.contains("Cube"))
    _addCube(arCoreController);
    if(widget.shapes.contains("Cylinder"))
    _addCylinder(arCoreController);
  }
_addSphere(ArCoreController _arCoreController) {
    final material = ArCoreMaterial(color: Colors.yellow, );
    final sphere = ArCoreSphere(materials: [material], radius: 0.16,);
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(
          0, -0.3, -1
      ),
    );
_arCoreController.addArCoreNode(node);
  }
_addCylinder(ArCoreController _arCoreController) {
    final material = ArCoreMaterial(color: Colors.redAccent, reflectance: 1);
    final cylinder = 
    ArCoreCylinder(materials: [material], radius: 0.4,
      height: 0.15,);
    final node = ArCoreNode(
      shape: cylinder,
      position: vector.Vector3(
          -0.3, -1, -1.0
      ),
    );
_arCoreController.addArCoreNode(node);
  }
  //_addSphere(ArCoreController _arCoreController) {
//     final material = ArCoreMaterial(color: Colors.yellow, );
//     final sphere = ArCoreSphere(materials: [material], radius: 0.16,);
//     final node = ArCoreNode(
//       shape: sphere,
//       position: vector.Vector3(
//           0, -0.3, -1
//       ),
//     );
// _arCoreController.addArCoreNode(node);
//   }
// _addCylinder(ArCoreController _arCoreController) {
//     final material = ArCoreMaterial(color: Colors.redAccent, reflectance: 1);
//     final cylinder = 
//     ArCoreCylinder(materials: [material], radius: 0.4,
//       height: 0.15,);
//     final node = ArCoreNode(
//       shape: cylinder,
//       position: vector.Vector3(
//           -0.3, -1, -1.0
//       ),
//     );
// _arCoreController.addArCoreNode(node);
//   }
_addCube(ArCoreController _arCoreController) {
    final material = ArCoreMaterial(color: Colors.black, metallic: 1);
    final cube = ArCoreCube(materials: [material], size: vector.Vector3(0.3, 0.3, 0.3));
    final node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(
          0.3, -1, -1
      ),
    );
_arCoreController.addArCoreNode(node);
  }
 

@override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AR View'),
          backgroundColor: Colors.teal,
        ),
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
        ),
    );
  }
}