import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'menutypecompte_model.dart';
export 'menutypecompte_model.dart';

/// Crée un composant interactif et moderne pour la sélection du type de
/// compte dans une application de voyage.
///
///
///
/// 🖌️ Design et animation :
///
/// Bouton ou champ cliquable contenant une icône intuitive (ex: icône de
/// profil, globe ou valise).
/// Lors du clic sur l’icône ou le champ, un menu déroulant animé doit
/// apparaître avec une transition fluide (ex: effet de glissement, pop-up ou
/// fade-in).
/// Chaque option du menu doit être affichée avec :
/// Une icône distincte selon le type de compte.
/// Un texte clair et lisible.
/// Une mise en surbrillance au survol ou sélection.
/// Une fois une option sélectionnée, elle doit :
/// Remplacer le texte du champ par la sélection choisie.
/// Afficher l'icône correspondante à côté du texte.
/// Fermer le menu déroulant avec un effet fluide.
/// 📝 Liste des rôles à afficher :
///
/// 👤 Utilisateur simple
/// 🛠️ Administrateur
/// ✈️ Agence de voyage
/// 🚌 Agence de transport
/// 🏨 Agence d’hébergement
/// ⚙️ Fonctionnalités techniques :
///
/// Composant réutilisable et adaptable à d'autres formulaires.
/// Animations fluides et modernes pour une expérience utilisateur agréable.
/// Design responsive compatible avec les écrans mobiles et tablettes.
/// Couleurs harmonieuses et élégantes (bleu océan, doré, blanc épuré).
/// 🚀 Objectif : Un composant intuitif et esthétique, parfaitement intégré au
/// formulaire d'inscription de TerraNav !
class MenutypecompteWidget extends StatefulWidget {
  const MenutypecompteWidget({super.key});

  @override
  State<MenutypecompteWidget> createState() => _MenutypecompteWidgetState();
}

class _MenutypecompteWidgetState extends State<MenutypecompteWidget> {
  late MenutypecompteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenutypecompteModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x1A000000),
              offset: Offset(
                0.0,
                2.0,
              ),
              spreadRadius: 0.0,
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'ergx6x1m' /* Sélectionnez le type de compte... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: FlutterFlowChoiceChips(
                  options: [
                    ChipData(
                        FFLocalizations.of(context).getText(
                          'u0zldze6' /* Voyageur */,
                        ),
                        Icons.person_outlined),
                    ChipData(
                        FFLocalizations.of(context).getText(
                          'w36544qe' /* Agence de Voyage */,
                        ),
                        Icons.flight_takeoff),
                    ChipData(
                        FFLocalizations.of(context).getText(
                          'e89wzyi2' /* Agence de Transport */,
                        ),
                        Icons.directions_bus),
                    ChipData(
                        FFLocalizations.of(context).getText(
                          '0519gz1x' /* Agence d'hebergement */,
                        ),
                        Icons.hotel)
                  ],
                  onChanged: (val) async {
                    safeSetState(
                        () => _model.choiceChipsValue = val?.firstOrNull);
                    Navigator.pop(context);
                  },
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).info,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).info,
                    iconSize: 18.0,
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 18.0,
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  chipSpacing: 8.0,
                  rowSpacing: 12.0,
                  multiselect: false,
                  alignment: WrapAlignment.start,
                  controller: _model.choiceChipsValueController ??=
                      FormFieldController<List<String>>(
                    [],
                  ),
                  wrapped: true,
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
