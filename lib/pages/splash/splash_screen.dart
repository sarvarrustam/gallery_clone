import 'package:file_picker_galery/pages/splash/splash_provider.dart';
import 'package:file_picker_galery/pages/splash/splash_view.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashProvider(),
      lazy: false,
      child: const SplashView(),
    );
  }
}
