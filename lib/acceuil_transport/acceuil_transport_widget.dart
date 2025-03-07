import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'acceuil_transport_model.dart';
export 'acceuil_transport_model.dart';

class AcceuilTransportWidget extends StatefulWidget {
  const AcceuilTransportWidget({super.key});

  static String routeName = 'acceuilTransport';
  static String routePath = '/acceuilTransport';

  @override
  State<AcceuilTransportWidget> createState() => _AcceuilTransportWidgetState();
}

class _AcceuilTransportWidgetState extends State<AcceuilTransportWidget> {
  late AcceuilTransportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcceuilTransportModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
