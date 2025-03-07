import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'modifier_hebergement_widget.dart' show ModifierHebergementWidget;
import 'package:flutter/material.dart';

class ModifierHebergementModel
    extends FlutterFlowModel<ModifierHebergementWidget> {
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
  FocusNode? nbrChFocusNode1;
  TextEditingController? nbrChTextController1;
  String? Function(BuildContext, String?)? nbrChTextController1Validator;
  // State field(s) for nbrCh widget.
  FocusNode? nbrChFocusNode2;
  TextEditingController? nbrChTextController2;
  String? Function(BuildContext, String?)? nbrChTextController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomFocusNode?.dispose();
    nomTextController?.dispose();

    paysFocusNode?.dispose();
    paysTextController?.dispose();

    nbrChFocusNode1?.dispose();
    nbrChTextController1?.dispose();

    nbrChFocusNode2?.dispose();
    nbrChTextController2?.dispose();

    textFieldFocusNode1?.dispose();
    textController5?.dispose();

    textFieldFocusNode2?.dispose();
    textController6?.dispose();
  }
}
