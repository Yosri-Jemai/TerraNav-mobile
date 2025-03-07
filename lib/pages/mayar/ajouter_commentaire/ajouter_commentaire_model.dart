import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ajouter_commentaire_widget.dart' show AjouterCommentaireWidget;
import 'package:flutter/material.dart';

class AjouterCommentaireModel
    extends FlutterFlowModel<AjouterCommentaireWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for commentaire widget.
  FocusNode? commentaireFocusNode;
  TextEditingController? commentaireTextController;
  String? Function(BuildContext, String?)? commentaireTextControllerValidator;
  String? _commentaireTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'u8mt6c7d' /* veuillez remplir ce champ */,
      );
    }

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        'p7nix6w6' /* 10 */,
      );
    }
    if (val.length > 1000) {
      return FFLocalizations.of(context).getText(
        'pxs72udl' /* 1000 */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (bad words)] action in Button widget.
  ApiCallResponse? result;

  @override
  void initState(BuildContext context) {
    commentaireTextControllerValidator = _commentaireTextControllerValidator;
  }

  @override
  void dispose() {
    commentaireFocusNode?.dispose();
    commentaireTextController?.dispose();
  }
}
