import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'ajouter_offre_widget.dart' show AjouterOffreWidget;
import 'package:flutter/material.dart';

class AjouterOffreModel extends FlutterFlowModel<AjouterOffreWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nom widget.
  FocusNode? nomFocusNode;
  TextEditingController? nomTextController;
  String? Function(BuildContext, String?)? nomTextControllerValidator;
  String? _nomTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gkeh81nk' /* Nom de voyage is required */,
      );
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for image widget.
  FocusNode? imageFocusNode;
  TextEditingController? imageTextController;
  String? Function(BuildContext, String?)? imageTextControllerValidator;
  String? _imageTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ukgotovr' /* Image voyage is required */,
      );
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1xuwg47y' /* Description... is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for reduction widget.
  FocusNode? reductionFocusNode;
  TextEditingController? reductionTextController;
  String? Function(BuildContext, String?)? reductionTextControllerValidator;
  String? _reductionTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hqlp8k2k' /* reduction is required */,
      );
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    nomTextControllerValidator = _nomTextControllerValidator;
    imageTextControllerValidator = _imageTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    reductionTextControllerValidator = _reductionTextControllerValidator;
  }

  @override
  void dispose() {
    nomFocusNode?.dispose();
    nomTextController?.dispose();

    imageFocusNode?.dispose();
    imageTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    reductionFocusNode?.dispose();
    reductionTextController?.dispose();
  }
}
