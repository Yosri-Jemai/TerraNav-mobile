import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReclamationRecord extends FirestoreRecord {
  ReclamationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sujet" field.
  String? _sujet;
  String get sujet => _sujet ?? '';
  bool hasSujet() => _sujet != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _sujet = snapshotData['sujet'] as String?;
    _description = snapshotData['description'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reclamation');

  static Stream<ReclamationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReclamationRecord.fromSnapshot(s));

  static Future<ReclamationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReclamationRecord.fromSnapshot(s));

  static ReclamationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReclamationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReclamationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReclamationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReclamationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReclamationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReclamationRecordData({
  String? sujet,
  String? description,
  DateTime? date,
  String? status,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sujet': sujet,
      'description': description,
      'date': date,
      'status': status,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReclamationRecordDocumentEquality implements Equality<ReclamationRecord> {
  const ReclamationRecordDocumentEquality();

  @override
  bool equals(ReclamationRecord? e1, ReclamationRecord? e2) {
    return e1?.sujet == e2?.sujet &&
        e1?.description == e2?.description &&
        e1?.date == e2?.date &&
        e1?.status == e2?.status &&
        e1?.user == e2?.user;
  }

  @override
  int hash(ReclamationRecord? e) => const ListEquality()
      .hash([e?.sujet, e?.description, e?.date, e?.status, e?.user]);

  @override
  bool isValidKey(Object? o) => o is ReclamationRecord;
}
