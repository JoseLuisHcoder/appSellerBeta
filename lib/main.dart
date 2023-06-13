import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor/data/themes.dart';
import 'package:vendedor/domain/blocs/auth/auth_bloc.dart';

import 'package:vendedor/presentation/screens/base.dart';
import 'package:vendedor/presentation/screens/login/loading_page.dart';
import 'package:vendedor/presentation/screens/visits/widgets/timer_provider.dart';

import 'domain/blocs/auth/auth_bloc.dart';
import 'domain/blocs/cart/cart_bloc.dart';
import 'domain/blocs/product/product_bloc.dart';
import 'domain/blocs/promotion/promotion_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

void main() async {
  final timerProvider = TimerProvider();
  runApp(MyApp(timerProvider: timerProvider));
}

class MyApp extends StatelessWidget {
  final TimerProvider timerProvider;
  const MyApp({Key? key, required this.timerProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add(CheckLoginEvent())),
        ChangeNotifierProvider.value(
          value:
              TimerProvider(), // Aquí creas una única instancia de TimerProvider
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce',
        theme: solarTheme,
        home: LoadingPage(),
      ),
    );
  }
}
