import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransportRecord extends FirestoreRecord {
  TransportRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "trajet" field.
  DocumentReference? _trajet;
  DocumentReference? get trajet => _trajet;
  bool hasTrajet() => _trajet != null;

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "capacite" field.
  int? _capacite;
  int get capacite => _capacite ?? 0;
  bool hasCapacite() => _capacite != null;

  // "prix" field.
  double? _prix;
  double get prix => _prix ?? 0.0;
  bool hasPrix() => _prix != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "contact" field.
  String? _contact;
  String get contact => _contact ?? '';
  bool hasContact() => _contact != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _trajet = snapshotData['trajet'] as DocumentReference?;
    _nom = snapshotData['nom'] as String?;
    _type = snapshotData['type'] as String?;
    _capacite = castToType<int>(snapshotData['capacite']);
    _prix = castToType<double>(snapshotData['prix']);
    _user = snapshotData['user'] as DocumentReference?;
    _contact = snapshotData['contact'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transport');

  static Stream<TransportRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransportRecord.fromSnapshot(s));

  static Future<TransportRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransportRecord.fromSnapshot(s));

  static TransportRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransportRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransportRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransportRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransportRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransportRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransportRecordData({
  DocumentReference? trajet,
  String? nom,
  String? type,
  int? capacite,
  double? prix,
  DocumentReference? user,
  String? contact,
  String? description,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'trajet': trajet,
      'nom': nom,
      'type': type,
      'capacite': capacite,
      'prix': prix,
      'user': user,
      'contact': contact,
      'description': description,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransportRecordDocumentEquality implements Equality<TransportRecord> {
  const TransportRecordDocumentEquality();

  @override
  bool equals(TransportRecord? e1, TransportRecord? e2) {
    return e1?.trajet == e2?.trajet &&
        e1?.nom == e2?.nom &&
        e1?.type == e2?.type &&
        e1?.capacite == e2?.capacite &&
        e1?.prix == e2?.prix &&
        e1?.user == e2?.user &&
        e1?.contact == e2?.contact &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image;
  }

  @override
  int hash(TransportRecord? e) => const ListEquality().hash([
        e?.trajet,
        e?.nom,
        e?.type,
        e?.capacite,
        e?.prix,
        e?.user,
        e?.contact,
        e?.description,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is TransportRecord;
}
