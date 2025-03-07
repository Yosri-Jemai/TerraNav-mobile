import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double prixCount(
  double prix,
  int count,
) {
  return prix * count;
}

int updatedPlaces(
  int nouveauPlaces,
  int placesVoyage,
  int ancientPlaces,
) {
  placesVoyage += ancientPlaces;
  placesVoyage -= nouveauPlaces;
  return placesVoyage;
}

int newPlacesVoyage(
  int placesVoyage,
  int placesReserves,
) {
  return placesVoyage - placesReserves;
}

int returnNbPlacesVoyage(
  int nbReserves,
  int nbPlaceVoyage,
) {
  return nbReserves + nbPlaceVoyage;
}

DocumentReference getOffreRef(String? offreNom) {
  return FirebaseFirestore.instance.collection('offre').doc(offreNom);
}

bool disponibiliteChambre(
  String dateRes,
  int nbJoursReserve,
) {
  DateFormat format =
      DateFormat.MMMEd('en_US'); // Parse the "Jan 1, 2024" format
  DateTime start = format.parse(dateRes); // Convert to DateTime
  DateTime expiryDate =
      start.add(Duration(days: nbJoursReserve)); // Add reservation days
  DateTime today = DateTime.now(); // Get today's date

  return today.isAfter(expiryDate); // Return true if expired
}

double? newCustomFunction(
  double? prixInitial,
  double? reduction,
) {
  // Calculer le prix après réduction
  double prixApresReduction = prixInitial! * (1 - (reduction! / 100));

  // Retourner le prix après réduction
  return prixApresReduction;
}

DocumentReference? convertStringDocRef(String? path) {
  return FirebaseFirestore.instance.doc(path!);
}

double? exchangefunction(
  double? amount,
  double? rate,
) {
  return amount! * rate!;
}
