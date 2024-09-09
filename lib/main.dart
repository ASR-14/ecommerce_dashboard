import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:seller_app/views/auth_screen/login_screen.dart';
import 'const/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: appname,
        home: LoginScreen(),
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.transparent, elevation: 0.0)));
  }
}
