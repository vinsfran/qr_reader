import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/custom_navigationbar_widget.dart';
import 'package:qr_reader/widgets/scan_button_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: Center(child: Text('Home page')),
      bottomNavigationBar: CustomNavigationbarWidget(),
      floatingActionButton: ScanButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
