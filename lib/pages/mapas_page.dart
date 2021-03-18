import 'package:flutter/material.dart';

import 'package:qr_reader/widgets/scan_tiles_widget.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTilesWidget(tipo: 'geo');
  }
}
