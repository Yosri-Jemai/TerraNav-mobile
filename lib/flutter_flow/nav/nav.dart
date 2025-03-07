import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomeClientWidget() : LoginfinalWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? HomeClientWidget()
              : LoginfinalWidget(),
        ),
        FFRoute(
          name: InscriptionWidget.routeName,
          path: InscriptionWidget.routePath,
          builder: (context, params) => InscriptionWidget(),
        ),
        FFRoute(
          name: HomeClientWidget.routeName,
          path: HomeClientWidget.routePath,
          builder: (context, params) => HomeClientWidget(),
        ),
        FFRoute(
          name: AjouterVoyage1Widget.routeName,
          path: AjouterVoyage1Widget.routePath,
          builder: (context, params) => AjouterVoyage1Widget(),
        ),
        FFRoute(
          name: AjouterPostWidget.routeName,
          path: AjouterPostWidget.routePath,
          builder: (context, params) => AjouterPostWidget(),
        ),
        FFRoute(
          name: PostWidget.routeName,
          path: PostWidget.routePath,
          builder: (context, params) => PostWidget(),
        ),
        FFRoute(
          name: PanierWidget.routeName,
          path: PanierWidget.routePath,
          builder: (context, params) => PanierWidget(
            userToPanier: params.getParam(
              'userToPanier',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: LoginfinalWidget.routeName,
          path: LoginfinalWidget.routePath,
          builder: (context, params) => LoginfinalWidget(),
        ),
        FFRoute(
          name: TransportsWidget.routeName,
          path: TransportsWidget.routePath,
          builder: (context, params) => TransportsWidget(),
        ),
        FFRoute(
          name: DetailsVoyageWidget.routeName,
          path: DetailsVoyageWidget.routePath,
          asyncParams: {
            'voyage': getDoc(['voyage'], VoyageRecord.fromSnapshot),
          },
          builder: (context, params) => DetailsVoyageWidget(
            voyage: params.getParam(
              'voyage',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ListeOffresWidget.routeName,
          path: ListeOffresWidget.routePath,
          builder: (context, params) => ListeOffresWidget(),
        ),
        FFRoute(
          name: ReservationVoyageWidget.routeName,
          path: ReservationVoyageWidget.routePath,
          builder: (context, params) => ReservationVoyageWidget(
            resVoyage: params.getParam(
              'resVoyage',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['voyage'],
            ),
            user: params.getParam(
              'user',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: ReclamationWidget.routeName,
          path: ReclamationWidget.routePath,
          builder: (context, params) => ReclamationWidget(),
        ),
        FFRoute(
          name: ReservationHebergementWidget.routeName,
          path: ReservationHebergementWidget.routePath,
          builder: (context, params) => ReservationHebergementWidget(
            chambreDetail: params.getParam(
              'chambreDetail',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chambre'],
            ),
            user: params.getParam(
              'user',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: ReservationTransportWidget.routeName,
          path: ReservationTransportWidget.routePath,
          builder: (context, params) => ReservationTransportWidget(
            resTransport: params.getParam(
              'resTransport',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['transport'],
            ),
          ),
        ),
        FFRoute(
          name: DetailOffreWidget.routeName,
          path: DetailOffreWidget.routePath,
          builder: (context, params) => DetailOffreWidget(
            offre: params.getParam(
              'offre',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['offre'],
            ),
          ),
        ),
        FFRoute(
          name: ListeVoyagesWidget.routeName,
          path: ListeVoyagesWidget.routePath,
          builder: (context, params) => ListeVoyagesWidget(),
        ),
        FFRoute(
          name: MapWidget.routeName,
          path: MapWidget.routePath,
          builder: (context, params) => MapWidget(),
        ),
        FFRoute(
          name: AjouterOffreWidget.routeName,
          path: AjouterOffreWidget.routePath,
          builder: (context, params) => AjouterOffreWidget(),
        ),
        FFRoute(
          name: SuccessTransportWidget.routeName,
          path: SuccessTransportWidget.routePath,
          builder: (context, params) => SuccessTransportWidget(),
        ),
        FFRoute(
          name: ListeHebergementWidget.routeName,
          path: ListeHebergementWidget.routePath,
          builder: (context, params) => ListeHebergementWidget(),
        ),
        FFRoute(
          name: TypesHebergementWidget.routeName,
          path: TypesHebergementWidget.routePath,
          builder: (context, params) => TypesHebergementWidget(),
        ),
        FFRoute(
          name: MesHebergementsWidget.routeName,
          path: MesHebergementsWidget.routePath,
          builder: (context, params) => MesHebergementsWidget(),
        ),
        FFRoute(
          name: AjouterCommentaireWidget.routeName,
          path: AjouterCommentaireWidget.routePath,
          builder: (context, params) => AjouterCommentaireWidget(
            idpost: params.getParam(
              'idpost',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['post'],
            ),
          ),
        ),
        FFRoute(
          name: RechercheHebergementPublieWidget.routeName,
          path: RechercheHebergementPublieWidget.routePath,
          builder: (context, params) => RechercheHebergementPublieWidget(),
        ),
        FFRoute(
          name: AjouterHebergementWidget.routeName,
          path: AjouterHebergementWidget.routePath,
          builder: (context, params) => AjouterHebergementWidget(),
        ),
        FFRoute(
          name: DetailsPostWidget.routeName,
          path: DetailsPostWidget.routePath,
          asyncParams: {
            'postmod': getDoc(['post'], PostRecord.fromSnapshot),
            'comtrModification':
                getDoc(['commentaire'], CommentaireRecord.fromSnapshot),
          },
          builder: (context, params) => DetailsPostWidget(
            receivePost: params.getParam(
              'receivePost',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['post'],
            ),
            postmod: params.getParam(
              'postmod',
              ParamType.Document,
            ),
            comtrModification: params.getParam(
              'comtrModification',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ModifierOffreWidget.routeName,
          path: ModifierOffreWidget.routePath,
          asyncParams: {
            'offre': getDoc(['offre'], OffreRecord.fromSnapshot),
          },
          builder: (context, params) => ModifierOffreWidget(
            offre: params.getParam(
              'offre',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ChambreDetailsWidget.routeName,
          path: ChambreDetailsWidget.routePath,
          builder: (context, params) => ChambreDetailsWidget(
            hebergement: params.getParam(
              'hebergement',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['hebergement'],
            ),
            chambre: params.getParam(
              'chambre',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chambre'],
            ),
          ),
        ),
        FFRoute(
          name: ModifierVoyageWidget.routeName,
          path: ModifierVoyageWidget.routePath,
          builder: (context, params) => ModifierVoyageWidget(
            voyage: params.getParam(
              'voyage',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['voyage'],
            ),
          ),
        ),
        FFRoute(
          name: AjoutertransportWidget.routeName,
          path: AjoutertransportWidget.routePath,
          builder: (context, params) => AjoutertransportWidget(),
        ),
        FFRoute(
          name: TestWidget.routeName,
          path: TestWidget.routePath,
          builder: (context, params) => TestWidget(),
        ),
        FFRoute(
          name: ReclamationDashboardWidget.routeName,
          path: ReclamationDashboardWidget.routePath,
          builder: (context, params) => ReclamationDashboardWidget(),
        ),
        FFRoute(
          name: AjouterTrajetWidget.routeName,
          path: AjouterTrajetWidget.routePath,
          builder: (context, params) => AjouterTrajetWidget(),
        ),
        FFRoute(
          name: ModifiertransportWidget.routeName,
          path: ModifiertransportWidget.routePath,
          asyncParams: {
            'nom': getDoc(['transport'], TransportRecord.fromSnapshot),
            'type': getDoc(['transport'], TransportRecord.fromSnapshot),
            'capacite': getDoc(['transport'], TransportRecord.fromSnapshot),
            'contact': getDoc(['transport'], TransportRecord.fromSnapshot),
            'description': getDoc(['transport'], TransportRecord.fromSnapshot),
            'prix': getDoc(['transport'], TransportRecord.fromSnapshot),
          },
          builder: (context, params) => ModifiertransportWidget(
            nom: params.getParam(
              'nom',
              ParamType.Document,
            ),
            type: params.getParam(
              'type',
              ParamType.Document,
            ),
            capacite: params.getParam(
              'capacite',
              ParamType.Document,
            ),
            contact: params.getParam(
              'contact',
              ParamType.Document,
            ),
            description: params.getParam(
              'description',
              ParamType.Document,
            ),
            prix: params.getParam(
              'prix',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ListTransportWidget.routeName,
          path: ListTransportWidget.routePath,
          builder: (context, params) => ListTransportWidget(),
        ),
        FFRoute(
          name: ListTrajetWidget.routeName,
          path: ListTrajetWidget.routePath,
          builder: (context, params) => ListTrajetWidget(),
        ),
        FFRoute(
          name: ModifierPostWidget.routeName,
          path: ModifierPostWidget.routePath,
          asyncParams: {
            'postDetails': getDoc(['post'], PostRecord.fromSnapshot),
          },
          builder: (context, params) => ModifierPostWidget(
            postDetails: params.getParam(
              'postDetails',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AgenceTransportHomeWidget.routeName,
          path: AgenceTransportHomeWidget.routePath,
          builder: (context, params) => AgenceTransportHomeWidget(),
        ),
        FFRoute(
          name: ModiferChambreWidget.routeName,
          path: ModiferChambreWidget.routePath,
          builder: (context, params) => ModiferChambreWidget(
            documentcha: params.getParam(
              'documentcha',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chambre'],
            ),
          ),
        ),
        FFRoute(
          name: AjouterChambreWidget.routeName,
          path: AjouterChambreWidget.routePath,
          builder: (context, params) => AjouterChambreWidget(
            hebergement: params.getParam(
              'hebergement',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['hebergement'],
            ),
          ),
        ),
        FFRoute(
          name: ListChambresWidget.routeName,
          path: ListChambresWidget.routePath,
          builder: (context, params) => ListChambresWidget(
            hebergementRecu: params.getParam(
              'hebergementRecu',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['hebergement'],
            ),
          ),
        ),
        FFRoute(
          name: SuccessTrajetWidget.routeName,
          path: SuccessTrajetWidget.routePath,
          builder: (context, params) => SuccessTrajetWidget(),
        ),
        FFRoute(
          name: ModifierTrajetWidget.routeName,
          path: ModifierTrajetWidget.routePath,
          asyncParams: {
            'depart': getDoc(['trajet'], TrajetRecord.fromSnapshot),
            'dest': getDoc(['trajet'], TrajetRecord.fromSnapshot),
            'duree': getDoc(['trajet'], TrajetRecord.fromSnapshot),
          },
          builder: (context, params) => ModifierTrajetWidget(
            depart: params.getParam(
              'depart',
              ParamType.Document,
            ),
            dest: params.getParam(
              'dest',
              ParamType.Document,
            ),
            duree: params.getParam(
              'duree',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ListCommentairesWidget.routeName,
          path: ListCommentairesWidget.routePath,
          builder: (context, params) => ListCommentairesWidget(),
        ),
        FFRoute(
          name: ModifierCommentaireWidget.routeName,
          path: ModifierCommentaireWidget.routePath,
          asyncParams: {
            'modificationCOMM':
                getDoc(['commentaire'], CommentaireRecord.fromSnapshot),
          },
          builder: (context, params) => ModifierCommentaireWidget(
            modificationCOMM: params.getParam(
              'modificationCOMM',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ChambresWidget.routeName,
          path: ChambresWidget.routePath,
          builder: (context, params) => ChambresWidget(
            hebergementRecu: params.getParam(
              'hebergementRecu',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['hebergement'],
            ),
            user: params.getParam(
              'user',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: DetailsCommentaireWidget.routeName,
          path: DetailsCommentaireWidget.routePath,
          asyncParams: {
            'cmtrMod': getDoc(['commentaire'], CommentaireRecord.fromSnapshot),
            'postmodificatio': getDoc(['post'], PostRecord.fromSnapshot),
          },
          builder: (context, params) => DetailsCommentaireWidget(
            cmtrMod: params.getParam(
              'cmtrMod',
              ParamType.Document,
            ),
            receivePost: params.getParam(
              'receivePost',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['post'],
            ),
            receiveComment: params.getParam(
              'receiveComment',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['commentaire'],
            ),
            postmodificatio: params.getParam(
              'postmodificatio',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SuccessAjoutOffreWidget.routeName,
          path: SuccessAjoutOffreWidget.routePath,
          builder: (context, params) => SuccessAjoutOffreWidget(),
        ),
        FFRoute(
          name: ChercherVoyageWidget.routeName,
          path: ChercherVoyageWidget.routePath,
          builder: (context, params) => ChercherVoyageWidget(),
        ),
        FFRoute(
          name: ChercherVoyage2Widget.routeName,
          path: ChercherVoyage2Widget.routePath,
          builder: (context, params) => ChercherVoyage2Widget(
            offreref: params.getParam(
              'offreref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['offre'],
            ),
          ),
        ),
        FFRoute(
          name: DetailVoyageWidget.routeName,
          path: DetailVoyageWidget.routePath,
          asyncParams: {
            'voyage': getDoc(['voyage'], VoyageRecord.fromSnapshot),
          },
          builder: (context, params) => DetailVoyageWidget(
            voyage: params.getParam(
              'voyage',
              ParamType.Document,
            ),
            offre: params.getParam(
              'offre',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['offre'],
            ),
          ),
        ),
        FFRoute(
          name: DetailOffre2Widget.routeName,
          path: DetailOffre2Widget.routePath,
          asyncParams: {
            'offre': getDoc(['offre'], OffreRecord.fromSnapshot),
          },
          builder: (context, params) => DetailOffre2Widget(
            referenceoffre: params.getParam(
              'referenceoffre',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['offre'],
            ),
            offre: params.getParam(
              'offre',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: DetailReservationVoyageWidget.routeName,
          path: DetailReservationVoyageWidget.routePath,
          builder: (context, params) => DetailReservationVoyageWidget(
            resVoyage: params.getParam(
              'resVoyage',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['reservation'],
            ),
          ),
        ),
        FFRoute(
          name: DetailReservationHebergementWidget.routeName,
          path: DetailReservationHebergementWidget.routePath,
          builder: (context, params) => DetailReservationHebergementWidget(
            resChambre: params.getParam(
              'resChambre',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['reservation'],
            ),
          ),
        ),
        FFRoute(
          name: DetailReservationTransportWidget.routeName,
          path: DetailReservationTransportWidget.routePath,
          builder: (context, params) => DetailReservationTransportWidget(
            resTransport: params.getParam(
              'resTransport',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['reservation'],
            ),
          ),
        ),
        FFRoute(
          name: ModResVoyageWidget.routeName,
          path: ModResVoyageWidget.routePath,
          builder: (context, params) => ModResVoyageWidget(
            modResVoyage: params.getParam(
              'modResVoyage',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['reservation'],
            ),
          ),
        ),
        FFRoute(
          name: SuccessAjoutVoyageWidget.routeName,
          path: SuccessAjoutVoyageWidget.routePath,
          builder: (context, params) => SuccessAjoutVoyageWidget(
            voyage: params.getParam(
              'voyage',
              ParamType.String,
            ),
            offreref: params.getParam(
              'offreref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['offre'],
            ),
          ),
        ),
        FFRoute(
          name: SuccessModifVoyageWidget.routeName,
          path: SuccessModifVoyageWidget.routePath,
          builder: (context, params) => SuccessModifVoyageWidget(
            voyage: params.getParam(
              'voyage',
              ParamType.String,
            ),
            offreref: params.getParam(
              'offreref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['offre'],
            ),
          ),
        ),
        FFRoute(
          name: ModRsHebergementWidget.routeName,
          path: ModRsHebergementWidget.routePath,
          builder: (context, params) => ModRsHebergementWidget(
            modResHebergement: params.getParam(
              'modResHebergement',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['reservation'],
            ),
          ),
        ),
        FFRoute(
          name: AjouterChambreCodeWidget.routeName,
          path: AjouterChambreCodeWidget.routePath,
          builder: (context, params) => AjouterChambreCodeWidget(),
        ),
        FFRoute(
          name: ModResTransportWidget.routeName,
          path: ModResTransportWidget.routePath,
          builder: (context, params) => ModResTransportWidget(
            modResTransport: params.getParam(
              'modResTransport',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['reservation'],
            ),
          ),
        ),
        FFRoute(
          name: MaptestWidget.routeName,
          path: MaptestWidget.routePath,
          builder: (context, params) => MaptestWidget(),
        ),
        FFRoute(
          name: ClientReservationsWidget.routeName,
          path: ClientReservationsWidget.routePath,
          builder: (context, params) => ClientReservationsWidget(),
        ),
        FFRoute(
          name: RecovepasswordWidget.routeName,
          path: RecovepasswordWidget.routePath,
          builder: (context, params) => RecovepasswordWidget(),
        ),
        FFRoute(
          name: AcceuilTransportWidget.routeName,
          path: AcceuilTransportWidget.routePath,
          builder: (context, params) => AcceuilTransportWidget(),
        ),
        FFRoute(
          name: SuccesAjoutChambreWidget.routeName,
          path: SuccesAjoutChambreWidget.routePath,
          builder: (context, params) => SuccesAjoutChambreWidget(),
        ),
        FFRoute(
          name: SuccesAjoutHebergementWidget.routeName,
          path: SuccesAjoutHebergementWidget.routePath,
          builder: (context, params) => SuccesAjoutHebergementWidget(),
        ),
        FFRoute(
          name: ListOffres2Widget.routeName,
          path: ListOffres2Widget.routePath,
          builder: (context, params) => ListOffres2Widget(),
        ),
        FFRoute(
          name: AjouterChambreCopyWidget.routeName,
          path: AjouterChambreCopyWidget.routePath,
          builder: (context, params) => AjouterChambreCopyWidget(
            hebergement: params.getParam(
              'hebergement',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['hebergement'],
            ),
          ),
        ),
        FFRoute(
          name: MesChambresWidget.routeName,
          path: MesChambresWidget.routePath,
          builder: (context, params) => MesChambresWidget(
            hebergement: params.getParam(
              'hebergement',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['hebergement'],
            ),
          ),
        ),
        FFRoute(
          name: ModifierHebergementWidget.routeName,
          path: ModifierHebergementWidget.routePath,
          builder: (context, params) => ModifierHebergementWidget(),
        ),
        FFRoute(
          name: POSTCopyWidget.routeName,
          path: POSTCopyWidget.routePath,
          builder: (context, params) => POSTCopyWidget(),
        ),
        FFRoute(
          name: MapPageWidget.routeName,
          path: MapPageWidget.routePath,
          builder: (context, params) => MapPageWidget(),
        ),
        FFRoute(
          name: DepartureselctionWidget.routeName,
          path: DepartureselctionWidget.routePath,
          builder: (context, params) => DepartureselctionWidget(),
        ),
        FFRoute(
          name: AjouterVoyage1CopyWidget.routeName,
          path: AjouterVoyage1CopyWidget.routePath,
          builder: (context, params) => AjouterVoyage1CopyWidget(),
        ),
        FFRoute(
          name: UsersClientsWidget.routeName,
          path: UsersClientsWidget.routePath,
          builder: (context, params) => UsersClientsWidget(),
        ),
        FFRoute(
          name: ReservationsParClientWidget.routeName,
          path: ReservationsParClientWidget.routePath,
          builder: (context, params) => ReservationsParClientWidget(
            clientRefForReservations: params.getParam(
              'clientRefForReservations',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: AdminDashboardWidget.routeName,
          path: AdminDashboardWidget.routePath,
          builder: (context, params) => AdminDashboardWidget(),
        ),
        FFRoute(
          name: ChercherVoyage2CopyWidget.routeName,
          path: ChercherVoyage2CopyWidget.routePath,
          builder: (context, params) => ChercherVoyage2CopyWidget(
            offreref: params.getParam(
              'offreref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['offre'],
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/loginfinal';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
