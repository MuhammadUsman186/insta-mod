import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_mod/providers/user_provider.dart';
import 'package:instagram_mod/responsive/mobile_screen_layout.dart';
import 'package:instagram_mod/responsive/web_screen_layout.dart';
import 'package:instagram_mod/utils/colors.dart';
import 'package:instagram_mod/responsive/responsive_screen_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_mod/screen/login_screen.dart';
import 'package:instagram_mod/screen/sign_up.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'IzaSyAU3MU03L_bYVM5d8VI-uMr4v4WpCv0WwU',
            appId: '1:678604585990:web:50a0850f36f3bbe40d9787',
            messagingSenderId: '678604585990',
            projectId: 'insta-mod-65956'));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const LoginScreen();
          }),
        ),
      ),
    );
  }
}
