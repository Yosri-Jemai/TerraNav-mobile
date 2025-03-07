// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class OffreStruct extends FFFirebaseStruct {
  OffreStruct({
    double? price,
    String? name,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _price = price,
        _name = name,
        _description = description,
        super(firestoreUtilData);

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static OffreStruct fromMap(Map<String, dynamic> data) => OffreStruct(
        price: castToType<double>(data['price']),
        name: data['name'] as String?,
        description: data['description'] as String?,
      );

  static OffreStruct? maybeFromMap(dynamic data) =>
      data is Map ? OffreStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'price': _price,
        'name': _name,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static OffreStruct fromSerializableMap(Map<String, dynamic> data) =>
      OffreStruct(
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OffreStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OffreStruct &&
        price == other.price &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([price, name, description]);
}

OffreStruct createOffreStruct({
  double? price,
  String? name,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OffreStruct(
      price: price,
      name: name,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OffreStruct? updateOffreStruct(
  OffreStruct? offre, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    offre
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOffreStructData(
  Map<String, dynamic> firestoreData,
  OffreStruct? offre,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (offre == null) {
    return;
  }
  if (offre.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && offre.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final offreData = getOffreFirestoreData(offre, forFieldValue);
  final nestedData = offreData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = offre.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOffreFirestoreData(
  OffreStruct? offre, [
  bool forFieldValue = false,
]) {
  if (offre == null) {
    return {};
  }
  final firestoreData = mapToFirestore(offre.toMap());

  // Add any Firestore field values
  offre.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOffreListFirestoreData(
  List<OffreStruct>? offres,
) =>
    offres?.map((e) => getOffreFirestoreData(e, true)).toList() ?? [];
