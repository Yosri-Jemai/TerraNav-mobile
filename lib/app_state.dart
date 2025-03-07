import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _chercherVoyage = prefs.getBool('ff_chercherVoyage') ?? _chercherVoyage;
    });
    _safeInit(() {
      _chercherUserClient =
          prefs.getBool('ff_chercherUserClient') ?? _chercherUserClient;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _userYosri =
      FirebaseFirestore.instance.doc('/users/aED30CD2qJKf94BTSbkN');
  DocumentReference? get userYosri => _userYosri;
  set userYosri(DocumentReference? value) {
    _userYosri = value;
  }

  OffreStruct _offre = OffreStruct.fromSerializableMap(jsonDecode(
      '{\"price\":\"100\",\"name\":\"roma\",\"description\":\"to roma\"}'));
  OffreStruct get offre => _offre;
  set offre(OffreStruct value) {
    _offre = value;
  }

  void updateOffreStruct(Function(OffreStruct) updateFn) {
    updateFn(_offre);
  }

  String _selectedtransport = '';
  String get selectedtransport => _selectedtransport;
  set selectedtransport(String value) {
    _selectedtransport = value;
  }

  String _image = '';
  String get image => _image;
  set image(String value) {
    _image = value;
  }

  bool _chercherVoyage = false;
  bool get chercherVoyage => _chercherVoyage;
  set chercherVoyage(bool value) {
    _chercherVoyage = value;
    prefs.setBool('ff_chercherVoyage', value);
  }

  String _type = '';
  String get type => _type;
  set type(String value) {
    _type = value;
  }

  bool _chercherUserClient = false;
  bool get chercherUserClient => _chercherUserClient;
  set chercherUserClient(bool value) {
    _chercherUserClient = value;
    prefs.setBool('ff_chercherUserClient', value);
  }

  String _selectedLanguage = 'fr';
  String get selectedLanguage => _selectedLanguage;
  set selectedLanguage(String value) {
    _selectedLanguage = value;
  }

  String _textToTranslate = 'Bienvenue sur TerraNav';
  String get textToTranslate => _textToTranslate;
  set textToTranslate(String value) {
    _textToTranslate = value;
  }

  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? value) {
    _location = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
