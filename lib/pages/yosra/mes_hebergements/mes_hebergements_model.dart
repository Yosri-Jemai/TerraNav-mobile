import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mes_hebergements_widget.dart' show MesHebergementsWidget;
import 'package:flutter/material.dart';

class MesHebergementsModel extends FlutterFlowModel<MesHebergementsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
