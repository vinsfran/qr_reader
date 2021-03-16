import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/providers/scan_list_provider.dart';

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => ListTile(
        leading: _getIcono(context, scans[i].tipo),
        title: Text(scans[i].valor),
        subtitle: Text(scans[i].id.toString()),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        ),
        onTap: () => print(scans[i].id),
      ),
    );
  }

  Widget _getIcono(BuildContext context, String tipo) {
    IconData icono = Icons.map;
    if (tipo == 'http') {
      icono = Icons.home_outlined;
    }
    return Icon(
      icono,
      color: Theme.of(context).primaryColor,
    );
  }
}
