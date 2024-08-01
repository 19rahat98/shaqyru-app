import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shaqyru_app/routing/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shaqyru_app/routing/route_names.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyC-zRvPWPbQe426geezpQLTH_ORnj--Ptk",
      appId: "1:894828553443:web:2ed8766b951f01221b51d6",
      authDomain: "shaqyru-app.firebaseapp.com",
      projectId: "shaqyru-app",
      storageBucket: "shaqyru-app.appspot.com",
      messagingSenderId: "894828553443",
      databaseURL:
          'https://shaqyru-app-default-rtdb.europe-west1.firebasedatabase.app',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(800, 1200),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Шақыру билеті',
          initialRoute: HomeRoute,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          //routes: routes,
          onGenerateRoute: generateRoute,
        );
      },
    );
  }
}
