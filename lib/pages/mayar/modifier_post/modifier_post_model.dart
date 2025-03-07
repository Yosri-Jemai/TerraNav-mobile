import '/flutter_flow/flutter_flow_util.dart';
import 'modifier_post_widget.dart' show ModifierPostWidget;
import 'package:flutter/material.dart';

class ModifierPostModel extends FlutterFlowModel<ModifierPostWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'u8mt6c7d' /* veuillez remplir ce champ */,
      );
    }

    if (val.length < 20) {
      return FFLocalizations.of(context).getText(
        'n4bo18o8' /* 19 */,
      );
    }
    if (val.length > 100) {
      return FFLocalizations.of(context).getText(
        'jq35wj2g' /* 101 */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
