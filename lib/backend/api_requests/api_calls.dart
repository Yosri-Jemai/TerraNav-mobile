import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start BF - emailconfirmationreservationsemail Group Code

class BFEmailconfirmationreservationsemailGroup {
  static String getBaseUrl() => 'https://api.mymemory.translated.net/get';
  static Map<String, String> headers = {};
  static EmailconfirmationreservationsemailCall
      emailconfirmationreservationsemailCall =
      EmailconfirmationreservationsemailCall();
}

class EmailconfirmationreservationsemailCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? attachmentLink = '',
    String? attachmentName = '',
    String? name = '',
    String? total = '',
  }) async {
    final baseUrl = BFEmailconfirmationreservationsemailGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "sk-bf-a5675e68-d545-4e1a-9707-597ebc2c2c1d": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'emailconfirmationreservationsemail',
      apiUrl:
          '${baseUrl}/email?templateId=Kw3b445u5j212UDZ3L7u&to=${to}&subject=${subject}&attachmentLink=${attachmentLink}&attachmentName=${attachmentName}&name=${name}&total=${total}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End BF - emailconfirmationreservationsemail Group Code

/// Start BF - email Group Code

class BFEmailGroup {
  static String getBaseUrl() => 'https://api.backendflow.io/v1';
  static Map<String, String> headers = {};
  static EmailAjoutVoyageCall emailAjoutVoyageCall = EmailAjoutVoyageCall();
}

class EmailAjoutVoyageCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? attachmentLink = '',
    String? attachmentName = '',
    String? userName = '',
    String? nomVoyage = '',
    String? destination = '',
    String? dateDepart = '',
    String? description = '',
    String? username2 = '',
  }) async {
    final baseUrl = BFEmailGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "sk-bf-4af2af21-db69-4fda-86eb-030530caeb93": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'emailAjoutVoyage',
      apiUrl:
          '${baseUrl}/email?templateId=y149jOnLdkvIBzODJrxu&to=${to}&subject=${subject}&attachmentLink=${attachmentLink}&attachmentName=${attachmentName}&UserName=${userName}&NomVoyage=${nomVoyage}&Destination=${destination}&DateDepart=${dateDepart}&Description=${description}&username2=${username2}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End BF - email Group Code

/// Start BF - pdfgenPolitiquesTerraNav Group Code

class BFPdfgenPolitiquesTerraNavGroup {
  static String getBaseUrl() => 'https://api.backendflow.io/v1';
  static Map<String, String> headers = {};
  static PdfgenPolitiquesTerraNavCall pdfgenPolitiquesTerraNavCall =
      PdfgenPolitiquesTerraNavCall();
}

class PdfgenPolitiquesTerraNavCall {
  Future<ApiCallResponse> call({
    String? orientation = '',
    String? pageSize = '',
    String? nom = '',
  }) async {
    final baseUrl = BFPdfgenPolitiquesTerraNavGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "sk-bf-4af2af21-db69-4fda-86eb-030530caeb93": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'pdfgenPolitiquesTerraNav',
      apiUrl:
          '${baseUrl}/pdfgen?templateId=BFx6Bvbx0Rw6iBPoxDS8&orientation=${orientation}&pageSize=${pageSize}&Nom=${nom}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End BF - pdfgenPolitiquesTerraNav Group Code

/// Start BF - emailComment Group Code

class BFEmailCommentGroup {
  static String getBaseUrl() => 'https://api.backendflow.io/v1';
  static Map<String, String> headers = {};
  static EmailCommentCall emailCommentCall = EmailCommentCall();
}

class EmailCommentCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? attachmentLink = '',
    String? attachmentName = '',
  }) async {
    final baseUrl = BFEmailCommentGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "sk-bf-021c126a-4510-44fe-bdfd-894aded1bbd8": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'emailComment',
      apiUrl:
          '${baseUrl}/email?templateId=xbJZEQ31FxIV8XhWeBuf&to=${to}&subject=${subject}&attachmentLink=${attachmentLink}&attachmentName=${attachmentName}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End BF - emailComment Group Code

/// Start BF - emailconfirmation Group Code

class BFEmailconfirmationGroup {
  static String getBaseUrl() => 'https://api.backendflow.io/v1';
  static Map<String, String> headers = {};
  static EmailconfirmationCall emailconfirmationCall = EmailconfirmationCall();
}

class EmailconfirmationCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? attachmentLink = '',
    String? attachmentName = '',
    String? name = '',
    String? total = '',
  }) async {
    final baseUrl = BFEmailconfirmationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "sk-bf-43301713-e859-48c2-a8ec-cb5b833abc95": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'emailconfirmation',
      apiUrl:
          '${baseUrl}/email?templateId=bNPM6XMidRryEMig9Unb&to=${to}&subject=${subject}&attachmentLink=${attachmentLink}&attachmentName=${attachmentName}&name=${name}&total=${total}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End BF - emailconfirmation Group Code

/// Start BF - pdfgenreservationpdf Group Code

class BFPdfgenreservationpdfGroup {
  static String getBaseUrl() => 'https://api.backendflow.io/v1';
  static Map<String, String> headers = {};
  static PdfgenreservationpdfCall pdfgenreservationpdfCall =
      PdfgenreservationpdfCall();
}

class PdfgenreservationpdfCall {
  Future<ApiCallResponse> call({
    String? orientation = '',
    String? pageSize = '',
    String? type = '',
    String? dateAffectation = '',
    String? titre = '',
    String? localisation = '',
    String? date = '',
    String? nombre = '',
    String? prix = '',
  }) async {
    final baseUrl = BFPdfgenreservationpdfGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "sk-bf-a5675e68-d545-4e1a-9707-597ebc2c2c1d": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'pdfgenreservationpdf',
      apiUrl:
          '${baseUrl}/pdfgen?templateId=FaR5ML5mSfVBXA1R1htX&orientation=${orientation}&pageSize=${pageSize}&type=${type}&dateAffectation=${dateAffectation}&titre=${titre}&localisation=${localisation}&date=${date}&nombre=${nombre}&prix=${prix}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End BF - pdfgenreservationpdf Group Code

/// Start BF - csvExport Group Code

class BFCsvExportGroup {
  static String getBaseUrl() => 'https://api.backendflow.io/v1';
  static Map<String, String> headers = {};
  static CsvExportCall csvExportCall = CsvExportCall();
}

class CsvExportCall {
  Future<ApiCallResponse> call({
    String? collectionName = '',
    String? fields = '',
    String? orderBy = '',
    String? limit = '',
  }) async {
    final baseUrl = BFCsvExportGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "sk-bf-4af2af21-db69-4fda-86eb-030530caeb93": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'csvExport',
      apiUrl:
          '${baseUrl}/csvExport?collectionName=${collectionName}&fields=${fields}&orderBy=${orderBy}&limit=${limit}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End BF - csvExport Group Code

class UploadImageToImgbbCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? image,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Upload Image to imgbb',
      apiUrl:
          'https://api.imgbb.com/1/upload?key=ea7caa2f8f6e3e2aaa498609828ce791',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic imageURL(dynamic response) => getJsonField(
        response,
        r'''$.data.url''',
      );
}

class BadWordsCall {
  static Future<ApiCallResponse> call({
    String? text = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'bad words',
      apiUrl:
          'https://profanity-filter-by-api-ninjas.p.rapidapi.com/v1/profanityfilter',
      callType: ApiCallType.GET,
      headers: {
        'x-rapidapi-host': 'profanity-filter-by-api-ninjas.p.rapidapi.com',
        'x-rapidapi-key': '8e4bd3c308mshe303c70d022399ap1edfb2jsn2516404e83b3',
      },
      params: {
        'text': text,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GeoCall {
  static Future<ApiCallResponse> call({
    String? lat = '36.800497',
    String? lon = '10.1805561',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'geo',
      apiUrl:
          'https://api.api-ninjas.com/v1/reversegeocoding?lat=${lat}&lon=${lon}',
      callType: ApiCallType.GET,
      headers: {
        'X-Api-Key': 'ccjkbWTIyVeelWPLd7v7mg==r6Q4IzdQT2cvIyqW',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ExchangeCall {
  static Future<ApiCallResponse> call({
    String? to = 'EUR',
    String? from = 'TND',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Exchange',
      apiUrl:
          'https://api.fastforex.io/fetch-one?api_key=0305e9f7b8-a25a834cde-ssnqaa&to=${to}&from=${from}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? ratio(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.result.EUR''',
      ));
  static String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.base''',
      ));
}

class TraductionCall {
  static Future<ApiCallResponse> call({
    String? q = '',
    String? langpair = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Traduction',
      apiUrl: 'https://api.mymemory.translated.net/get',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'q': q,
        'langpair': langpair,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
