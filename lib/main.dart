import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop/pages/cart_page.dart';
import 'package:shoe_shop/pages/checkout_page.dart';
import 'package:shoe_shop/pages/checout_success_page.dart';
import 'package:shoe_shop/pages/edit_profile_page.dart';
import 'package:shoe_shop/pages/home/main_page.dart';
import 'package:shoe_shop/pages/sign_in_page.dart';
import 'package:shoe_shop/pages/sign_up_page.dart';
import 'package:shoe_shop/pages/splash_page.dart';
import 'package:shoe_shop/providers/auth_provider.dart';
import 'package:shoe_shop/providers/cart_provider.dart';
import 'package:shoe_shop/providers/page_provider.dart';
import 'package:shoe_shop/providers/product_provider.dart';
import 'package:shoe_shop/providers/transaction_provider.dart';
import 'package:shoe_shop/providers/wishlist_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: '',
          appId: '1:43658910612:android:b89c46620851b57d35cd81',
          messagingSenderId: '43658910612',
          projectId: 'shamo-ecommerce'));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/main-page': (context) => MainPage(),
        '/edit-profile': (context) => EditProfilePage(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/checkout-success': (context) => CheckoutSuccessPage(),
      }),
    );
  }
}
