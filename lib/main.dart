import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:seller_app/views/auth_screen/login_screen.dart';
import 'package:seller_app/views/home_screen/home.dart';
import 'const/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    checkUser();
    super.initState();
  }

  var isloggedin = false;
  checkUser() async {
    auth.authStateChanges().listen(
      (User? user) {
        if (user == null && mounted) {
          isloggedin = false;
        } else {
          isloggedin = true;
        }
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: appname,
        home: isloggedin ? const Home() : const LoginScreen(),
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent, elevation: 0.0)));
  }
}
