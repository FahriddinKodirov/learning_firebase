// import 'package:flutter/material.dart';
// import 'package:products_app/main.dart';
// import 'package:products_app/screen/auth_page/auth_page.dart';
// import 'package:products_app/screen/home/account_page/admin/admin_page.dart';
// import 'package:products_app/screen/home/account_page/admin/categorise/add_categories_screen.dart';
// import 'package:products_app/screen/home/account_page/admin/categorise/all_categories_screen.dart';
// import 'package:products_app/screen/home/account_page/admin/products/add_product_screen.dart';
// import 'package:products_app/screen/home/account_page/admin/products/all_product_screen.dart';
// import 'package:products_app/screen/home/account_page/admin/products/update_product_screen.dart';
// import 'package:products_app/screen/home/product_page.dart/product_page.dart';
// import 'package:products_app/screen/home/search_page/search_page.dart';
// import 'package:products_app/screen/home/tab_bar.dart';
// import 'package:products_app/screen/splash_page/splash_page.dart';
// import 'package:products_app/screen/splash_page/tour_page.dart';

// abstract class MyRoute {
//   static const splashPage = '/splashPage';
//   static const tourPage = '/tourPage';
//   static const mainPage = '/mainPage';
//   static const authPage = '/authPage';
//   static const tabBarPage = '/tabBarPage';
//   static const adminPage = '/adminPage';
//   static const allProductPage = '/allProductPage';
//   static const addProductPage = '/addProductPage';
//   static const updateProductPage = '/updateProductPage';
//   static const allCategoriesPage = '/allCategoriesPage';
//   static const updateCategoriesPage = '/updateCategoriesPage';
//   static const addCategoriesPage = '/addCategoriesPage';
//   static const searchPage = '/searchPage';
//   static const productPage = '/productPage';
  

// }

// class AppRoutes {
//   static Route generatRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case MyRoute.splashPage:
//         return MaterialPageRoute(builder: (_) => const SplashPage());
//       case MyRoute.tourPage:
//         return MaterialPageRoute(builder: (_) => const TourPage());
//       case MyRoute.authPage:
//         return MaterialPageRoute(builder: (_) => const AuthPage());
//       case MyRoute.mainPage:
//         return MaterialPageRoute(builder: (_) => const MainPage());
//       case MyRoute.tabBarPage:
//         return MaterialPageRoute(builder: (_) => const TabBarPage());
//     // ----------- Admin ----- Admin ------ Admin -----------------
//       case MyRoute.adminPage:
//         return MaterialPageRoute(builder: (_) => const AdminPage());
//       case MyRoute.allProductPage:
//         return MaterialPageRoute(builder: (_) => const AllProductPage());
//       case MyRoute.addProductPage:
//         return MaterialPageRoute(builder: (_) =>  AddProductPage());
//       case MyRoute.updateProductPage:
//         final Map args = settings.arguments as Map<String, dynamic>;
//         return MaterialPageRoute(builder: (_) => UpdateProductPage(
//           products: args['product'],
//         ));

//       case MyRoute.allCategoriesPage:
//         return MaterialPageRoute(builder: (_) => const AllCategoriesPage());
//       // case MyRoute.updateCategoriesPage:
//       //   return MaterialPageRoute(builder: (_) => const UpdateCategoriestPage());
//       case MyRoute.addCategoriesPage:
//         return MaterialPageRoute(builder: (_) => const AddCategoriesPage());

//       // --------------- home ------------------
//       case MyRoute.searchPage:
//         return MaterialPageRoute(builder: (_) => const SearchPage());
      
//       // ---------------- product -------------------------
//       case MyRoute.productPage:
//         final Map args = settings.arguments as Map<String, dynamic>;
//         return MaterialPageRoute(builder: (_) => ProductPage(
//          product: args['product']
//         ));
      

//       default:
//         return MaterialPageRoute(builder: (context) => const Scaffold());
//     }
//   }
// }
