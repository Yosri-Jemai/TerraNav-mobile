import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentaireRecord extends FirestoreRecord {
  CommentaireRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post" field.
  DocumentReference? _post;
  DocumentReference? get post => _post;
  bool hasPost() => _post != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "contenu" field.
  String? _contenu;
  String get contenu => _contenu ?? '';
  bool hasContenu() => _contenu != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _post = snapshotData['post'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _contenu = snapshotData['contenu'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('commentaire');

  static Stream<CommentaireRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentaireRecord.fromSnapshot(s));

  static Future<CommentaireRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentaireRecord.fromSnapshot(s));

  static CommentaireRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentaireRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentaireRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentaireRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentaireRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentaireRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentaireRecordData({
  DocumentReference? post,
  DateTime? date,
  String? contenu,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post': post,
      'date': date,
      'contenu': contenu,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentaireRecordDocumentEquality implements Equality<CommentaireRecord> {
  const CommentaireRecordDocumentEquality();

  @override
  bool equals(CommentaireRecord? e1, CommentaireRecord? e2) {
    return e1?.post == e2?.post &&
        e1?.date == e2?.date &&
        e1?.contenu == e2?.contenu &&
        e1?.user == e2?.user;
  }

  @override
  int hash(CommentaireRecord? e) =>
      const ListEquality().hash([e?.post, e?.date, e?.contenu, e?.user]);

  @override
  bool isValidKey(Object? o) => o is CommentaireRecord;
}
