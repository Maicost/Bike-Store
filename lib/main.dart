import 'package:flutter/material.dart';
import 'package:gerenciar_produtos2/app/view/main_page.dart';
import 'package:gerenciar_produtos2/app/view/pages/user_register_widget.dart';

import 'app/view/edicao_produtos_widget.dart';
import 'app/view/login_widget.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerenciamento de Produtos',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginWidget(),
        '/mainPage': (context) => MainPage(),
        '/userRegister': (context) => UserRegisterWidget(),
        '/edicaoProdutos': (context) => EdicaoProdutosWidget(),
      },
    );
  }
}
