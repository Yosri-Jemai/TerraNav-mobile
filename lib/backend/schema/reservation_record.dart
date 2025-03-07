import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservationRecord extends FirestoreRecord {
  ReservationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "voyage" field.
  DocumentReference? _voyage;
  DocumentReference? get voyage => _voyage;
  bool hasVoyage() => _voyage != null;

  // "transport" field.
  DocumentReference? _transport;
  DocumentReference? get transport => _transport;
  bool hasTransport() => _transport != null;

  // "chambre" field.
  DocumentReference? _chambre;
  DocumentReference? get chambre => _chambre;
  bool hasChambre() => _chambre != null;

  // "places_voyage" field.
  int? _placesVoyage;
  int get placesVoyage => _placesVoyage ?? 0;
  bool hasPlacesVoyage() => _placesVoyage != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "prix" field.
  double? _prix;
  double get prix => _prix ?? 0.0;
  bool hasPrix() => _prix != null;

  // "panier" field.
  DocumentReference? _panier;
  DocumentReference? get panier => _panier;
  bool hasPanier() => _panier != null;

  // "dateReservation" field.
  DateTime? _dateReservation;
  DateTime? get dateReservation => _dateReservation;
  bool hasDateReservation() => _dateReservation != null;

  // "jours_hebergement" field.
  int? _joursHebergement;
  int get joursHebergement => _joursHebergement ?? 0;
  bool hasJoursHebergement() => _joursHebergement != null;

  void _initializeFields() {
    _voyage = snapshotData['voyage'] as DocumentReference?;
    _transport = snapshotData['transport'] as DocumentReference?;
    _chambre = snapshotData['chambre'] as DocumentReference?;
    _placesVoyage = castToType<int>(snapshotData['places_voyage']);
    _type = snapshotData['type'] as String?;
    _prix = castToType<double>(snapshotData['prix']);
    _panier = snapshotData['panier'] as DocumentReference?;
    _dateReservation = snapshotData['dateReservation'] as DateTime?;
    _joursHebergement = castToType<int>(snapshotData['jours_hebergement']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservation');

  static Stream<ReservationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservationRecord.fromSnapshot(s));

  static Future<ReservationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservationRecord.fromSnapshot(s));

  static ReservationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservationRecordData({
  DocumentReference? voyage,
  DocumentReference? transport,
  DocumentReference? chambre,
  int? placesVoyage,
  String? type,
  double? prix,
  DocumentReference? panier,
  DateTime? dateReservation,
  int? joursHebergement,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'voyage': voyage,
      'transport': transport,
      'chambre': chambre,
      'places_voyage': placesVoyage,
      'type': type,
      'prix': prix,
      'panier': panier,
      'dateReservation': dateReservation,
      'jours_hebergement': joursHebergement,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservationRecordDocumentEquality implements Equality<ReservationRecord> {
  const ReservationRecordDocumentEquality();

  @override
  bool equals(ReservationRecord? e1, ReservationRecord? e2) {
    return e1?.voyage == e2?.voyage &&
        e1?.transport == e2?.transport &&
        e1?.chambre == e2?.chambre &&
        e1?.placesVoyage == e2?.placesVoyage &&
        e1?.type == e2?.type &&
        e1?.prix == e2?.prix &&
        e1?.panier == e2?.panier &&
        e1?.dateReservation == e2?.dateReservation &&
        e1?.joursHebergement == e2?.joursHebergement;
  }

  @override
  int hash(ReservationRecord? e) => const ListEquality().hash([
        e?.voyage,
        e?.transport,
        e?.chambre,
        e?.placesVoyage,
        e?.type,
        e?.prix,
        e?.panier,
        e?.dateReservation,
        e?.joursHebergement
      ]);

  @override
  bool isValidKey(Object? o) => o is ReservationRecord;
}
