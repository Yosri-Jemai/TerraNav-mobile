import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostRecord extends FirestoreRecord {
  PostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "nb_commentaires" field.
  int? _nbCommentaires;
  int get nbCommentaires => _nbCommentaires ?? 0;
  bool hasNbCommentaires() => _nbCommentaires != null;

  // "nb_reactions" field.
  int? _nbReactions;
  int get nbReactions => _nbReactions ?? 0;
  bool hasNbReactions() => _nbReactions != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _description = snapshotData['description'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _nbCommentaires = castToType<int>(snapshotData['nb_commentaires']);
    _nbReactions = castToType<int>(snapshotData['nb_reactions']);
    _user = snapshotData['user'] as DocumentReference?;
    _likes = getDataList(snapshotData['likes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post');

  static Stream<PostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostRecord.fromSnapshot(s));

  static Future<PostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostRecord.fromSnapshot(s));

  static PostRecord fromSnapshot(DocumentSnapshot snapshot) => PostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostRecordData({
  String? image,
  String? description,
  DateTime? date,
  int? nbCommentaires,
  int? nbReactions,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'description': description,
      'date': date,
      'nb_commentaires': nbCommentaires,
      'nb_reactions': nbReactions,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostRecordDocumentEquality implements Equality<PostRecord> {
  const PostRecordDocumentEquality();

  @override
  bool equals(PostRecord? e1, PostRecord? e2) {
    const listEquality = ListEquality();
    return e1?.image == e2?.image &&
        e1?.description == e2?.description &&
        e1?.date == e2?.date &&
        e1?.nbCommentaires == e2?.nbCommentaires &&
        e1?.nbReactions == e2?.nbReactions &&
        e1?.user == e2?.user &&
        listEquality.equals(e1?.likes, e2?.likes);
  }

  @override
  int hash(PostRecord? e) => const ListEquality().hash([
        e?.image,
        e?.description,
        e?.date,
        e?.nbCommentaires,
        e?.nbReactions,
        e?.user,
        e?.likes
      ]);

  @override
  bool isValidKey(Object? o) => o is PostRecord;
}
