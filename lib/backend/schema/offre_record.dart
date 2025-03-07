import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OffreRecord extends FirestoreRecord {
  OffreRecord._(
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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "date_debut" field.
  DateTime? _dateDebut;
  DateTime? get dateDebut => _dateDebut;
  bool hasDateDebut() => _dateDebut != null;

  // "date_fin" field.
  DateTime? _dateFin;
  DateTime? get dateFin => _dateFin;
  bool hasDateFin() => _dateFin != null;

  // "reduction" field.
  double? _reduction;
  double get reduction => _reduction ?? 0.0;
  bool hasReduction() => _reduction != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _image = snapshotData['image'] as String?;
    _description = snapshotData['description'] as String?;
    _dateDebut = snapshotData['date_debut'] as DateTime?;
    _dateFin = snapshotData['date_fin'] as DateTime?;
    _reduction = castToType<double>(snapshotData['reduction']);
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('offre');

  static Stream<OffreRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OffreRecord.fromSnapshot(s));

  static Future<OffreRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OffreRecord.fromSnapshot(s));

  static OffreRecord fromSnapshot(DocumentSnapshot snapshot) => OffreRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OffreRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OffreRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OffreRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OffreRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOffreRecordData({
  String? nom,
  String? image,
  String? description,
  DateTime? dateDebut,
  DateTime? dateFin,
  double? reduction,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'image': image,
      'description': description,
      'date_debut': dateDebut,
      'date_fin': dateFin,
      'reduction': reduction,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class OffreRecordDocumentEquality implements Equality<OffreRecord> {
  const OffreRecordDocumentEquality();

  @override
  bool equals(OffreRecord? e1, OffreRecord? e2) {
    return e1?.nom == e2?.nom &&
        e1?.image == e2?.image &&
        e1?.description == e2?.description &&
        e1?.dateDebut == e2?.dateDebut &&
        e1?.dateFin == e2?.dateFin &&
        e1?.reduction == e2?.reduction &&
        e1?.user == e2?.user;
  }

  @override
  int hash(OffreRecord? e) => const ListEquality().hash([
        e?.nom,
        e?.image,
        e?.description,
        e?.dateDebut,
        e?.dateFin,
        e?.reduction,
        e?.user
      ]);

  @override
  bool isValidKey(Object? o) => o is OffreRecord;
}
