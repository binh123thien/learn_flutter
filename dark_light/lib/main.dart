import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => DarkModeModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<DarkModeModel>(context).isDarkModeEnabled
          ? ThemeData.dark()
          : ThemeData.light(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultiProvider Demo'),
      ),
      body: Center(
        child: Switch.adaptive(
          value: Provider.of<DarkModeModel>(context)
              .isDarkModeEnabled, // lấy giá trị isDarkModeEnabled từ hàm with ChangeNotificer

          //khi nhấn nút: thay đổi giá trị value
          onChanged: (value) {
            Provider.of<DarkModeModel>(context, listen: false)
                .setDarkModeEnabled(value);
          },
        ),
      ),
    );
  }
}

class DarkModeModel with ChangeNotifier {
  bool _isDarkModeEnabled = true; //khởi tạo giá trị ban đầu khi khởi chạy app

  bool get isDarkModeEnabled =>
      _isDarkModeEnabled; // lấy giá trị từ bên ngoài hàm

//khi ng dùng thao tác với switch
  void setDarkModeEnabled(bool A) {
    //cập nhập giá trị của biến
    _isDarkModeEnabled = A;
    notifyListeners();
  }
}
