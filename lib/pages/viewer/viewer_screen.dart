import 'package:file_picker_galery/pages/viewer/viewer_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ViewerScreen extends StatelessWidget {
  const ViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewerProvider>(
      create: (_) => ViewerProvider(),
      lazy: false,
    );
  }
}
