import 'package:file_picker_galery/pages/main/main_provider.dart';
import 'package:file_picker_galery/pages/main/main_view.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainProvider>(
      create: (_) => MainProvider(),
      lazy: false,
      child: const MainView(),
    );
  }
}
