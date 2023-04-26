import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'business_logic/app_cubit/app_cubit.dart';
import 'view/screens/dash_board_screen.dart';
import 'helper/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: ScreenUtilInit(
          designSize: const Size(392.72727272727275, 781.0909090909091),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'ToDo',
                theme: AppThemes().lightTheme(),
                home: const DashBoard(),
              )),
    );
  }
}
