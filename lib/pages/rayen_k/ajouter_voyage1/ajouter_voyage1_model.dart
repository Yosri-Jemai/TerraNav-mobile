import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'ajouter_voyage1_widget.dart' show AjouterVoyage1Widget;
import 'package:flutter/material.dart';

class AjouterVoyage1Model extends FlutterFlowModel<AjouterVoyage1Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for task widget.
  FocusNode? taskFocusNode1;
  TextEditingController? taskTextController1;
  String? Function(BuildContext, String?)? taskTextController1Validator;
  String? _taskTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vl2d4eh5' /* Ville de Depart est obligatoir... */,
      );
    }

    return null;
  }

  // State field(s) for task widget.
  FocusNode? taskFocusNode2;
  TextEditingController? taskTextController2;
  String? Function(BuildContext, String?)? taskTextController2Validator;
  String? _taskTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zpkkttep' /* Destination est obligatoire */,
      );
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }

    return null;
  }

  // State field(s) for task widget.
  FocusNode? taskFocusNode3;
  TextEditingController? taskTextController3;
  String? Function(BuildContext, String?)? taskTextController3Validator;
  String? _taskTextController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jrpoz1i3' /* Image voyage est obligatoire */,
      );
    }

    return null;
  }

  // State field(s) for task widget.
  FocusNode? taskFocusNode4;
  TextEditingController? taskTextController4;
  String? Function(BuildContext, String?)? taskTextController4Validator;
  String? _taskTextController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'sp3crvrv' /* Nom de voyage est obligatoire */,
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

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6w9pzelq' /* Description est obligatoire */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  String? _textController6Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xdxgkfb1' /* Nb places is required */,
      );
    }

    return null;
  }

  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    taskTextController1Validator = _taskTextController1Validator;
    taskTextController2Validator = _taskTextController2Validator;
    taskTextController3Validator = _taskTextController3Validator;
    taskTextController4Validator = _taskTextController4Validator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    textController6Validator = _textController6Validator;
  }

  @override
  void dispose() {
    taskFocusNode1?.dispose();
    taskTextController1?.dispose();

    taskFocusNode2?.dispose();
    taskTextController2?.dispose();

    taskFocusNode3?.dispose();
    taskTextController3?.dispose();

    taskFocusNode4?.dispose();
    taskTextController4?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController6?.dispose();
  }
}
