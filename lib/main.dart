import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:visualo/chooseShape.dart';
import 'package:visualo/select_cat.dart';

import 'app.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart'
    show ArCoreController;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('ARCORE IS AVAILABLE?');
  print(await ArCoreController.checkArCoreAvailability());
  print('\nAR SERVICES INSTALLED?');
  print(await ArCoreController.checkIsArCoreInstalled());
  //runApp(App());
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
@override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
 
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.poppinsTextTheme(
      Theme.of(context).textTheme,
      ),
      ),
      home: SplashScreenPage(),
     
    );
  }
  // void _changeSelection({required bool enable, required int index}) {
  //   _selectionMode = enable;
  //   _selectedIndexList.add(index);
  //   if (index == -1) {
  //     _selectedIndexList.clear();
  //   }
  // }

}
class SplashScreenPage extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    
    return Center(
      child: SplashScreen(  
        seconds: 4,  
        navigateAfterSeconds: new SelectCat(),  
        backgroundColor: Colors.white,   
        image: new Image.asset(  
            'assets/logo.png'  
            // onLongPress: () {
            //   setState(() {
            //     _changeSelection(enable: false, index: -1);
            //   });
            // },
        ),  
        loadingText: Text("Loading"),  
        photoSize: 200.0,  
        loaderColor: Colors.black,  
      ),
    );  
  }  
}  
