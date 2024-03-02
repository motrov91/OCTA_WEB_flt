// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'ui/pages/home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  final delegate = MyRouterDelegate(
    pages: [
      MyPage(
        (data) => HomePage(), 
        path: '/'
      ),
      // MyPage((data) => ProductsPage(
      //   id: int.parse(
      //     data['id']!
      //   ),
      //   path:'/productsPage' 
      // ))
    ]
  );


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true
      ),
      routerDelegate: delegate,
      routeInformationParser: MyRouteInformationParser(),
    );
  }
}

class MyPage{
  final String path;
  final Widget Function(Map<String, String> data) builder;

  MyPage(this.builder, { required this.path });
}

class MyRouterDelegate extends RouterDelegate<Uri> 
  with ChangeNotifier, PopNavigatorRouterDelegateMixin{

    final List<MyPage> pages;

    late List<Page> _navigatorPages;

  MyRouterDelegate({
    required this.pages,
  }){
    final initialPage = pages.firstWhere(
      (element) => element.path == '/');
    
    _navigatorPages = [
      MaterialPage(
        name: '/',
        child: initialPage.builder(
          {}
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: _navigatorPages,
      onPopPage: (route, result) {
        return route.didPop(result);
      },
    );
  }

  @override
  Future<void> setNewRoutePath(Uri configuration) async{
    final path = configuration.path;
    final data = <String, String>{};
    
    final index = pages.indexWhere(
      (e){
        if(e.path == path){
          return true;
        }

        if(e.path.contains('/:')){
          final lastIndex = e.path.lastIndexOf('/:');
          final substring = e.path.substring(
            0,
            lastIndex,
          );
          if(path.startsWith(substring)){
            final key = e.path.substring(lastIndex + 1, e.path.length);
            final value = path.substring(lastIndex + 1, path.length);
            
            data[key] = value;

            return true;
          }
        }
        return false;
      });

    if(index != -1){
      _navigatorPages.add(
        MaterialPage(
          child: pages[index].builder(data),
      ));
      notifyListeners();
    }
    //print('CONFIGURATION ${configuration.path}');
    //print('CONFIGURATION ${configuration.queryParameters}');
  }
  
  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();
}

class MyRouteInformationParser extends RouteInformationParser<Uri> {
  @override
  Future<Uri> parseRouteInformation(RouteInformation routeInformation) {
    final String routeUri = routeInformation.uri.toString();
    return Future.value(Uri.parse(routeUri));
  }
}