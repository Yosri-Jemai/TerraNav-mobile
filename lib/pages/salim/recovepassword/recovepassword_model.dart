import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'recovepassword_widget.dart' show RecovepasswordWidget;
import 'package:flutter/material.dart';

class RecovepasswordModel extends FlutterFlowModel<RecovepasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailaddress widget.
  FocusNode? emailaddressFocusNode;
  TextEditingController? emailaddressTextController;
  String? Function(BuildContext, String?)? emailaddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailaddressFocusNode?.dispose();
    emailaddressTextController?.dispose();
  }
}
