import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrajetRecord extends FirestoreRecord {
  TrajetRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "point_depart" field.
  String? _pointDepart;
  String get pointDepart => _pointDepart ?? '';
  bool hasPointDepart() => _pointDepart != null;

  // "duree" field.
  double? _duree;
  double get duree => _duree ?? 0.0;
  bool hasDuree() => _duree != null;

  // "destination" field.
  String? _destination;
  String get destination => _destination ?? '';
  bool hasDestination() => _destination != null;

  // "date_depart" field.
  DateTime? _dateDepart;
  DateTime? get dateDepart => _dateDepart;
  bool hasDateDepart() => _dateDepart != null;

  void _initializeFields() {
    _pointDepart = snapshotData['point_depart'] as String?;
    _duree = castToType<double>(snapshotData['duree']);
    _destination = snapshotData['destination'] as String?;
    _dateDepart = snapshotData['date_depart'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trajet');

  static Stream<TrajetRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TrajetRecord.fromSnapshot(s));

  static Future<TrajetRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TrajetRecord.fromSnapshot(s));

  static TrajetRecord fromSnapshot(DocumentSnapshot snapshot) => TrajetRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TrajetRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TrajetRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TrajetRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TrajetRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTrajetRecordData({
  String? pointDepart,
  double? duree,
  String? destination,
  DateTime? dateDepart,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'point_depart': pointDepart,
      'duree': duree,
      'destination': destination,
      'date_depart': dateDepart,
    }.withoutNulls,
  );

  return firestoreData;
}

class TrajetRecordDocumentEquality implements Equality<TrajetRecord> {
  const TrajetRecordDocumentEquality();

  @override
  bool equals(TrajetRecord? e1, TrajetRecord? e2) {
    return e1?.pointDepart == e2?.pointDepart &&
        e1?.duree == e2?.duree &&
        e1?.destination == e2?.destination &&
        e1?.dateDepart == e2?.dateDepart;
  }

  @override
  int hash(TrajetRecord? e) => const ListEquality()
      .hash([e?.pointDepart, e?.duree, e?.destination, e?.dateDepart]);

  @override
  bool isValidKey(Object? o) => o is TrajetRecord;
}
