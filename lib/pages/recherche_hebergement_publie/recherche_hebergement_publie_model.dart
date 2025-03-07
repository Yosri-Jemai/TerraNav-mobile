import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'recherche_hebergement_publie_widget.dart'
    show RechercheHebergementPublieWidget;
import 'package:flutter/material.dart';

class RechercheHebergementPublieModel
    extends FlutterFlowModel<RechercheHebergementPublieWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
