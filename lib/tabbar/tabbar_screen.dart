import 'package:file_picker_galery/tabbar/tabbar_provider.dart';
import 'package:file_picker_galery/tabbar/tabbar_view.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class TabbarScreen extends StatelessWidget {
  const TabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TabbarProvider>(
      create: (_) => TabbarProvider(),
      lazy: false,
      child: const TabbarView(),
    );
  }
}
