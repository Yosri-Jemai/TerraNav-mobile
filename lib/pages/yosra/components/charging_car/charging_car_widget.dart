import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'charging_car_model.dart';
export 'charging_car_model.dart';

class ChargingCarWidget extends StatefulWidget {
  const ChargingCarWidget({super.key});

  @override
  State<ChargingCarWidget> createState() => _ChargingCarWidgetState();
}

class _ChargingCarWidgetState extends State<ChargingCarWidget> {
  late ChargingCarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChargingCarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
