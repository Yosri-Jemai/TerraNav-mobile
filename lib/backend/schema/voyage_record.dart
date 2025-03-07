import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VoyageRecord extends FirestoreRecord {
  VoyageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "ville_depart" field.
  String? _villeDepart;
  String get villeDepart => _villeDepart ?? '';
  bool hasVilleDepart() => _villeDepart != null;

  // "destination" field.
  String? _destination;
  String get destination => _destination ?? '';
  bool hasDestination() => _destination != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "date_depart" field.
  DateTime? _dateDepart;
  DateTime? get dateDepart => _dateDepart;
  bool hasDateDepart() => _dateDepart != null;

  // "date_retour" field.
  DateTime? _dateRetour;
  DateTime? get dateRetour => _dateRetour;
  bool hasDateRetour() => _dateRetour != null;

  // "prix" field.
  double? _prix;
  double get prix => _prix ?? 0.0;
  bool hasPrix() => _prix != null;

  // "offre" field.
  DocumentReference? _offre;
  DocumentReference? get offre => _offre;
  bool hasOffre() => _offre != null;

  // "nb_places" field.
  int? _nbPlaces;
  int get nbPlaces => _nbPlaces ?? 0;
  bool hasNbPlaces() => _nbPlaces != null;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _image = snapshotData['image'] as String?;
    _villeDepart = snapshotData['ville_depart'] as String?;
    _destination = snapshotData['destination'] as String?;
    _description = snapshotData['description'] as String?;
    _dateDepart = snapshotData['date_depart'] as DateTime?;
    _dateRetour = snapshotData['date_retour'] as DateTime?;
    _prix = castToType<double>(snapshotData['prix']);
    _offre = snapshotData['offre'] as DocumentReference?;
    _nbPlaces = castToType<int>(snapshotData['nb_places']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('voyage');

  static Stream<VoyageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VoyageRecord.fromSnapshot(s));

  static Future<VoyageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VoyageRecord.fromSnapshot(s));

  static VoyageRecord fromSnapshot(DocumentSnapshot snapshot) => VoyageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VoyageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VoyageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VoyageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VoyageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVoyageRecordData({
  String? nom,
  String? image,
  String? villeDepart,
  String? destination,
  String? description,
  DateTime? dateDepart,
  DateTime? dateRetour,
  double? prix,
  DocumentReference? offre,
  int? nbPlaces,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'image': image,
      'ville_depart': villeDepart,
      'destination': destination,
      'description': description,
      'date_depart': dateDepart,
      'date_retour': dateRetour,
      'prix': prix,
      'offre': offre,
      'nb_places': nbPlaces,
    }.withoutNulls,
  );

  return firestoreData;
}

class VoyageRecordDocumentEquality implements Equality<VoyageRecord> {
  const VoyageRecordDocumentEquality();

  @override
  bool equals(VoyageRecord? e1, VoyageRecord? e2) {
    return e1?.nom == e2?.nom &&
        e1?.image == e2?.image &&
        e1?.villeDepart == e2?.villeDepart &&
        e1?.destination == e2?.destination &&
        e1?.description == e2?.description &&
        e1?.dateDepart == e2?.dateDepart &&
        e1?.dateRetour == e2?.dateRetour &&
        e1?.prix == e2?.prix &&
        e1?.offre == e2?.offre &&
        e1?.nbPlaces == e2?.nbPlaces;
  }

  @override
  int hash(VoyageRecord? e) => const ListEquality().hash([
        e?.nom,
        e?.image,
        e?.villeDepart,
        e?.destination,
        e?.description,
        e?.dateDepart,
        e?.dateRetour,
        e?.prix,
        e?.offre,
        e?.nbPlaces
      ]);

  @override
  bool isValidKey(Object? o) => o is VoyageRecord;
}
