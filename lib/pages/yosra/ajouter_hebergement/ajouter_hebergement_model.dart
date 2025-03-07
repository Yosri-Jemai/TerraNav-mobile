import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'ajouter_hebergement_widget.dart' show AjouterHebergementWidget;
import 'package:flutter/material.dart';

class AjouterHebergementModel
    extends FlutterFlowModel<AjouterHebergementWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nom widget.
  FocusNode? nomFocusNode;
  TextEditingController? nomTextController;
  String? Function(BuildContext, String?)? nomTextControllerValidator;
  // State field(s) for pays widget.
  FocusNode? paysFocusNode;
  TextEditingController? paysTextController;
  String? Function(BuildContext, String?)? paysTextControllerValidator;
  // State field(s) for nbrCh widget.
  FocusNode? nbrChFocusNode;
  TextEditingController? nbrChTextController;
  String? Function(BuildContext, String?)? nbrChTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for gDescription widget.
  FocusNode? gDescriptionFocusNode;
  TextEditingController? gDescriptionTextController;
  String? Function(BuildContext, String?)? gDescriptionTextControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? result;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomFocusNode?.dispose();
    nomTextController?.dispose();

    paysFocusNode?.dispose();
    paysTextController?.dispose();

    nbrChFocusNode?.dispose();
    nbrChTextController?.dispose();

    gDescriptionFocusNode?.dispose();
    gDescriptionTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();
  }
}
