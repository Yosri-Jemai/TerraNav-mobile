import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChambreRecord extends FirestoreRecord {
  ChambreRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hebergement" field.
  DocumentReference? _hebergement;
  DocumentReference? get hebergement => _hebergement;
  bool hasHebergement() => _hebergement != null;

  // "numero" field.
  int? _numero;
  int get numero => _numero ?? 0;
  bool hasNumero() => _numero != null;

  // "disponibilite" field.
  bool? _disponibilite;
  bool get disponibilite => _disponibilite ?? false;
  bool hasDisponibilite() => _disponibilite != null;

  // "prix" field.
  double? _prix;
  double get prix => _prix ?? 0.0;
  bool hasPrix() => _prix != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "Superficie" field.
  double? _superficie;
  double get superficie => _superficie ?? 0.0;
  bool hasSuperficie() => _superficie != null;

  // "Capacite" field.
  int? _capacite;
  int get capacite => _capacite ?? 0;
  bool hasCapacite() => _capacite != null;

  void _initializeFields() {
    _hebergement = snapshotData['hebergement'] as DocumentReference?;
    _numero = castToType<int>(snapshotData['numero']);
    _disponibilite = snapshotData['disponibilite'] as bool?;
    _prix = castToType<double>(snapshotData['prix']);
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _superficie = castToType<double>(snapshotData['Superficie']);
    _capacite = castToType<int>(snapshotData['Capacite']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chambre');

  static Stream<ChambreRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChambreRecord.fromSnapshot(s));

  static Future<ChambreRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChambreRecord.fromSnapshot(s));

  static ChambreRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChambreRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChambreRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChambreRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChambreRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChambreRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChambreRecordData({
  DocumentReference? hebergement,
  int? numero,
  bool? disponibilite,
  double? prix,
  String? description,
  String? image,
  double? superficie,
  int? capacite,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hebergement': hebergement,
      'numero': numero,
      'disponibilite': disponibilite,
      'prix': prix,
      'description': description,
      'image': image,
      'Superficie': superficie,
      'Capacite': capacite,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChambreRecordDocumentEquality implements Equality<ChambreRecord> {
  const ChambreRecordDocumentEquality();

  @override
  bool equals(ChambreRecord? e1, ChambreRecord? e2) {
    return e1?.hebergement == e2?.hebergement &&
        e1?.numero == e2?.numero &&
        e1?.disponibilite == e2?.disponibilite &&
        e1?.prix == e2?.prix &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.superficie == e2?.superficie &&
        e1?.capacite == e2?.capacite;
  }

  @override
  int hash(ChambreRecord? e) => const ListEquality().hash([
        e?.hebergement,
        e?.numero,
        e?.disponibilite,
        e?.prix,
        e?.description,
        e?.image,
        e?.superficie,
        e?.capacite
      ]);

  @override
  bool isValidKey(Object? o) => o is ChambreRecord;
}
