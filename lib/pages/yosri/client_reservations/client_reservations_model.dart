import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'client_reservations_widget.dart' show ClientReservationsWidget;
import 'package:flutter/material.dart';

class ClientReservationsModel
    extends FlutterFlowModel<ClientReservationsWidget> {
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
