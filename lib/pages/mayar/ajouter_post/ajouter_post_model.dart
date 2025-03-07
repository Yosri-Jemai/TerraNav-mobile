import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ajouter_post_widget.dart' show AjouterPostWidget;
import 'package:flutter/material.dart';

class AjouterPostModel extends FlutterFlowModel<AjouterPostWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Upload Image to imgbb)] action in IconButton widget.
  ApiCallResponse? apiRespone;
  // State field(s) for Pos widget.
  FocusNode? posFocusNode;
  TextEditingController? posTextController;
  String? Function(BuildContext, String?)? posTextControllerValidator;
  String? _posTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pmp5j58a' /* veuillez remplir ce champ */,
      );
    }

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        'e1jqk9od' /* 10 */,
      );
    }
    if (val.length > 1000) {
      return FFLocalizations.of(context).getText(
        'gy1nsp9z' /* 1000 */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (bad words)] action in Button widget.
  ApiCallResponse? result;

  @override
  void initState(BuildContext context) {
    posTextControllerValidator = _posTextControllerValidator;
  }

  @override
  void dispose() {
    posFocusNode?.dispose();
    posTextController?.dispose();
  }
}
