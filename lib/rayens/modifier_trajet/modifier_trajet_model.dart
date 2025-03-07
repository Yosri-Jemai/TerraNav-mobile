import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'modifier_trajet_widget.dart' show ModifierTrajetWidget;
import 'package:flutter/material.dart';

class ModifierTrajetModel extends FlutterFlowModel<ModifierTrajetWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PointDepart widget.
  FocusNode? pointDepartFocusNode;
  TextEditingController? pointDepartTextController;
  String? Function(BuildContext, String?)? pointDepartTextControllerValidator;
  String? _pointDepartTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fxbd5qp8' /* Point de Depart is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 50) {
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Destination widget.
  FocusNode? destinationFocusNode;
  TextEditingController? destinationTextController;
  String? Function(BuildContext, String?)? destinationTextControllerValidator;
  String? _destinationTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fz6p9v96' /* Destination is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 50) {
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Duree widget.
  FocusNode? dureeFocusNode;
  TextEditingController? dureeTextController;
  String? Function(BuildContext, String?)? dureeTextControllerValidator;
  String? _dureeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bmpnl9ns' /* Duree is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 5) {
      return 'Maximum 5 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    pointDepartTextControllerValidator = _pointDepartTextControllerValidator;
    destinationTextControllerValidator = _destinationTextControllerValidator;
    dureeTextControllerValidator = _dureeTextControllerValidator;
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    pointDepartFocusNode?.dispose();
    pointDepartTextController?.dispose();

    destinationFocusNode?.dispose();
    destinationTextController?.dispose();

    dureeFocusNode?.dispose();
    dureeTextController?.dispose();
  }
}
