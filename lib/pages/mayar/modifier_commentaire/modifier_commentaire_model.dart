import '/flutter_flow/flutter_flow_util.dart';
import 'modifier_commentaire_widget.dart' show ModifierCommentaireWidget;
import 'package:flutter/material.dart';

class ModifierCommentaireModel
    extends FlutterFlowModel<ModifierCommentaireWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for contenu widget.
  FocusNode? contenuFocusNode;
  TextEditingController? contenuTextController;
  String? Function(BuildContext, String?)? contenuTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    contenuFocusNode?.dispose();
    contenuTextController?.dispose();
  }
}
