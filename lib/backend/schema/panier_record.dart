import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PanierRecord extends FirestoreRecord {
  PanierRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "isValidated" field.
  bool? _isValidated;
  bool get isValidated => _isValidated ?? false;
  bool hasIsValidated() => _isValidated != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _isValidated = snapshotData['isValidated'] as bool?;
    _total = castToType<double>(snapshotData['total']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('panier');

  static Stream<PanierRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PanierRecord.fromSnapshot(s));

  static Future<PanierRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PanierRecord.fromSnapshot(s));

  static PanierRecord fromSnapshot(DocumentSnapshot snapshot) => PanierRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PanierRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PanierRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PanierRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PanierRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPanierRecordData({
  DocumentReference? user,
  bool? isValidated,
  double? total,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'isValidated': isValidated,
      'total': total,
    }.withoutNulls,
  );

  return firestoreData;
}

class PanierRecordDocumentEquality implements Equality<PanierRecord> {
  const PanierRecordDocumentEquality();

  @override
  bool equals(PanierRecord? e1, PanierRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.isValidated == e2?.isValidated &&
        e1?.total == e2?.total;
  }

  @override
  int hash(PanierRecord? e) =>
      const ListEquality().hash([e?.user, e?.isValidated, e?.total]);

  @override
  bool isValidKey(Object? o) => o is PanierRecord;
}
