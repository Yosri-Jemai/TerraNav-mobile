import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HebergementRecord extends FirestoreRecord {
  HebergementRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "localisation" field.
  String? _localisation;
  String get localisation => _localisation ?? '';
  bool hasLocalisation() => _localisation != null;

  // "nb_chambres" field.
  int? _nbChambres;
  int get nbChambres => _nbChambres ?? 0;
  bool hasNbChambres() => _nbChambres != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "derniere_mise_a_jour" field.
  DateTime? _derniereMiseAJour;
  DateTime? get derniereMiseAJour => _derniereMiseAJour;
  bool hasDerniereMiseAJour() => _derniereMiseAJour != null;

  // "chambre" field.
  DocumentReference? _chambre;
  DocumentReference? get chambre => _chambre;
  bool hasChambre() => _chambre != null;

  // "pays" field.
  String? _pays;
  String get pays => _pays ?? '';
  bool hasPays() => _pays != null;

  // "type_hebergement" field.
  String? _typeHebergement;
  String get typeHebergement => _typeHebergement ?? '';
  bool hasTypeHebergement() => _typeHebergement != null;

  // "Politiqued_Annulation" field.
  String? _politiquedAnnulation;
  String get politiquedAnnulation => _politiquedAnnulation ?? '';
  bool hasPolitiquedAnnulation() => _politiquedAnnulation != null;

  // "chambres" field.
  List<DocumentReference>? _chambres;
  List<DocumentReference> get chambres => _chambres ?? const [];
  bool hasChambres() => _chambres != null;

  // "Moyenne" field.
  double? _moyenne;
  double get moyenne => _moyenne ?? 0.0;
  bool hasMoyenne() => _moyenne != null;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _localisation = snapshotData['localisation'] as String?;
    _nbChambres = castToType<int>(snapshotData['nb_chambres']);
    _description = snapshotData['description'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
    _derniereMiseAJour = snapshotData['derniere_mise_a_jour'] as DateTime?;
    _chambre = snapshotData['chambre'] as DocumentReference?;
    _pays = snapshotData['pays'] as String?;
    _typeHebergement = snapshotData['type_hebergement'] as String?;
    _politiquedAnnulation = snapshotData['Politiqued_Annulation'] as String?;
    _chambres = getDataList(snapshotData['chambres']);
    _moyenne = castToType<double>(snapshotData['Moyenne']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hebergement');

  static Stream<HebergementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HebergementRecord.fromSnapshot(s));

  static Future<HebergementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HebergementRecord.fromSnapshot(s));

  static HebergementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HebergementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HebergementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HebergementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HebergementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HebergementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHebergementRecordData({
  String? nom,
  String? localisation,
  int? nbChambres,
  String? description,
  DocumentReference? user,
  String? image,
  DateTime? derniereMiseAJour,
  DocumentReference? chambre,
  String? pays,
  String? typeHebergement,
  String? politiquedAnnulation,
  double? moyenne,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'localisation': localisation,
      'nb_chambres': nbChambres,
      'description': description,
      'user': user,
      'image': image,
      'derniere_mise_a_jour': derniereMiseAJour,
      'chambre': chambre,
      'pays': pays,
      'type_hebergement': typeHebergement,
      'Politiqued_Annulation': politiquedAnnulation,
      'Moyenne': moyenne,
    }.withoutNulls,
  );

  return firestoreData;
}

class HebergementRecordDocumentEquality implements Equality<HebergementRecord> {
  const HebergementRecordDocumentEquality();

  @override
  bool equals(HebergementRecord? e1, HebergementRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nom == e2?.nom &&
        e1?.localisation == e2?.localisation &&
        e1?.nbChambres == e2?.nbChambres &&
        e1?.description == e2?.description &&
        e1?.user == e2?.user &&
        e1?.image == e2?.image &&
        e1?.derniereMiseAJour == e2?.derniereMiseAJour &&
        e1?.chambre == e2?.chambre &&
        e1?.pays == e2?.pays &&
        e1?.typeHebergement == e2?.typeHebergement &&
        e1?.politiquedAnnulation == e2?.politiquedAnnulation &&
        listEquality.equals(e1?.chambres, e2?.chambres) &&
        e1?.moyenne == e2?.moyenne;
  }

  @override
  int hash(HebergementRecord? e) => const ListEquality().hash([
        e?.nom,
        e?.localisation,
        e?.nbChambres,
        e?.description,
        e?.user,
        e?.image,
        e?.derniereMiseAJour,
        e?.chambre,
        e?.pays,
        e?.typeHebergement,
        e?.politiquedAnnulation,
        e?.chambres,
        e?.moyenne
      ]);

  @override
  bool isValidKey(Object? o) => o is HebergementRecord;
}
