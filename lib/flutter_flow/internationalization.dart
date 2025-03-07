import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? frText = '',
    String? enText = '',
  }) =>
      [frText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // inscription
  {
    'i6tybc8a': {
      'fr': '\n\n\nCréez votre compte pour explorer le monde avec TerraNav!',
      'en': 'Create your account to explore the world with TerraNav!',
    },
    'dlylpp5j': {
      'fr': 'Nom',
      'en': 'Name',
    },
    '06e1k75b': {
      'fr': 'Prénom',
      'en': 'First name',
    },
    'z9ifz7vm': {
      'fr': 'Email',
      'en': 'E-mail',
    },
    'kuidl02f': {
      'fr': 'Mot de passe',
      'en': 'Password',
    },
    'tg7qul09': {
      'fr': 'Téléphone',
      'en': 'Phone',
    },
    'noh0gwqh': {
      'fr': 'Type de compte',
      'en': 'Account Type',
    },
    'eq65zrmy': {
      'fr': 'Rejoindre l\'aventure',
      'en': 'Join the adventure',
    },
    '47f99gmz': {
      'fr': 'Ou continuer avec',
      'en': 'Or continue with',
    },
    'i2j9a986': {
      'fr': 'Déjà voyageur ? ',
      'en': 'Already a traveler?',
    },
    'buvrkerr': {
      'fr': 'Connectez-vous',
      'en': 'Log in',
    },
  },
  // Home_client
  {
    '2d40dmms': {
      'fr': 'Chercher offres ...',
      'en': 'Search offers...',
    },
    '1vyvaprn': {
      'fr': 'Voyages',
      'en': 'Travels',
    },
    'hgp77duy': {
      'fr': 'Voir plus',
      'en': 'See more',
    },
    'nekgu4p6': {
      'fr': '41,000 Avis',
      'en': '41,000 Reviews',
    },
    't0jvrrho': {
      'fr': '4.5',
      'en': '4.5',
    },
    '2w8k0o1c': {
      'fr': 'Italy, Rome',
      'en': 'Italy, Rome',
    },
    'ch7r0vit': {
      'fr': 'Voir plus',
      'en': 'See more',
    },
    'gz9tyd8i': {
      'fr': '27,800 Avis',
      'en': '27,800 Reviews',
    },
    'y89tjmsr': {
      'fr': '4.4',
      'en': '4.4',
    },
    '9gy6uny7': {
      'fr': 'Émirats arabes unis, Dubai',
      'en': 'United Arab Emirates, Dubai',
    },
    'a1w9ynd7': {
      'fr': 'Voir plus',
      'en': 'See more',
    },
    'so8errbs': {
      'fr': '39,500 Avis',
      'en': '39,500 Reviews',
    },
    '4tt3niut': {
      'fr': '3.8',
      'en': '3.8',
    },
    'ucp6erlf': {
      'fr': 'Hébergements',
      'en': 'Accommodations',
    },
    'qwiehl7x': {
      'fr': 'Voir plus',
      'en': 'See more',
    },
    'n02bczai': {
      'fr': '4.8',
      'en': '4.8',
    },
    'xcrrdmmb': {
      'fr': 'L’Hôtel Plaza, New York',
      'en': 'The Plaza Hotel, New York',
    },
    '9k95tpvi': {
      'fr': 'Voir plus',
      'en': 'See more',
    },
    '0qd5il3l': {
      'fr': '13,000 Avis',
      'en': '13,000 Reviews',
    },
    'sf2nxgh2': {
      'fr': '4.5',
      'en': '4.5',
    },
    '2mod8seh': {
      'fr': 'Transports',
      'en': 'Transports',
    },
    '2khnjid8': {
      'fr': 'Parcourez les options de trajets',
      'en': 'Browse the journey options',
    },
    'r462p4i2': {
      'fr': 'Choisir un Trajet',
      'en': 'Choose a Route',
    },
    'tltwbrvw': {
      'fr': 'Réclamations',
      'en': 'Claim',
    },
    'yrt7edl6': {
      'fr': 'Réservations',
      'en': 'Reservations',
    },
    'xzc7c3ea': {
      'fr': 'Agence de voyage',
      'en': 'Travel agency',
    },
    'lvxn9y5x': {
      'fr': 'Agence d\'hebergement',
      'en': 'Hosting agency',
    },
    '8a2ry4v2': {
      'fr': 'Agence de transport',
      'en': 'Transport agency',
    },
    'gr1nrrh9': {
      'fr': 'Chat',
      'en': 'Cat',
    },
    'icypulc8': {
      'fr': 'Logout',
      'en': 'Logout',
    },
    'qej5yppm': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // AjouterVoyage1
  {
    '14qbqc8m': {
      'fr': 'Ville de Depart',
      'en': 'City of Departure',
    },
    'jl9vcpkw': {
      'fr': 'exemple : Tunis',
      'en': 'example: Tunis',
    },
    'bfibusgo': {
      'fr': 'Destination',
      'en': 'Destination',
    },
    'yiue8vg8': {
      'fr': 'exemple : Paris',
      'en': 'example: Paris',
    },
    '6ex814ns': {
      'fr': 'Image voyage',
      'en': 'Travel image',
    },
    'b83y8evi': {
      'fr': 'URL(image)',
      'en': 'URL(image)',
    },
    'j7vhlevc': {
      'fr': 'Nom de voyage',
      'en': 'Travel name',
    },
    'aizz2kyq': {
      'fr': 'Description',
      'en': 'Description',
    },
    'wx2n0l3b': {
      'fr': 'exemple : un voyage sans escale',
      'en': 'example: a non-stop trip',
    },
    'b3wlxscu': {
      'fr': 'Specifiez si ce voyage appartient à un offre',
      'en': 'Specify if this trip belongs to an offer',
    },
    '557qftgm': {
      'fr': 'Aucun offre',
      'en': 'No offers',
    },
    'chl9es4x': {
      'fr': 'Selectionner offre',
      'en': 'Select offer',
    },
    '63cpa2p3': {
      'fr': 'Search...',
      'en': 'Search...',
    },
    'oysorxvu': {
      'fr': 'Date Depart',
      'en': 'Departure Date',
    },
    '0wzxcuzb': {
      'fr': 'Date Retour',
      'en': 'Return Date',
    },
    '55ut93w3': {
      'fr': 'Prix',
      'en': 'Price',
    },
    '8dxwl8i6': {
      'fr': 'TextField',
      'en': 'TextField',
    },
    'bwslgytx': {
      'fr': '0',
      'en': '0',
    },
    '6dygsyrc': {
      'fr': 'Nb places',
      'en': 'Number of places',
    },
    'b6pj7exr': {
      'fr': 'J\'ai lu let j\'accepte ',
      'en': 'I have read and accept',
    },
    '6ow15wzk': {
      'fr': 'les termes et conditions',
      'en': 'terms and conditions',
    },
    'k6jqkod8': {
      'fr': 'Ajouter',
      'en': 'Add',
    },
    'vl2d4eh5': {
      'fr': 'Ville de Depart est obligatoire',
      'en': 'Departure City is required',
    },
    '3qxhm15f': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'zpkkttep': {
      'fr': 'Destination est obligatoire',
      'en': 'Destination is required',
    },
    'hb1no9os': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'jrpoz1i3': {
      'fr': 'Image voyage est obligatoire',
      'en': 'Travel image is required',
    },
    'eehoinbu': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'sp3crvrv': {
      'fr': 'Nom de voyage est obligatoire',
      'en': 'Travel name is required',
    },
    '9hi5z83p': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '6w9pzelq': {
      'fr': 'Description est obligatoire',
      'en': 'Description is required',
    },
    'iethryt2': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'xdxgkfb1': {
      'fr': 'Nb places is required',
      'en': 'Nb places are required',
    },
    '31essfqk': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'vzwu5kx0': {
      'fr': 'Ajouter Voyage',
      'en': 'Add Travel',
    },
    'vqu7v1k8': {
      'fr': 'Veuillez remplir les informations necessaires ',
      'en': 'Please fill in the necessary information',
    },
    '9cdqlclw': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // ajouter_post
  {
    'ysb7mn7q': {
      'fr': 'Ajouter un Post',
      'en': 'Add a Post',
    },
    'pfryu2no': {
      'fr': 'Y a-t-il quelque chose ?',
      'en': 'Is there anything?',
    },
    'pmp5j58a': {
      'fr': 'veuillez remplir ce champ',
      'en': 'Please fill in this field',
    },
    'e1jqk9od': {
      'fr': '10',
      'en': '10',
    },
    'gy1nsp9z': {
      'fr': '1000',
      'en': '1000',
    },
    'xvsy47sf': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '1mc1odgc': {
      'fr': 'Ajouter',
      'en': 'Add',
    },
    '7uwt0gny': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // POST
  {
    'j6547l1m': {
      'fr': 'Liste des Posts',
      'en': 'List of Posts',
    },
    '8gisah8v': {
      'fr': 'Ajouter  une publication ',
      'en': 'Add a post',
    },
    'a4rl1303': {
      'fr': 'New Comment!',
      'en': 'New Comment!',
    },
    'b44rqd31': {
      'fr': '\"You are so awesome! Keep it up!\"',
      'en': '\"You are so awesome! Keep it up!\"',
    },
    't6ab7swk': {
      'fr': '2 hours ago',
      'en': '2 hours ago',
    },
    'wwppqudi': {
      'fr': 'New Comment!',
      'en': 'New Comment!',
    },
    '6b00bs2i': {
      'fr': '\"You are so awesome! Keep it up!\"',
      'en': '\"You are so awesome! Keep it up!\"',
    },
    'wjihr5ws': {
      'fr': '2 hours ago',
      'en': '2 hours ago',
    },
    'fvn7pgen': {
      'fr': 'New Comment!',
      'en': 'New Comment!',
    },
    'o7w1w9wt': {
      'fr': '\"You are so awesome! Keep it up!\"',
      'en': '\"You are so awesome! Keep it up!\"',
    },
    '1eialf42': {
      'fr': '2 hours ago',
      'en': '2 hours ago',
    },
    'xlg4xunm': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // panier
  {
    'mvoct728': {
      'fr': 'Votre panier',
      'en': 'Your cart',
    },
    'aduog4zh': {
      'fr': 'Voyages',
      'en': 'Travels',
    },
    '1f7sptl6': {
      'fr': 'Ci-dessous la liste des articles des voyages.',
      'en': 'Below is the list of travel articles.',
    },
    '0gd6ljha': {
      'fr': 'Date : ',
      'en': 'Date :',
    },
    '5vs4bnrj': {
      'fr': 'Places : ',
      'en': 'Places:',
    },
    'izjlvjlp': {
      'fr': 'Annuler',
      'en': 'Cancel',
    },
    'bo4qu1pe': {
      'fr': 'Modifier',
      'en': 'To modify',
    },
    'wpx9e2sh': {
      'fr': 'Hébergements',
      'en': 'Accommodations',
    },
    'syk6skaz': {
      'fr': 'Ci-dessous la liste des articles d\'hébergements.',
      'en': 'Below is the list of accommodation articles.',
    },
    'meti6yu6': {
      'fr': 'Chambre : ',
      'en': 'Bedroom :',
    },
    'qxxp3aiy': {
      'fr': 'Date : ',
      'en': 'Date :',
    },
    'zjtzphnz': {
      'fr': 'Durée de séjours : ',
      'en': 'Length of stay:',
    },
    'e08iuatl': {
      'fr': 'Annuler',
      'en': 'Cancel',
    },
    '5lok9pxh': {
      'fr': 'Modifier',
      'en': 'To modify',
    },
    'wfawd207': {
      'fr': 'Transports',
      'en': 'Transports',
    },
    'sz8n7j22': {
      'fr': 'Ci-dessous la liste des articles des transports.',
      'en': 'Below is the list of transport articles.',
    },
    'ymfzp4ga': {
      'fr': 'Départ : ',
      'en': 'Departure :',
    },
    '6q89mxq0': {
      'fr': 'Date : ',
      'en': 'Date :',
    },
    'mkrwlxzz': {
      'fr': 'Annuler',
      'en': 'Cancel',
    },
    'c1wmnr0y': {
      'fr': 'Modifier',
      'en': 'To modify',
    },
    '1cadkq6d': {
      'fr': 'Total : ',
      'en': 'Total :',
    },
    '51sf41se': {
      'fr': ' TND',
      'en': '',
    },
    '5eqnpogh': {
      'fr': 'Valider le panier',
      'en': 'Validate the basket',
    },
    '68q9w5ge': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // loginfinal
  {
    'mg7s3q4r': {
      'fr': 'Sign in',
      'en': 'Sign in',
    },
    '74m6i94o': {
      'fr': 'Entrer votre Email',
      'en': 'Enter your Email',
    },
    'n1igf45c': {
      'fr': 'Entrer votre mot de passe',
      'en': 'Enter your password',
    },
    'ixpymnv5': {
      'fr': 'Connecter',
      'en': 'Connect',
    },
    'y1jed7rg': {
      'fr': 'Mot de Passe oubliée ?',
      'en': 'Forgot your password?',
    },
    '62crrp91': {
      'fr': 'Email is required',
      'en': 'Email is required',
    },
    'bn2or7w7': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'o9o4erx8': {
      'fr': 'mot de passe is required',
      'en': 'password is required',
    },
    '9uyf808a': {
      'fr': 'minimum 6 caracter',
      'en': 'minimum 6 characters',
    },
    'ftha93j6': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'z47b1qs3': {
      'fr': 'Sign Up',
      'en': 'Sign Up',
    },
    'j1x6aeks': {
      'fr': 'Entrer votre Nom',
      'en': 'Enter your Name',
    },
    'm12va95m': {
      'fr': 'Entrer votre Adresse',
      'en': 'Enter your address',
    },
    'tlpx6gw8': {
      'fr': 'Entrer votre Email',
      'en': 'Enter your Email',
    },
    'hnewao16': {
      'fr': 'Entrer votr Mot de Passe',
      'en': 'Enter your Password',
    },
    '0r2jn7ar': {
      'fr': 'Telephone',
      'en': 'Phone',
    },
    '5i6mu02u': {
      'fr': 'Voyageur',
      'en': 'Traveler',
    },
    '9jh1plu5': {
      'fr': 'Agence de Voyage',
      'en': 'Travel agency',
    },
    'cyqp5oqs': {
      'fr': 'Agence de Transport',
      'en': 'Transport Agency',
    },
    '4a3j4yq9': {
      'fr': 'Agence d\'hebergement',
      'en': 'Hosting agency',
    },
    'gv2nx85i': {
      'fr': 'Rejoindre l\'aventure',
      'en': 'Join the adventure',
    },
    '0us20t6z': {
      'fr': 'Entrer votre Nom is required',
      'en': 'Enter your Name is required',
    },
    'e5iuoiii': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '1rlv934z': {
      'fr': 'Entrer votre Prenom is required',
      'en': 'Entering your First Name is required',
    },
    'imj8siza': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'mzxo3qji': {
      'fr': 'Entrer votre Email is required',
      'en': 'Entering your Email is required',
    },
    'r6j0bhlg': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '39w2n0bj': {
      'fr': 'Entrer votr Mot de Passe is required',
      'en': 'Enter your password is required',
    },
    '71z47vcy': {
      'fr': 'Minimum 6 caracter',
      'en': 'Minimum 6 characters',
    },
    '28oo905z': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'ipy41h6f': {
      'fr': 'Telephone is required',
      'en': 'Phone is required',
    },
    'x6cjadk9': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'ghjg5qkk': {
      'fr': 'Type de compte is required',
      'en': 'Account type is required',
    },
    'azbt56sr': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'lx4c25g8': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // transports
  {
    'optkarh1': {
      'fr': 'Liste des moyens de transport',
      'en': 'List of means of transport',
    },
    'iws52xif': {
      'fr': 'Choisissez parmi les moyens disponibles à proximité',
      'en': 'Choose from the means available nearby',
    },
    'ivkc415y': {
      'fr': 'Transports disponibles',
      'en': 'Available transportation',
    },
  },
  // DetailsVoyage
  {
    '2ukiz61x': {
      'fr': '->',
      'en': '->',
    },
    'hmwgpygi': {
      'fr': 'Date Depart',
      'en': 'Departure Date',
    },
    'fcg9tgxq': {
      'fr': 'Date retour',
      'en': 'Return date',
    },
    'bgs128rb': {
      'fr': '->',
      'en': '->',
    },
    '7usyo0z7': {
      'fr': 'Prix : ',
      'en': 'Price :',
    },
    '2gt9cd3n': {
      'fr': 'Nb places dispo : ',
      'en': 'Number of places available:',
    },
    'c3y9jpsd': {
      'fr': 'Modifer',
      'en': 'Edit',
    },
    'm67vspxk': {
      'fr': 'supprimer',
      'en': 'DELETE',
    },
  },
  // ListeOffres
  {
    '1m4pfxuq': {
      'fr': 'Liste des offres',
      'en': 'List of offers',
    },
    '6g5u0gxm': {
      'fr': 'Details',
      'en': 'Details',
    },
    '0vxttvfy': {
      'fr': 'remise :',
      'en': 'discount :',
    },
    'vg380mdu': {
      'fr': 'Offre reveillon',
      'en': 'New Year\'s Eve offer',
    },
    'ezadu70f': {
      'fr': 'Details',
      'en': 'Details',
    },
    'a6kqm9yf': {
      'fr': 'remise :',
      'en': 'discount :',
    },
    'am0fticy': {
      'fr': '10%',
      'en': '10%',
    },
    'd0wj5ckb': {
      'fr': 'Offre d\'été',
      'en': 'Summer offer',
    },
    'bfblw35j': {
      'fr': 'Details',
      'en': 'Details',
    },
    '1lwfbf8l': {
      'fr': 'remise : ',
      'en': 'discount :',
    },
    '3sgc0lr8': {
      'fr': '20%',
      'en': '20%',
    },
    'n0blt0jc': {
      'fr': 'Offre Aid Kebir',
      'en': 'Aid Kebir Offer',
    },
    'bks1ijzy': {
      'fr': 'Details',
      'en': 'Details',
    },
    'p5i9oy6s': {
      'fr': 'remise :',
      'en': 'discount :',
    },
    '4u25kl2h': {
      'fr': '40%',
      'en': '40%',
    },
    'wejbjc4l': {
      'fr': '+',
      'en': '+',
    },
    'zggq00ar': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Reservation_Voyage
  {
    'wpfbxi33': {
      'fr': 'Point de depart : ',
      'en': 'Starting point:',
    },
    'n3sd6ue6': {
      'fr': 'Destination         : ',
      'en': 'Destination         :',
    },
    '7gbbbbbw': {
      'fr': 'Date départ        : ',
      'en': 'Departure date:',
    },
    'smbf1w6k': {
      'fr': 'Temps départ    : ',
      'en': 'Departure time:',
    },
    'xg5rsq68': {
      'fr': 'Nombre des places :',
      'en': 'Number of places:',
    },
    'krjp0vgp': {
      'fr': 'Ajouter au panier',
      'en': 'Add to cart',
    },
    'qekpymve': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // reclamation
  {
    'vskhqmnd': {
      'fr': 'Soumettre une réclamation',
      'en': 'Submit a claim',
    },
    'wxxf8s5g': {
      'fr': 'Nous sommes là pour vous aider',
      'en': 'We are here to help you',
    },
    'cpit8zsk': {
      'fr': 'Détails de la réclamation',
      'en': 'Claim Details',
    },
    '35on856s': {
      'fr': 'Sujet',
      'en': 'Subject',
    },
    'prkrq2us': {
      'fr': 'Description détaillée',
      'en': 'Detailed description',
    },
    'cff051uq': {
      'fr': 'selectionner la date',
      'en': 'select date',
    },
    'y94h2rji': {
      'fr': 'Sujet is required',
      'en': 'Subject is required',
    },
    'qv6mckm4': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'qh773psu': {
      'fr': 'Description détaillée is required',
      'en': 'Detailed description is required',
    },
    'kiylftxy': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'y3lgo438': {
      'fr': 'Soumettre la réclamation',
      'en': 'Submit the claim',
    },
    'le2y166c': {
      'fr': 'Mes Réclamations',
      'en': 'My Complaints',
    },
  },
  // Reservation_Hebergement
  {
    'oltu3mgh': {
      'fr': 'Durée de séjours :',
      'en': 'Length of stay:',
    },
    '16jijh06': {
      'fr': 'Ajouter au panier',
      'en': 'Add to cart',
    },
    'x23gppjn': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Reservation_transport
  {
    '01qzm1ia': {
      'fr': 'Nombre des places : ',
      'en': 'Number of places:',
    },
    'az8eay2g': {
      'fr': 'Ajouter au panier',
      'en': 'Add to cart',
    },
    '8184jdxh': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // DetailOffre
  {
    '1ztusyfg': {
      'fr': 'Details',
      'en': 'Details',
    },
    '7tv7gmkt': {
      'fr': 'Offre commence le :  ',
      'en': 'Offer starts on:',
    },
    'ksz8smti': {
      'fr': 'Offre se termine le :  ',
      'en': 'Offer ends:',
    },
    '5euutfzh': {
      'fr': 'Remise',
      'en': 'Discount',
    },
    '8u2pbcir': {
      'fr': 'Modifer',
      'en': 'Edit',
    },
    'shyjw6yv': {
      'fr': 'Supprimer',
      'en': 'DELETE',
    },
    'rvcjwfny': {
      'fr': 'Voir Voyages Proposés',
      'en': 'See Suggested Trips',
    },
    'apdob8mi': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // ListeVoyages
  {
    'ng560qez': {
      'fr': 'Liste des Voyages',
      'en': 'List of Travels',
    },
    'm556dm3z': {
      'fr': 'Details',
      'en': 'Details',
    },
    '7d11t3z0': {
      'fr': 'Prix :',
      'en': 'Price :',
    },
    'x427ithi': {
      'fr': 'Paris',
      'en': 'Paris',
    },
    'uys295r7': {
      'fr': 'Details',
      'en': 'Details',
    },
    '9i7q0jyp': {
      'fr': 'prix : ',
      'en': 'price :',
    },
    '2ttmd253': {
      'fr': '400DT',
      'en': '400DT',
    },
    'otc9z3k6': {
      'fr': 'Mecque',
      'en': 'Mecca',
    },
    '9v5djoxt': {
      'fr': 'Details',
      'en': 'Details',
    },
    'jnx3a48r': {
      'fr': 'prix  : ',
      'en': 'price  :',
    },
    '9cn2swuy': {
      'fr': '350 DT',
      'en': '350 DT',
    },
    'uwocu7b9': {
      'fr': 'Maldives',
      'en': 'Maldives',
    },
    'kpa3goh8': {
      'fr': 'Details',
      'en': 'Details',
    },
    'y0eeseqt': {
      'fr': 'prix :',
      'en': 'price :',
    },
    'hd6dgrld': {
      'fr': '600DT',
      'en': '600DT',
    },
    'nrmjpbqg': {
      'fr': '+',
      'en': '+',
    },
    'hzsjrzto': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // map
  {
    'wyhsjszm': {
      'fr': 'Where to?',
      'en': 'Where to?',
    },
    '53w96eeo': {
      'fr': 'Available Transport',
      'en': 'Available Transport',
    },
    'h79qmnej': {
      'fr': 'Taxi',
      'en': 'Taxi',
    },
    'esglj068': {
      'fr': 'Available now',
      'en': 'Available now',
    },
    'we4nhj1m': {
      'fr': '25 TND',
      'en': '25 TND',
    },
    'cpn1j5w7': {
      'fr': 'Comfortable ride • Up to 4 passengers',
      'en': 'Comfortable ride • Up to 4 passengers',
    },
    'v3j9ltjv': {
      'fr': 'Bus',
      'en': 'Bus',
    },
    'azcwv7lw': {
      'fr': 'Departs in 15 min',
      'en': 'Departures in 15 min',
    },
    '311lb7xv': {
      'fr': '2 TND',
      'en': '2 TND',
    },
    'l7nfgukt': {
      'fr': 'Economic option • Multiple stops',
      'en': 'Economic option • Multiple stops',
    },
    'e5qcpqpm': {
      'fr': 'Uber',
      'en': 'Uber',
    },
    'd314m9lf': {
      'fr': '3 min away',
      'en': '3 min away',
    },
    'u9xmlgn6': {
      'fr': '20 TND',
      'en': '20 TND',
    },
    'ua5ct467': {
      'fr': 'Door to door • Professional driver',
      'en': 'Door to door • Professional driver',
    },
    'qiaqdkum': {
      'fr': 'Confirm Transport',
      'en': 'Confirm Transport',
    },
  },
  // AjouterOffre
  {
    'adjx0qsy': {
      'fr': 'Nom de l\'offre',
      'en': 'Offer Name',
    },
    '66w5svra': {
      'fr': 'Image offre',
      'en': 'Image offer',
    },
    'gwgxk4fi': {
      'fr': 'Description...',
      'en': 'Description...',
    },
    'u6l9l232': {
      'fr': 'Commence le',
      'en': 'Start the',
    },
    'uoezze58': {
      'fr': 'Se termine le',
      'en': 'Ends on',
    },
    'u1ngyde6': {
      'fr': 'Reduction',
      'en': 'Reduction',
    },
    'asxxj2fq': {
      'fr': 'TextField',
      'en': 'TextField',
    },
    'x6ztjy0n': {
      'fr': '0',
      'en': '0',
    },
    'ipoelmr2': {
      'fr': '%',
      'en': '%',
    },
    'u686osvo': {
      'fr': 'J\'ai lu let j\'accepte ',
      'en': 'I have read and accept',
    },
    'o7kybvcs': {
      'fr': 'les termes et conditions',
      'en': 'terms and conditions',
    },
    'e6x09xv9': {
      'fr': 'Ajouter',
      'en': 'Add',
    },
    'gkeh81nk': {
      'fr': 'Nom de voyage is required',
      'en': 'Travel name is required',
    },
    'sa2l94kt': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'ukgotovr': {
      'fr': 'Image voyage is required',
      'en': 'Travel image is required',
    },
    '749eyt78': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '1xuwg47y': {
      'fr': 'Description... is required',
      'en': 'Description... is required',
    },
    '7ul9q1f8': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'hqlp8k2k': {
      'fr': 'reduction is required',
      'en': 'reduction is required',
    },
    'e72mh5hz': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    's9vj3w8z': {
      'fr': 'Ajouter Offre',
      'en': 'Add Offer',
    },
    'pod4f3q7': {
      'fr': 'Veuillez remplir les informations necessaires ',
      'en': 'Please fill in the necessary information',
    },
    't2o4hmkq': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // successTransport
  {
    'uor52q43': {
      'fr': 'Le transport a été ajouté avec succès ! ',
      'en': 'Transport has been added successfully! 🚀',
    },
    '2drba2hq': {
      'fr': 'Retour ',
      'en': 'Back',
    },
    '0hfzzicx': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // ListeHebergement
  {
    'uxpa95we': {
      'fr': 'Bonjour,  avec TerraNav',
      'en': 'Hello, with TerraNav',
    },
    'ypv4rcyg': {
      'fr': 'Gérez vos offres d\'hébergement',
      'en': 'Manage your accommodation offers',
    },
    '63j0s7cm': {
      'fr': 'Aperçu des performances',
      'en': 'Performance Overview',
    },
    '899gm0p1': {
      'fr': '4',
      'en': '4',
    },
    '2mnee8ea': {
      'fr': 'Offres actives',
      'en': 'Active offers',
    },
    '42ilai4q': {
      'fr': '15',
      'en': '15',
    },
    'ryx3p9ar': {
      'fr': 'Vues totales',
      'en': 'Total views',
    },
    'r8ajnvu4': {
      'fr': '10',
      'en': '10',
    },
    'j0uyknuk': {
      'fr': 'Réservations',
      'en': 'Reservations',
    },
    'ewgi15fj': {
      'fr': 'Nouvelle offre',
      'en': 'New offer',
    },
    '1rhet5x8': {
      'fr': 'Disponibilités',
      'en': 'Availability',
    },
    'yfykc3g9': {
      'fr': 'Messages',
      'en': 'Messages',
    },
    'opakswss': {
      'fr': 'Hébergements récents',
      'en': 'Recent accommodations',
    },
    'nrpe1ocg': {
      'fr': 'Voir tout',
      'en': 'See all',
    },
    'kcvcghd3': {
      'fr': 'Villa Océane',
      'en': 'Villa Oceane',
    },
    '3lk4ykv5': {
      'fr': 'Nice, France',
      'en': 'Nice, France',
    },
    '6egb8nop': {
      'fr': '4.9',
      'en': '4.9',
    },
    'v01smx4r': {
      'fr': '• 280 DT/nuit',
      'en': '• 280 DT/night',
    },
    'mgg5fxgc': {
      'fr': 'Chalet Alpin',
      'en': 'Alpine Chalet',
    },
    '66wna4ht': {
      'fr': 'Chamonix, France',
      'en': 'Chamonix, France',
    },
    'fcnq0d3h': {
      'fr': '4.7',
      'en': '4.7',
    },
    'lfk7sduj': {
      'fr': '• 420 DT/nuit',
      'en': '• 420 DT/night',
    },
  },
  // TypesHebergement
  {
    'jflh71o2': {
      'fr': 'Sélectionnez le type d\'hébergement',
      'en': 'Select the type of accommodation',
    },
    '219dgrpr': {
      'fr': 'Hôtels',
      'en': 'Hotels',
    },
    '4e8c0f15': {
      'fr': 'Hébergements de luxe avec service complet',
      'en': 'Full-service luxury accommodations',
    },
    'ibyxe6vr': {
      'fr': 'Airbnb',
      'en': 'Airbnb',
    },
    'ylj72g19': {
      'fr': 'Maisons uniques et séjours privés',
      'en': 'Unique Homes and Private Stays',
    },
    'bdqnexx0': {
      'fr': 'Bungalows',
      'en': 'Bungalows',
    },
    '5esjoil4': {
      'fr': 'Retraites confortables en pleine nature',
      'en': 'Comfortable nature retreats',
    },
    '7j3bu6bw': {
      'fr': 'Capsules',
      'en': 'Capsules',
    },
    'y29f1prn': {
      'fr': 'Micro-hôtels modernes pour des séjours efficaces',
      'en': 'Modern micro-hotels for efficient stays',
    },
    'c2xfum2f': {
      'fr': 'Ajouter un hébergement',
      'en': 'Add accommodation',
    },
    'p6qqfc9m': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // MesHebergements
  {
    'gdqod6tp': {
      'fr': 'Publiés',
      'en': 'Published',
    },
    '02x1xwv0': {
      'fr': 'Brouillons',
      'en': 'Drafts',
    },
    'idle5den': {
      'fr': 'Villa Lumière',
      'en': 'Villa Light',
    },
    '3dertvp4': {
      'fr': '12 Rue des Oliviers, Nice, France',
      'en': '12 Rue des Oliviers, Nice, France',
    },
    '005csud8': {
      'fr': '250 DT',
      'en': '250 DT',
    },
    'dj6nsync': {
      'fr': 'Mis à jour le 12/01/2025',
      'en': 'Updated on 01/12/2025',
    },
    'rvojeb06': {
      'fr': 'Par nuit',
      'en': 'Per night',
    },
    'ba31rgje': {
      'fr': 'Mes hébergements',
      'en': 'My accommodations',
    },
    'bkl4wmxl': {
      'fr': 'My Trips',
      'en': 'My Trips',
    },
  },
  // Ajouter_Commentaire
  {
    'xkeo907p': {
      'fr': 'Ajouter un Commentaire',
      'en': 'Add a Comment',
    },
    'gfjrg1rr': {
      'fr': 'Partagez vos pensées...',
      'en': 'Share your thoughts...',
    },
    'jfr2hu0i': {
      'fr': 'Ajouter',
      'en': 'Add',
    },
    'u8mt6c7d': {
      'fr': 'veuillez remplir ce champ',
      'en': 'Please fill in this field',
    },
    'p7nix6w6': {
      'fr': '10',
      'en': '10',
    },
    'pxs72udl': {
      'fr': '1000',
      'en': '1000',
    },
    'akiylyh1': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // RechercheHebergementPublie
  {
    'uqjek1a3': {
      'fr': 'Rechercher mes hébergements',
      'en': 'Search my accommodations',
    },
    'wnokxao7': {
      'fr': 'Filtrez et gérez vos hébergements partagés en toute simplicité.',
      'en': 'Filter and manage your shared hosting with ease.',
    },
    'saf6mk37': {
      'fr': 'Rechercher par nom ou emplacement',
      'en': 'Search by name or location',
    },
    '4dbh2mjm': {
      'fr': 'Filtres',
      'en': 'Filters',
    },
    'r43odyhl': {
      'fr': 'Type d\'hébergement',
      'en': 'Type of accommodation',
    },
    '6q3eaqh0': {
      'fr': 'Avec piscine',
      'en': 'With swimming pool',
    },
    '8l1svap0': {
      'fr': 'Prix par nuit',
      'en': 'Price per night',
    },
    'mtsxm6ax': {
      'fr': 'Sélectionner l\'emplacement',
      'en': 'Select location',
    },
    '8m4aioce': {
      'fr': 'Commodités',
      'en': 'Amenities',
    },
    'gy5dvr0w': {
      'fr': 'Wi-Fi gratuit',
      'en': 'Free Wi-Fi',
    },
    'ioujwifv': {
      'fr': 'Petit-déjeuner',
      'en': 'Breakfast',
    },
    'bvlj8lkk': {
      'fr': 'Parking',
      'en': 'Parking',
    },
    'xu9bhqmn': {
      'fr': 'Réinitialiser',
      'en': 'Reset',
    },
    '9jmaosse': {
      'fr': '12 hébergements trouvés',
      'en': '12 accommodations found',
    },
    '3j5cf3df': {
      'fr': 'Hôtel Le Magnifique',
      'en': 'The Magnificent Hotel',
    },
    'gdg4gha8': {
      'fr': 'Paris, France',
      'en': 'Paris, France',
    },
    'vj1abhyt': {
      'fr': '250 DT par nuit',
      'en': '250 DT per night',
    },
    '37r1ldsk': {
      'fr': 'Wi-Fi',
      'en': 'Wi-Fi',
    },
    'xzhijasx': {
      'fr': 'Piscine',
      'en': 'Pool',
    },
    'z6rivgj0': {
      'fr': 'Modifier',
      'en': 'To modify',
    },
    'lfpyljem': {
      'fr': 'Supprimer',
      'en': 'DELETE',
    },
    '3xkk73s0': {
      'fr': 'Villa Moderne',
      'en': 'Modern Villa',
    },
    'ndgc1pxq': {
      'fr': 'Nice, France',
      'en': 'Nice, France',
    },
    'egr9ceql': {
      'fr': '180 DT par nuit',
      'en': '180 DT per night',
    },
    '5q5edknq': {
      'fr': 'Parking',
      'en': 'Parking',
    },
    'b3p2bipr': {
      'fr': 'Petit-déjeuner',
      'en': 'Breakfast',
    },
    'u3l6lu81': {
      'fr': 'Modifier',
      'en': 'To modify',
    },
    '1vzwsd4d': {
      'fr': 'Supprimer',
      'en': 'DELETE',
    },
  },
  // AjouterHebergement
  {
    'k1z789v5': {
      'fr': 'Ajouter un Hébergement',
      'en': 'Add an Accommodation',
    },
    'v9anagyy': {
      'fr': 'Remplissez les détails ci-dessous pour ajouter cet hébergement',
      'en': 'Fill in the details below to add this accommodation',
    },
    '0byc8hr6': {
      'fr': 'Informations de base',
      'en': 'Basic information',
    },
    'guxyk7cw': {
      'fr': 'Nom de l\'hébergement',
      'en': 'Name of the accommodation',
    },
    'akelebxp': {
      'fr': 'Pays',
      'en': 'Country',
    },
    'url98nbc': {
      'fr': 'Nombre de chambres',
      'en': 'Number of rooms',
    },
    '1im6t1bc': {
      'fr': 'Sélectionner l\'emplacement',
      'en': 'Select location',
    },
    'rxb9n4t6': {
      'fr': 'Type d\'hébergement',
      'en': 'Type of accommodation',
    },
    'a1finz3o': {
      'fr': 'Select...',
      'en': 'Select...',
    },
    '5ejdhnfl': {
      'fr': 'Search...',
      'en': 'Search...',
    },
    'yw24fe9n': {
      'fr': 'Hôtels',
      'en': 'Hotels',
    },
    '4wmhsobl': {
      'fr': 'Airbnb',
      'en': 'Airbnb',
    },
    'yd0fb4x2': {
      'fr': 'Bungalows',
      'en': 'Bungalows',
    },
    'vo53mdp7': {
      'fr': 'Capsules',
      'en': 'Capsules',
    },
    '1tnsjl3d': {
      'fr': 'Photos et Description',
      'en': 'Photos and Description',
    },
    'fo06w4u6': {
      'fr': 'Ajouter des photos',
      'en': 'Add photos',
    },
    'riyzku4z': {
      'fr': 'Description',
      'en': 'Description',
    },
    '79qhl43f': {
      'fr': 'Améliorer la description avec l\'IA',
      'en': 'Improving description with AI',
    },
    '6t6a0hbk': {
      'fr': 'Politique d\'Annulation',
      'en': 'Cancellation Policy',
    },
    'bsnvf5ql': {
      'fr': 'Ajouter l\'hébergement',
      'en': 'Add accommodation',
    },
  },
  // Details_Post
  {
    'y4x21kzx': {
      'fr': 'Détails Post',
      'en': 'Post Details',
    },
    'dkv6hvw4': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // ModifierOffre
  {
    'nc76gihl': {
      'fr': 'Nom de l\'offre',
      'en': 'Offer Name',
    },
    'lu5w731d': {
      'fr': 'Image offre',
      'en': 'Image offer',
    },
    'mcisornk': {
      'fr': 'Description...',
      'en': 'Description...',
    },
    'xkpje2zh': {
      'fr': 'Commence le',
      'en': 'Start the',
    },
    '05al4qly': {
      'fr': 'Se termine le',
      'en': 'Ends on',
    },
    '21dqkgba': {
      'fr': 'Reduction',
      'en': 'Reduction',
    },
    '565lu6y8': {
      'fr': 'TextField',
      'en': 'TextField',
    },
    'dd5nk5gg': {
      'fr': '%',
      'en': '%',
    },
    '3y3x433y': {
      'fr': 'J\'ai lu let j\'accepte ',
      'en': 'I have read and accept',
    },
    'lh6iepna': {
      'fr': 'les termes et conditions',
      'en': 'terms and conditions',
    },
    'cco5hg4o': {
      'fr': 'Modifier',
      'en': 'To modify',
    },
    '6fmj1vgt': {
      'fr': 'Nom de voyage is required',
      'en': 'Travel name is required',
    },
    '8tkylf53': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'rss2nqhc': {
      'fr': 'Image voyage is required',
      'en': 'Travel image is required',
    },
    'nn3tr0fw': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'k6wenisj': {
      'fr': 'Ville de Depart is required',
      'en': 'Departure City is required',
    },
    '58j5okte': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'u51b80b2': {
      'fr': 'Destination is required',
      'en': 'Destination is required',
    },
    'xw8rh8av': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '2ofzw4hy': {
      'fr': 'Description... is required',
      'en': 'Description... is required',
    },
    'iukxer8o': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '2hcmqz4q': {
      'fr': '0 is required',
      'en': '0 is required',
    },
    '5ozgmumk': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'c5feo2sm': {
      'fr': 'Modifier Offre X',
      'en': 'Edit Offer X',
    },
    '7o624d94': {
      'fr': 'Veuillez remplir les informations necessaires ',
      'en': 'Please fill in the necessary information',
    },
    'von4dunv': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // ChambreDetails
  {
    'f97jdwev': {
      'fr': 'Château de Saint-Éloi, Bordeaux, France',
      'en': 'Saint-Éloi Castle, Bordeaux, France',
    },
    '690rwxaa': {
      'fr': 'DESCRIPTION',
      'en': 'DESCRIPTION',
    },
    '39uyqyjz': {
      'fr': '156 DT',
      'en': '156 DT',
    },
    '5xqinq69': {
      'fr': '+ TVA',
      'en': '+ VAT',
    },
    'j3g1fxhx': {
      'fr': 'Par nuit',
      'en': 'Per night',
    },
    '6vis14kh': {
      'fr': 'Modifier ',
      'en': 'To modify',
    },
    '4f5biqn4': {
      'fr': 'Supprimer',
      'en': 'DELETE',
    },
    '9712cneu': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // ModifierVoyage
  {
    'u698w26b': {
      'fr': 'Nom de voyage',
      'en': 'Travel name',
    },
    'nmsdmh7j': {
      'fr': 'Ville de Depart',
      'en': 'City of Departure',
    },
    'f0y94jls': {
      'fr': 'entrez le nouveau image path',
      'en': 'enter the new image path',
    },
    'zzxyi0sr': {
      'fr': 'lien URL',
      'en': 'URL link',
    },
    '3q26adg7': {
      'fr': 'Destination',
      'en': 'Destination',
    },
    '2fbzpys1': {
      'fr': 'Description',
      'en': 'Description',
    },
    'uki6rb49': {
      'fr': 'Specifiez si ce voyage appartient à un offre',
      'en': 'Specify if this trip belongs to an offer',
    },
    '161mlum8': {
      'fr': 'Aucun offre',
      'en': 'No offers',
    },
    'jb3fekb8': {
      'fr': 'Selectionner',
      'en': 'Select',
    },
    'bp40tsai': {
      'fr': 'Search...',
      'en': 'Search...',
    },
    '62r9vmjk': {
      'fr': 'Date Depart',
      'en': 'Departure Date',
    },
    '8bwi2tog': {
      'fr': 'Date Retour',
      'en': 'Return Date',
    },
    '6ep0gm55': {
      'fr': 'Prix',
      'en': 'Price',
    },
    '3oj7yvgc': {
      'fr': 'TextField',
      'en': 'TextField',
    },
    'wxu89yv3': {
      'fr': 'Nb places',
      'en': 'Number of places',
    },
    'ismvvm3x': {
      'fr': 'J\'ai lu let j\'accepte ',
      'en': 'I have read and accept',
    },
    'z5y4fzxy': {
      'fr': 'les termes et conditions',
      'en': 'terms and conditions',
    },
    'pxbqvaml': {
      'fr': 'Modifier',
      'en': 'To modify',
    },
    'igl3ucpc': {
      'fr': 'Nom de voyage is required',
      'en': 'Travel name is required',
    },
    'feyet0fx': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'i12tj0y4': {
      'fr': 'Ville de Depart is required',
      'en': 'Departure City is required',
    },
    'eubipvjj': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '2hc4lv48': {
      'fr': 'lien URL is required',
      'en': 'URL link is required',
    },
    'u4z2i98v': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '3t6ysrs6': {
      'fr': 'Destination is required',
      'en': 'Destination is required',
    },
    '3v26k0hm': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '5ydyjbcy': {
      'fr': 'Description... is required',
      'en': 'Description... is required',
    },
    '451l3y21': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'dulym52g': {
      'fr': 'Nb places  is required',
      'en': 'Nb places are required',
    },
    'k41w8uo8': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '0472q59r': {
      'fr': 'Modifier Voyage',
      'en': 'Edit Travel',
    },
    'tctagmw8': {
      'fr': 'Veuillez remplir les informations necessaires ',
      'en': 'Please fill in the necessary information',
    },
    'es4odqja': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Ajoutertransport
  {
    '33dlaxk1': {
      'fr': 'Ajouter transport',
      'en': 'Add transport',
    },
    '34sgww49': {
      'fr': 'Détails du Transport',
      'en': 'Transport Details',
    },
    'q4dttgo7': {
      'fr': 'Nom',
      'en': 'Name',
    },
    'h4dn4wuh': {
      'fr': 'Type Transport',
      'en': 'Type of Transport',
    },
    'gaw8lgye': {
      'fr': 'Search...',
      'en': 'Search...',
    },
    'xaiwzff9': {
      'fr': 'Taxi',
      'en': 'Taxi',
    },
    'wtqtsee6': {
      'fr': 'Uber',
      'en': 'Uber',
    },
    '6bbb9wry': {
      'fr': 'Bus',
      'en': 'Bus',
    },
    'qg28tvfx': {
      'fr': 'Capacité',
      'en': 'Ability',
    },
    'rxrl5eqz': {
      'fr': 'Contact',
      'en': 'Contact',
    },
    '432skcep': {
      'fr': 'Trajet ...',
      'en': 'Route ...',
    },
    't2d694t9': {
      'fr': 'Search...',
      'en': 'Search...',
    },
    'r4rbo4u2': {
      'fr': 'Description ',
      'en': 'Description',
    },
    'ekgrys7z': {
      'fr': 'Prix',
      'en': 'Price',
    },
    'cskjo6hu': {
      'fr': 'Nom is required',
      'en': 'Name is required',
    },
    '8ahwxd81': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '1lzi2m5f': {
      'fr': 'Capacité is required',
      'en': 'Capacity is required',
    },
    'jwd3qmb0': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    't678306r': {
      'fr': 'Contact is required',
      'en': 'Contact is required',
    },
    'zw14t5yc': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'smkvigbf': {
      'fr': 'Description is required',
      'en': 'Description is required',
    },
    'onoo89og': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '5j6g2l0n': {
      'fr': 'Prix is required',
      'en': 'Price is required',
    },
    '21qsb0nm': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'byom3236': {
      'fr': 'Ajouter',
      'en': 'Add',
    },
  },
  // test
  {
    'yn064sjl': {
      'fr': 'Sarah Dupont',
      'en': 'Sarah Dupont',
    },
    'gqdagrd1': {
      'fr': '@sarahdupont',
      'en': '@sarahdupont',
    },
    'rryjd8s6': {
      'fr': 'Informations personnelles',
      'en': 'Personal information',
    },
    'kub1t846': {
      'fr': 'Nom complet',
      'en': 'Full name',
    },
    '9gra7cba': {
      'fr': 'Email',
      'en': 'E-mail',
    },
    '70wxcof8': {
      'fr': 'Téléphone',
      'en': 'Phone',
    },
    'vzb8us53': {
      'fr': 'Sécurité',
      'en': 'Security',
    },
    'is6x0kda': {
      'fr': 'Mot de passe actuel',
      'en': 'Current password',
    },
    'd86pb8eo': {
      'fr': 'Nouveau mot de passe',
      'en': 'New Password',
    },
    'n939avzv': {
      'fr': 'Confirmer le mot de passe',
      'en': 'Confirm password',
    },
    '6i4henf2': {
      'fr': 'Paramètres du compte',
      'en': 'Account settings',
    },
    'nzjasjeo': {
      'fr': 'Enregistrer les modifications',
      'en': 'Save changes',
    },
    'mju0ukdi': {
      'fr': 'Déconnexion',
      'en': 'Logout',
    },
    'kvmkyll8': {
      'fr': 'Supprimer le compte',
      'en': 'Delete account',
    },
  },
  // reclamationDashboard
  {
    'xo1k26da': {
      'fr': 'Réclamations',
      'en': 'Complaints',
    },
    'gic5nxm0': {
      'fr': 'Réclamations',
      'en': 'Complaints',
    },
    'l9666ny3': {
      'fr': 'All',
      'en': 'All',
    },
    '0gar26mv': {
      'fr': 'traité',
      'en': 'treaty',
    },
    'm0tnz7qa': {
      'fr': 'non traité',
      'en': 'untreated',
    },
    'laclaokg': {
      'fr': 'Traiter',
      'en': 'To treat',
    },
    '6pi54yce': {
      'fr': 'Supprimer',
      'en': 'DELETE',
    },
    '3op53qll': {
      'fr': 'Traiter',
      'en': 'To treat',
    },
    '57mtebk8': {
      'fr': 'Supprimer',
      'en': 'DELETE',
    },
    '2t6mrycm': {
      'fr': 'Traiter',
      'en': 'To treat',
    },
    'i0rrgjsb': {
      'fr': 'Supprimer',
      'en': 'DELETE',
    },
  },
  // AjouterTrajet
  {
    'qu99eufs': {
      'fr': 'Ajouter Trajet',
      'en': 'Add Journey',
    },
    '52j6wa03': {
      'fr': 'Détails du Trajet',
      'en': 'Journey Details',
    },
    'czykdhw4': {
      'fr': 'Point Depart',
      'en': 'Starting point',
    },
    'aiu0tfbk': {
      'fr': 'Destination',
      'en': 'Destination',
    },
    'nxvmg11u': {
      'fr': 'Duree',
      'en': 'Duration',
    },
    'n1qtrqw2': {
      'fr': 'Point de Depart is required',
      'en': 'Starting Point is required',
    },
    'phafqigt': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'juw347wo': {
      'fr': 'Destination is required',
      'en': 'Destination is required',
    },
    '5d8120ym': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '4mlj4iru': {
      'fr': 'Duree is required',
      'en': 'Duration is required',
    },
    'dkkiexrw': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'olo6fdht': {
      'fr': 'Ajouter',
      'en': 'Add',
    },
  },
  // Modifiertransport
  {
    'qvyogau7': {
      'fr': 'Modifier Transport',
      'en': 'Edit Transport',
    },
    'fllx3fmq': {
      'fr': 'Détails du Transport',
      'en': 'Transport Details',
    },
    'l8hiymm0': {
      'fr': 'Nom',
      'en': 'Name',
    },
    'tn8vge3r': {
      'fr': 'Type Transport',
      'en': 'Type of Transport',
    },
    '5aimf1s2': {
      'fr': 'Search...',
      'en': 'Search...',
    },
    'm83flbkw': {
      'fr': 'Taxi',
      'en': 'Taxi',
    },
    'dhhw8p7p': {
      'fr': 'Uber',
      'en': 'Uber',
    },
    '5xldx6ya': {
      'fr': 'Bus',
      'en': 'Bus',
    },
    'hweunsqd': {
      'fr': 'mini bus',
      'en': 'mini bus',
    },
    'ykaro1hu': {
      'fr': 'Sujet is required',
      'en': 'Subject is required',
    },
    '3c4jkjb4': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '46sqf4ar': {
      'fr': 'Description détaillée is required',
      'en': 'Detailed description is required',
    },
    '7fpo8gix': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'dirfa5n8': {
      'fr': 'Modifier',
      'en': 'To modify',
    },
  },
  // ListTransport
  {
    'esk7d1g5': {
      'fr': 'Liste Transport',
      'en': 'Transport List',
    },
  },
  // ListTrajet
  {
    '81rwmkrm': {
      'fr': 'Liste Trajet',
      'en': 'Route List',
    },
  },
  // Modifier_Post
  {
    'vt4wclpu': {
      'fr': 'Modifier le Post',
      'en': 'Edit Post',
    },
    'mv545q8a': {
      'fr': 'Y a-t-il quelque chose ?',
      'en': 'Is there anything?',
    },
    '30180kpi': {
      'fr': 'modifier',
      'en': 'to modify',
    },
    'pxqgj1gn': {
      'fr': 'veuillez remplir ce champ',
      'en': 'Please fill in this field',
    },
    'n4bo18o8': {
      'fr': '19',
      'en': '19',
    },
    'jq35wj2g': {
      'fr': '101',
      'en': '101',
    },
    'gsmi3ii1': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '5793y3x6': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // agenceTransportHome
  {
    'pyy004ol': {
      'fr': 'Bienvenue sur TerraNav',
      'en': 'Welcome to TerraNav',
    },
    '2x275i8r': {
      'fr': 'Planifiez et gérez vos déplacements en toute simplicité',
      'en': 'Plan and manage your trips with ease',
    },
    'jqzf3rmc': {
      'fr': 'EN',
      'en': '',
    },
    'tib4659f': {
      'fr': 'FR',
      'en': '',
    },
    'tp8uaepi': {
      'fr': 'Liste des vehicules',
      'en': 'List of vehicles',
    },
    'kn4t68np': {
      'fr': 'Consultez tous les moyens de transport disponibles',
      'en': 'Check out all available means of transportation',
    },
    'u4xbqtvv': {
      'fr': 'Consulter',
      'en': 'To consult',
    },
    '2lmr5wu6': {
      'fr': 'Mes Trajets',
      'en': 'My Journeys',
    },
    '6brfuzcj': {
      'fr': 'Gérez vos itinéraires planifiés',
      'en': 'Manage your planned routes',
    },
    'sygysvo7': {
      'fr': 'Consulter',
      'en': 'To consult',
    },
  },
  // ModiferChambre
  {
    'pfygmbfo': {
      'fr': 'Modifier  une chambre',
      'en': 'Edit a room',
    },
    'rcmlb1pm': {
      'fr': 'Remplissez les détails ci-dessous pour ajouter cet hébergement',
      'en': 'Fill in the details below to add this accommodation',
    },
    'zioj73xb': {
      'fr': 'Informations de base',
      'en': 'Basic information',
    },
    'osvtpj5d': {
      'fr': 'Nom de l\'hébergement',
      'en': 'Name of the accommodation',
    },
    'vva88nqq': {
      'fr': 'Prix par nuit (€)',
      'en': 'Price per night (€)',
    },
    'i8ohzypa': {
      'fr': 'Superficie (m²)',
      'en': 'Area (m²)',
    },
    'npkab9ty': {
      'fr': 'Type et Disponibilité',
      'en': 'Type and Availability',
    },
    'uvr1rr46': {
      'fr': 'Type d\'hébergement',
      'en': 'Type of accommodation',
    },
    '2n4vifoo': {
      'fr': 'Dates de disponibilité',
      'en': 'Availability dates',
    },
    '7e638hhr': {
      'fr': 'Piscine',
      'en': 'Pool',
    },
    '9mpvffe5': {
      'fr': 'Commodités',
      'en': 'Amenities',
    },
    'yp8qdzev': {
      'fr': 'Wi-Fi gratuit',
      'en': 'Free Wi-Fi',
    },
    'dd57i92w': {
      'fr': 'Petit-déjeuner',
      'en': 'Breakfast',
    },
    '2wnu71mh': {
      'fr': 'Parking',
      'en': 'Parking',
    },
    'b7jn18a7': {
      'fr': 'Description',
      'en': 'Photos and Description',
    },
    'kx6eocv4': {
      'fr': 'Description',
      'en': 'Description',
    },
    'qp8sqqur': {
      'fr': 'Enregistrer la modification',
      'en': 'Save change',
    },
  },
  // AjouterChambre
  {
    'qasfz1gn': {
      'fr': 'Ajouter  une chambre',
      'en': 'Add a room',
    },
    '016snrwr': {
      'fr': 'Remplissez les détails ci-dessous pour ajouter cette chambre',
      'en': 'Fill in the details below to add this room',
    },
    '33rparlj': {
      'fr': 'Informations de base',
      'en': 'Basic information',
    },
    'hexrohrn': {
      'fr': 'Nom d\'hébergement',
      'en': 'Hosting Name',
    },
    '60egieoc': {
      'fr': 'Numéro ',
      'en': 'Number',
    },
    'jni2yzzp': {
      'fr': 'Prix par nuit (€)',
      'en': 'Price per night (€)',
    },
    '841ivicg': {
      'fr': 'Superficie (m²)',
      'en': 'Area (m²)',
    },
    'u40b5q5t': {
      'fr': 'Type et Disponibilité',
      'en': 'Type and Availability',
    },
    'fsab4p9h': {
      'fr': 'Capacité',
      'en': 'Ability',
    },
    '9ii0bpmw': {
      'fr': 'Vue',
      'en': 'View',
    },
    'a3zxndcx': {
      'fr': 'Disponibilité',
      'en': 'Availability',
    },
    '24u667t9': {
      'fr': 'Commodités',
      'en': 'Amenities',
    },
    'sqho84le': {
      'fr': 'Wi-Fi gratuit',
      'en': 'Free Wi-Fi',
    },
    'vkvf2ge2': {
      'fr': 'Petit-déjeuner',
      'en': 'Breakfast',
    },
    'th7ywwiu': {
      'fr': 'Parking',
      'en': 'Parking',
    },
    'b7wrbqxt': {
      'fr': 'Photos et Description',
      'en': 'Photos and Description',
    },
    '0l0km3we': {
      'fr': 'Ajouter des photos',
      'en': 'Add photos',
    },
    'm7k7nm3y': {
      'fr': 'Description',
      'en': 'Description',
    },
    'og3cmtwy': {
      'fr': 'Ajouter ',
      'en': 'Add',
    },
  },
  // list_chambres
  {
    '374g1qgp': {
      'fr': 'Chambres',
      'en': 'Rooms',
    },
    'g9v02sx6': {
      'fr': 'Title',
      'en': 'Title',
    },
    'pega34ry': {
      'fr': 'Subtext',
      'en': 'Subtext',
    },
    'p5powrbx': {
      'fr': '\$11.00',
      'en': '\$11.00',
    },
    'v9jzf4s5': {
      'fr': 'Title',
      'en': 'Title',
    },
    'fkvr9u8i': {
      'fr': 'Subtext',
      'en': 'Subtext',
    },
    'r4l86m9b': {
      'fr': '\$11.00',
      'en': '\$11.00',
    },
    'cm0vc0rg': {
      'fr': 'Title',
      'en': 'Title',
    },
    '52a14tdb': {
      'fr': 'Subtext',
      'en': 'Subtext',
    },
    'trsztyvk': {
      'fr': '\$11.00',
      'en': '\$11.00',
    },
    'x5wc1qfa': {
      'fr': 'Title',
      'en': 'Title',
    },
    '9bpwmo8s': {
      'fr': 'Subtext',
      'en': 'Subtext',
    },
    'mmw9xv0d': {
      'fr': '\$11.00',
      'en': '\$11.00',
    },
    '2yhffgp1': {
      'fr': 'Title',
      'en': 'Title',
    },
    'ok4tx9rj': {
      'fr': 'Subtext',
      'en': 'Subtext',
    },
    '61vb1zj2': {
      'fr': '\$11.00',
      'en': '\$11.00',
    },
    'cck8zcj1': {
      'fr': 'Title',
      'en': 'Title',
    },
    'i6elbeh7': {
      'fr': 'Subtext',
      'en': 'Subtext',
    },
    'oy4m9lw0': {
      'fr': '\$11.00',
      'en': '\$11.00',
    },
    'g32fa1zq': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // successTrajet
  {
    'yj4j7yst': {
      'fr': 'Le trajet a été ajouté avec succès ! ',
      'en': 'The trip has been added successfully! 🚀',
    },
    'krp5op2o': {
      'fr': 'Retour ',
      'en': 'Back',
    },
    '3wgi1dhr': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // ModifierTrajet
  {
    'bgg7n8jl': {
      'fr': 'Modifier Trajet',
      'en': 'Edit Route',
    },
    'x5t8tn43': {
      'fr': 'Détails du Trajet',
      'en': 'Journey Details',
    },
    'j7mk2z4e': {
      'fr': 'Point Depart',
      'en': 'Starting point',
    },
    'cy0uatm8': {
      'fr': 'Destination',
      'en': 'Destination',
    },
    'g3oz2hgs': {
      'fr': 'Duree',
      'en': 'Duration',
    },
    'fxbd5qp8': {
      'fr': 'Point de Depart is required',
      'en': 'Starting Point is required',
    },
    'c3qr4cxn': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'fz6p9v96': {
      'fr': 'Destination is required',
      'en': 'Destination is required',
    },
    'isrefk3s': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'bmpnl9ns': {
      'fr': 'Duree is required',
      'en': 'Duration is required',
    },
    'k1lecb2b': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '1amm6ogv': {
      'fr': 'Modifier',
      'en': 'To modify',
    },
  },
  // ListCommentaires
  {
    'emphmoql': {
      'fr': 'Below are comments',
      'en': 'Below are comments',
    },
    'fac4kes6': {
      'fr': 'commentaires',
      'en': 'comments',
    },
    '1239dfr5': {
      'fr': '__',
      'en': '__',
    },
  },
  // ModifierCommentaire
  {
    '0ztguka4': {
      'fr': 'Modifier Commentaire',
      'en': 'Edit Comment',
    },
    'lrn9np2c': {
      'fr': 'Modifier le commentaire',
      'en': 'Edit comment',
    },
    '81hs1m00': {
      'fr': 'Votre commentaire...',
      'en': 'Your comment...',
    },
    'pmfk7c0h': {
      'fr': 'Enregistrer',
      'en': 'Save',
    },
  },
  // chambres
  {
    'hmmc8gor': {
      'fr': 'Réserver une chambre',
      'en': 'Book a room',
    },
    'bp6dlutn': {
      'fr': 'Choisissez parmi les moyens disponibles à proximité',
      'en': 'Choose from the means available nearby',
    },
    'f4r5d7xh': {
      'fr': 'Chambres disponibles',
      'en': 'Rooms available',
    },
    '09c7ok7g': {
      'fr': 'Prix : ',
      'en': 'Price :',
    },
  },
  // Details_Commentaire
  {
    '1c3zog88': {
      'fr': 'Détails Commentaire',
      'en': 'Details Comment',
    },
    'aewssvga': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // successAjoutOffre
  {
    'blzexepn': {
      'fr': 'offre ajouté avec succès ! 🚀',
      'en': 'offer added successfully! 🚀',
    },
    'f55bm0jq': {
      'fr': 'Retour ',
      'en': 'Back',
    },
    'mratd45t': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // ChercherVoyage
  {
    'h32g0vca': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // ChercherVoyage2
  {
    '27ijq8vm': {
      'fr': 'Liste Voyages',
      'en': 'Travel List',
    },
    'y3rvkge8': {
      'fr': 'Chercher un voyage',
      'en': 'Search for a trip',
    },
    '5sl2g1xf': {
      'fr': 'Option 1',
      'en': 'Option 1',
    },
    'cj30eo77': {
      'fr': 'Nombre de resultats',
      'en': 'Number of results',
    },
    'nj0fhn8w': {
      'fr': 'Voir plus',
      'en': 'See more',
    },
    'uajwtt3t': {
      'fr': 'Voir plus',
      'en': 'See more',
    },
    'giir2zl0': {
      'fr': 'Italy, Rome',
      'en': 'Italy, Rome',
    },
    'g85t8x3e': {
      'fr': 'Voir plus',
      'en': 'See more',
    },
    'hlv5p259': {
      'fr': '27,800 Avis',
      'en': '27,800 Reviews',
    },
    'qjtvwiym': {
      'fr': '4.4',
      'en': '4.4',
    },
    'ym74hb2u': {
      'fr': 'Ajouter',
      'en': 'Add',
    },
  },
  // detailVoyage
  {
    'ce895kd2': {
      'fr': 'Voyage :',
      'en': 'Journey :',
    },
    'bj61k1ls': {
      'fr': 'Ville depart',
      'en': 'Departure city',
    },
    'x1z3mmpn': {
      'fr': 'Destination',
      'en': 'Destination',
    },
    '6ucqerj4': {
      'fr': 'Date Depart ',
      'en': 'Departure Date',
    },
    '5v7hivlm': {
      'fr': 'Date retour',
      'en': 'Return date',
    },
    'ghevw6wo': {
      'fr': 'Prix avant reduction',
      'en': 'Price before reduction',
    },
    'rg1eu4hb': {
      'fr': 'offre appliqué',
      'en': 'offer applied',
    },
    'mmgjptc9': {
      'fr': '↓',
      'en': '↓',
    },
    'anwm7a7l': {
      'fr': 'Prix aprés réduction',
      'en': 'Price after reduction',
    },
    '4v9kw9bw': {
      'fr': 'Places disponibles',
      'en': 'Places available',
    },
    'cis05obb': {
      'fr': 'Voyages à destination similaire',
      'en': 'Trips to similar destinations',
    },
    'nl5wio0z': {
      'fr': 'Location, ST',
      'en': 'Location, ST',
    },
    '5p8sjl7l': {
      'fr': 'Card Title',
      'en': 'Card Title',
    },
    'eyhxmalc': {
      'fr': 'Location, ST',
      'en': 'Location, ST',
    },
    'xj4b581c': {
      'fr': 'Card Title',
      'en': 'Card Title',
    },
    'lur5z1fb': {
      'fr': 'Modifier',
      'en': 'To modify',
    },
    'slabmja0': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // detailOffre2
  {
    'f6066xap': {
      'fr': 'Duration ',
      'en': 'Duration',
    },
    'sg11ot63': {
      'fr': 'Date Debut',
      'en': 'Start Date',
    },
    '2vxjzaze': {
      'fr': 'Date Fin',
      'en': 'End Date',
    },
    'kbi1mx7h': {
      'fr': 'reduction',
      'en': 'reduction',
    },
    'tapjrkws': {
      'fr': 'Voyages proposés dans cette offre',
      'en': 'Trips offered in this offer',
    },
    '243avbbt': {
      'fr': 'Location, ST',
      'en': 'Location, ST',
    },
    'sxrga40j': {
      'fr': 'Card Title',
      'en': 'Card Title',
    },
    'm5a6n5tb': {
      'fr': 'Location, ST',
      'en': 'Location, ST',
    },
    '3ihc3nzz': {
      'fr': 'Card Title',
      'en': 'Card Title',
    },
    '1oky07mh': {
      'fr': 'Voir Voyages Proposés',
      'en': 'See Suggested Trips',
    },
    'hcsqlzp4': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // detailReservationVoyage
  {
    'mpdp8ydp': {
      'fr': 'Point de depart : ',
      'en': 'Starting point:',
    },
    'ob8usbx2': {
      'fr': 'Destination         : ',
      'en': 'Destination         :',
    },
    '50krzku3': {
      'fr': 'Date départ        : ',
      'en': 'Departure date:',
    },
    'y1lkngnd': {
      'fr': 'Places reservées   :  ',
      'en': 'Reserved places:',
    },
    'uuaktx6g': {
      'fr': 'Imprimer',
      'en': '',
    },
    'dqprkt3s': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // detailReservationHebergement
  {
    '2dv5mj2g': {
      'fr': 'Date réservation  : ',
      'en': 'Reservation date:',
    },
    'w6twmft9': {
      'fr': 'durée de séjours  : ',
      'en': 'length of stay:',
    },
    'txqjbrtq': {
      'fr': 'Imprimer',
      'en': '',
    },
    'f9haffoe': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // detailReservationTransport
  {
    'i3etglfz': {
      'fr': 'Point de depart  : ',
      'en': 'Starting point:',
    },
    'jkgdqz22': {
      'fr': 'Destination  : ',
      'en': 'Destination  :',
    },
    'md5j85gg': {
      'fr': 'Date départ  : ',
      'en': 'Departure date:',
    },
    '6kg2q3xi': {
      'fr': 'capacité  :  ',
      'en': 'ability  :',
    },
    'j0l3qo2l': {
      'fr': 'Contact  :  ',
      'en': 'Contact  :',
    },
    'bvuhb4hr': {
      'fr': 'Imprimer',
      'en': '',
    },
    '60v41l43': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Mod_Res_Voyage
  {
    '7c35pwqa': {
      'fr': 'Point de depart : ',
      'en': 'Starting point:',
    },
    'lsn8iiuj': {
      'fr': 'Destination         : ',
      'en': 'Destination         :',
    },
    'z9qrt8wo': {
      'fr': 'Date départ        : ',
      'en': 'Departure date:',
    },
    'uytbpesw': {
      'fr': 'Temps départ    : ',
      'en': 'Departure time:',
    },
    'lnht7ost': {
      'fr': 'Temps départ    : ',
      'en': 'Departure time:',
    },
    'kf2piaib': {
      'fr': 'Modifier places  :',
      'en': 'Change places:',
    },
    '2m4nieyu': {
      'fr': 'Modifier reservation',
      'en': 'Modify reservation',
    },
    'b9xvcpc0': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // successAjoutVoyage
  {
    'ils2pnv2': {
      'fr': ' ajouté avec succès ! 🚀',
      'en': 'added successfully! 🚀',
    },
    'c807eoaf': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // successModifVoyage
  {
    '5ljb7075': {
      'fr': ' modifé avec succès ! 🚀',
      'en': 'successfully edited! 🚀',
    },
    'ohwaorgt': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Mod_Rs_Hebergement
  {
    'q01ymn5p': {
      'fr': 'Numero de chambre : ',
      'en': 'Room number:',
    },
    'kwdtzge6': {
      'fr': 'Durée de séjours :',
      'en': 'Length of stay:',
    },
    'at9hwat5': {
      'fr': 'Modifier reservation\n',
      'en': 'Modify reservation',
    },
    'j20yrat6': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // AjouterChambreCode
  {
    'ex8nzlqz': {
      'fr': 'Ajouter  une chambre',
      'en': 'Add a room',
    },
  },
  // Mod_Res_Transport
  {
    'i5rfr59j': {
      'fr': 'Capacite : ',
      'en': 'Ability :',
    },
    'g595os4u': {
      'fr': 'Depart : ',
      'en': 'Departure :',
    },
    'qlig9zi7': {
      'fr': 'Destination : ',
      'en': 'Destination :',
    },
    'x0goky4d': {
      'fr': 'Modifier Reservation',
      'en': 'Modify Reservation',
    },
    'ebqrgp8o': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // maptest
  {
    '9illk4np': {
      'fr': 'Chercher offres ...',
      'en': 'Search offers...',
    },
    '4synqj9d': {
      'fr': 'Voyages',
      'en': 'Travels',
    },
    'qqfo7tup': {
      'fr': 'Voir plus',
      'en': 'See more',
    },
    'bbv5qslu': {
      'fr': '41,000 Avis',
      'en': '41,000 Reviews',
    },
    '1na82tvy': {
      'fr': '4.5',
      'en': '4.5',
    },
    '7q17o920': {
      'fr': 'Italy, Rome',
      'en': 'Italy, Rome',
    },
    '382y0bnq': {
      'fr': 'Voir plus',
      'en': 'See more',
    },
    'zpflhpl6': {
      'fr': '27,800 Avis',
      'en': '27,800 Reviews',
    },
    '8op2dk1v': {
      'fr': '4.4',
      'en': '4.4',
    },
    'nu1yeq29': {
      'fr': 'Émirats arabes unis, Dubai',
      'en': 'United Arab Emirates, Dubai',
    },
    '5s1iatuu': {
      'fr': 'Voir plus',
      'en': 'See more',
    },
    '8u3azkhv': {
      'fr': '39,500 Avis',
      'en': '39,500 Reviews',
    },
    '1rpcia04': {
      'fr': '3.8',
      'en': '3.8',
    },
    '827us87d': {
      'fr': 'Hébergements',
      'en': 'Accommodations',
    },
    '4opjjikc': {
      'fr': 'Voir plus',
      'en': 'See more',
    },
    'd6x56npr': {
      'fr': '4.8',
      'en': '4.8',
    },
    'kids56bv': {
      'fr': 'L’Hôtel Plaza, New York',
      'en': 'The Plaza Hotel, New York',
    },
    'fa4zf8c5': {
      'fr': 'Voir plus',
      'en': 'See more',
    },
    'zn1n800j': {
      'fr': '13,000 Avis',
      'en': '13,000 Reviews',
    },
    '07f1ryxs': {
      'fr': '4.5',
      'en': '4.5',
    },
    'op1hjbi0': {
      'fr': 'Transports',
      'en': 'Transports',
    },
    'v5sd45ze': {
      'fr': 'Choisir votre point de départ',
      'en': 'Choose your starting point',
    },
    'xeoqwb3c': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // ClientReservations
  {
    'qq207s3w': {
      'fr': 'Voyages',
      'en': 'Travels',
    },
    'f8jhirqs': {
      'fr': 'Voir Détails',
      'en': 'See Details',
    },
    'l5oj2vvw': {
      'fr': 'Hébergements',
      'en': 'Accommodations',
    },
    'zvr9sew1': {
      'fr': 'Voir Détails',
      'en': 'See Details',
    },
    'usqc38yp': {
      'fr': 'Transports',
      'en': 'Transports',
    },
    'nyc8b7gm': {
      'fr': 'Voir Détails',
      'en': 'See Details',
    },
    'tl9kazrx': {
      'fr': 'L’Hôtel Plaza, New York',
      'en': 'The Plaza Hotel, New York',
    },
    '9ogizq2l': {
      'fr': 'Voir plus',
      'en': 'See more',
    },
    'jwv31fp2': {
      'fr': '13,000 Avis',
      'en': '13,000 Reviews',
    },
    '3lf0hq5q': {
      'fr': '4.5',
      'en': '4.5',
    },
    '06v6h6ua': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // recovepassword
  {
    'iimb6l1t': {
      'fr': 'Reset Password',
      'en': 'Reset Password',
    },
    'rcvafvgx': {
      'fr':
          'Enter your email address and we\'ll send you instructions to reset your password.',
      'en':
          'Enter your email address and we\'ll send you instructions to reset your password.',
    },
    'zd71ifw6': {
      'fr': 'Email Address',
      'en': 'Email Address',
    },
    'u0yigutk': {
      'fr': 'Enter your email',
      'en': 'Enter your email',
    },
    'gkbsyoyy': {
      'fr': 'Send Reset Instructions',
      'en': 'Send Reset Instructions',
    },
    'tu11ef3s': {
      'fr': 'Having trouble?',
      'en': 'Having trouble?',
    },
    'y89j1w60': {
      'fr': 'If you\'re having trouble resetting your password, you can:',
      'en': 'If you\'re having trouble resetting your password, you can:',
    },
    'q7oaxxhx': {
      'fr': 'Contact Support',
      'en': 'Contact Support',
    },
    'bfk8vs1i': {
      'fr': 'Visit Help Center',
      'en': 'Visit Help Center',
    },
    'cup8dgik': {
      'fr': 'Remember your password? ',
      'en': 'Remember your password?',
    },
    'jcy34xrc': {
      'fr': 'Sign in',
      'en': 'Sign in',
    },
  },
  // acceuilTransport
  {
    'xj1adi9b': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // SuccesAjoutChambre
  {
    '15tp7ift': {
      'fr': 'Chambre ajoutée avec succès ! 🚀',
      'en': 'Room added successfully! 🚀',
    },
    '1er4m4it': {
      'fr': 'Retour ',
      'en': 'Back',
    },
    'sgk9yqur': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // SuccesAjoutHebergement
  {
    '3lxzukki': {
      'fr': 'Hebergement ajoutée avec succès ! 🚀',
      'en': 'Hosting added successfully! 🚀',
    },
    'tt8wdwex': {
      'fr': 'Retour ',
      'en': 'Back',
    },
    '9qrtef9w': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // ListOffres2
  {
    'vu45sad8': {
      'fr': 'Liste Offres',
      'en': 'List of Offers',
    },
  },
  // AjouterChambreCopy
  {
    'baac6cdq': {
      'fr': 'Ajouter  une chambre',
      'en': 'Add a room',
    },
    '9bw8fg4p': {
      'fr': 'Remplissez les détails ci-dessous pour ajouter cette chambre',
      'en': 'Fill in the details below to add this room',
    },
    'j7b60ht6': {
      'fr': 'Informations de base',
      'en': 'Basic information',
    },
    'u9onazvg': {
      'fr': 'Nom d\'hébergement',
      'en': 'Hosting Name',
    },
    '5ftm57g2': {
      'fr': 'Numéro ',
      'en': 'Number',
    },
    '8fiycdla': {
      'fr': 'Prix par nuit (€)',
      'en': 'Price per night (€)',
    },
    'hzfgkcc0': {
      'fr': 'Superficie (m²)',
      'en': 'Area (m²)',
    },
    'lfsnoq93': {
      'fr': 'Type et Disponibilité',
      'en': 'Type and Availability',
    },
    '9zs5la33': {
      'fr': 'Capacité',
      'en': 'Ability',
    },
    '55f1n2vu': {
      'fr': 'Vue',
      'en': 'View',
    },
    'ngj7ov80': {
      'fr': 'Disponibilité',
      'en': 'Availability',
    },
    'f8gntz2d': {
      'fr': 'Commodités',
      'en': 'Amenities',
    },
    '1defsvs7': {
      'fr': 'Wi-Fi gratuit',
      'en': 'Free Wi-Fi',
    },
    'uufh2o6s': {
      'fr': 'Petit-déjeuner',
      'en': 'Breakfast',
    },
    '608b6tuu': {
      'fr': 'Parking',
      'en': 'Parking',
    },
    'sduxnf4f': {
      'fr': 'Photos et Description',
      'en': 'Photos and Description',
    },
    'vf1ax45u': {
      'fr': 'Ajouter des photos',
      'en': 'Add photos',
    },
    'f7vaym9d': {
      'fr': 'Description',
      'en': 'Description',
    },
    'bmgxuob8': {
      'fr': 'Ajouter ',
      'en': 'Add',
    },
  },
  // MesChambres
  {
    'fv4tapyx': {
      'fr': 'Mes chambres',
      'en': 'My rooms',
    },
    '5d8x6u0w': {
      'fr': 'My Trips',
      'en': 'My Trips',
    },
  },
  // ModifierHebergement
  {
    'dkk4ybs7': {
      'fr': 'Modifier un Hébergement',
      'en': 'Modify an Accommodation',
    },
    'su6ts3h2': {
      'fr': 'Remplissez les détails ci-dessous pour ajouter cet hébergement',
      'en': 'Fill in the details below to add this accommodation',
    },
    '5342v5c0': {
      'fr': 'Informations de base',
      'en': 'Basic information',
    },
    '948tozaf': {
      'fr': 'Nom de l\'hébergement',
      'en': 'Name of the accommodation',
    },
    'pvealfm6': {
      'fr': 'Pays',
      'en': 'Country',
    },
    'pdhjkspj': {
      'fr': 'Nombre de chambres',
      'en': 'Number of rooms',
    },
    'jmjdormw': {
      'fr': 'Sélectionner l\'emplacement',
      'en': 'Select location',
    },
    '14kxzf2h': {
      'fr': 'Moyenne',
      'en': 'Average',
    },
    'alhl0qnb': {
      'fr': 'Type d\'hébergement',
      'en': 'Type of accommodation',
    },
    'au62pjpx': {
      'fr': 'Select...',
      'en': 'Select...',
    },
    'gxz00mlc': {
      'fr': 'Search...',
      'en': 'Search...',
    },
    'j7sva40n': {
      'fr': 'Hôtels',
      'en': 'Hotels',
    },
    '1s62ydcm': {
      'fr': 'Airbnb',
      'en': 'Airbnb',
    },
    '1s42lmhv': {
      'fr': 'Bungalows',
      'en': 'Bungalows',
    },
    'ubnuyt7o': {
      'fr': 'Capsules',
      'en': 'Capsules',
    },
    '3hmzrebq': {
      'fr': 'Description',
      'en': 'Description',
    },
    's5fjgbzo': {
      'fr': 'Description',
      'en': 'Description',
    },
    'hmj2admf': {
      'fr': 'Politique d\'Annulation',
      'en': 'Cancellation Policy',
    },
    'ey4l42sp': {
      'fr': 'Modifier l\'hébergement',
      'en': 'Change accommodation',
    },
  },
  // POSTCopy
  {
    '7jrbr6tb': {
      'fr': 'Liste des Posts',
      'en': 'List of Posts',
    },
    'c4uibxib': {
      'fr': 'Ajouter  post ',
      'en': 'Add post',
    },
    'zu99c028': {
      'fr': 'chercher ...',
      'en': 'seek ...',
    },
    'pz4i22wg': {
      'fr': 'resultat de recherche',
      'en': 'search result',
    },
    'v4myb9cq': {
      'fr': '4',
      'en': '4',
    },
    '0fa3edxx': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // mapPage
  {
    '6lry1hz6': {
      'fr': 'Chercher Vehicules',
      'en': 'Search Vehicles',
    },
  },
  // departureselction
  {
    '2xbv97qk': {
      'fr': 'Bienvenue dans Transport !',
      'en': 'Welcome to Transport!',
    },
    'y97hlbfy': {
      'fr': 'Choisissez votre point de départ pour commencer votre voyage.',
      'en': 'Choose your starting point to begin your journey.',
    },
    '2rdjjroc': {
      'fr': 'Choisir votre point de départ',
      'en': 'Choose your starting point',
    },
  },
  // AjouterVoyage1Copy
  {
    'kjlzr0ch': {
      'fr': 'Ville de Depart',
      'en': 'City of Departure',
    },
    'wsd7yrrc': {
      'fr': 'exemple : Tunis',
      'en': 'example: Tunis',
    },
    '0ne40d84': {
      'fr': 'Destination',
      'en': 'Destination',
    },
    'kw0ej8vq': {
      'fr': 'exemple : Paris',
      'en': 'example: Paris',
    },
    'djujudqn': {
      'fr': 'Image voyage',
      'en': 'Travel image',
    },
    'w3sdvgpj': {
      'fr': 'URL(image)',
      'en': 'URL(image)',
    },
    'y4g8j5ma': {
      'fr': 'Nom de voyage',
      'en': 'Travel name',
    },
    '2wady1zj': {
      'fr': 'Description',
      'en': 'Description',
    },
    'w2od5w3c': {
      'fr': 'exemple : un voyage sans escale',
      'en': 'example: a non-stop trip',
    },
    'c286mcdg': {
      'fr': 'Specifiez si ce voyage appartient à un offre',
      'en': 'Specify if this trip belongs to an offer',
    },
    'jn295wrz': {
      'fr': 'Aucun offre',
      'en': 'No offers',
    },
    'rzpjpx1o': {
      'fr': 'Selectionner offre',
      'en': 'Select offer',
    },
    'z7m4r0yo': {
      'fr': 'Search...',
      'en': 'Search...',
    },
    'mumw5ev0': {
      'fr': 'Date Depart',
      'en': 'Departure Date',
    },
    'ktglmypv': {
      'fr': 'Date Retour',
      'en': 'Return Date',
    },
    '3vq1v6w3': {
      'fr': 'Prix',
      'en': 'Price',
    },
    '75f79u7x': {
      'fr': 'TextField',
      'en': 'TextField',
    },
    '7klu8j54': {
      'fr': '0',
      'en': '0',
    },
    '89g6pdp5': {
      'fr': 'Nb places',
      'en': 'Number of places',
    },
    'udc4xpy0': {
      'fr': 'J\'ai lu let j\'accepte ',
      'en': 'I have read and accept',
    },
    'c51jukme': {
      'fr': 'les termes et conditions',
      'en': 'terms and conditions',
    },
    'q1ok6mrk': {
      'fr': 'Ajouter',
      'en': 'Add',
    },
    'ots2n0nw': {
      'fr': 'Ville de Depart est obligatoire',
      'en': 'Departure City is required',
    },
    '5yuwfymw': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'y68xwace': {
      'fr': 'Destination est obligatoire',
      'en': 'Destination is required',
    },
    '1pu126qg': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'ly6183s5': {
      'fr': 'Image voyage est obligatoire',
      'en': 'Travel image is required',
    },
    'e76nt2lm': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'fo40s782': {
      'fr': 'Nom de voyage est obligatoire',
      'en': 'Travel name is required',
    },
    'ov5nokyt': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'a4jq9f8p': {
      'fr': 'Description est obligatoire',
      'en': 'Description is required',
    },
    '7sgrw8cx': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'o81j8im1': {
      'fr': 'Nb places is required',
      'en': 'Nb places are required',
    },
    'lzfq052p': {
      'fr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'kjm4lyyv': {
      'fr': 'Ajouter Voyage',
      'en': 'Add Travel',
    },
    '19bn6z8b': {
      'fr': 'Veuillez remplir les informations necessaires ',
      'en': 'Please fill in the necessary information',
    },
    'z2yx25ti': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // usersClients
  {
    'kf28c6zl': {
      'fr': 'Consulter reservations par Voyageur',
      'en': 'View reservations by Traveler',
    },
    'pnj5l2b3': {
      'fr': 'Chercher un utilisateur',
      'en': 'Search for a user',
    },
    '2qp18zqg': {
      'fr': 'Option 1',
      'en': 'Option 1',
    },
    'wm9jjwjg': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // ReservationsParClient
  {
    '9hln0p4x': {
      'fr': 'Archive de Réservations',
      'en': 'Reservations Archive',
    },
    '2qkry0wb': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // AdminDashboard
  {
    '17v0lrhe': {
      'fr': 'Admin Dashboard',
      'en': 'Admin Dashboard',
    },
    'oopacgz2': {
      'fr': 'Bienvenue sur votre tableau de bord',
      'en': 'Welcome to your dashboard',
    },
    '0ycf4d33': {
      'fr': 'Traiter les reclamations',
      'en': 'Processing complaints',
    },
    'sq0rgts1': {
      'fr': 'Consulter les reservations',
      'en': 'Check reservations',
    },
    '3pih9u1j': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // ChercherVoyage2Copy
  {
    'rgvq34zi': {
      'fr': 'Liste Voyages',
      'en': 'Travel List',
    },
    'kk3d8gt0': {
      'fr': 'Chercher un voyage',
      'en': 'Search for a trip',
    },
    '2ce98ahq': {
      'fr': 'Option 1',
      'en': 'Option 1',
    },
    '87moy3z4': {
      'fr': 'Nombre de resultats',
      'en': 'Number of results',
    },
    'zpcfckm3': {
      'fr': 'Voir plus',
      'en': 'See more',
    },
    'ir97yo3x': {
      'fr': 'Voir plus',
      'en': 'See more',
    },
    '19v4f4ph': {
      'fr': 'Italy, Rome',
      'en': 'Italy, Rome',
    },
    'ad8i50bp': {
      'fr': 'Voir plus',
      'en': 'See more',
    },
    'gzljyxvr': {
      'fr': '27,800 Avis',
      'en': '27,800 Reviews',
    },
    'nwgtczxl': {
      'fr': '4.4',
      'en': '4.4',
    },
    '3npv7xmh': {
      'fr': 'Ajouter',
      'en': 'Add',
    },
  },
  // menutypecompte
  {
    'ergx6x1m': {
      'fr': 'Sélectionnez le type de compte qui décrit le mieux votre rôle.',
      'en': 'Select the account type that best describes your role.',
    },
    'u0zldze6': {
      'fr': 'Voyageur',
      'en': 'Traveler',
    },
    'w36544qe': {
      'fr': 'Agence de Voyage',
      'en': 'Travel agency',
    },
    'e89wzyi2': {
      'fr': 'Agence de Transport',
      'en': 'Transport Agency',
    },
    '0519gz1x': {
      'fr': 'Agence d\'hebergement',
      'en': 'Hosting agency',
    },
  },
  // button
  {
    '4urez51q': {
      'fr': 'Account Type',
      'en': 'Account Type',
    },
  },
  // calendrier1
  {
    'bjfptg27': {
      'fr': 'December 2024',
      'en': 'December 2024',
    },
    'aljwlw8u': {
      'fr': 'Sun',
      'en': 'Sun',
    },
    'sr00h7i2': {
      'fr': 'Mon',
      'en': 'My',
    },
    'ug6j84za': {
      'fr': 'Tue',
      'en': 'Kill',
    },
    '3qxpu2db': {
      'fr': 'Wed',
      'en': 'Wed',
    },
    'q44uadbp': {
      'fr': 'Thu',
      'en': 'Thu',
    },
    '6q53vy92': {
      'fr': 'Fri',
      'en': 'Fri',
    },
    'wjn018k3': {
      'fr': 'Sat',
      'en': 'Sat',
    },
    'dhmjvafe': {
      'fr': '26',
      'en': '26',
    },
    'gnhoh0jb': {
      'fr': '27',
      'en': '27',
    },
    'ynuzz4d4': {
      'fr': '28',
      'en': '28',
    },
    'fjko8ozh': {
      'fr': '29',
      'en': '29',
    },
    'o294lt9y': {
      'fr': '30',
      'en': '30',
    },
    'hljbn7zd': {
      'fr': '1',
      'en': '1',
    },
    'p8tnjl7p': {
      'fr': '2',
      'en': '2',
    },
    'xr5a97dq': {
      'fr': '3',
      'en': '3',
    },
    '2vy68w24': {
      'fr': '4',
      'en': '4',
    },
    'g7c6s6ug': {
      'fr': '5',
      'en': '5',
    },
    'jgxepj7l': {
      'fr': '6',
      'en': '6',
    },
    '1f5k773h': {
      'fr': '7',
      'en': '7',
    },
    '7zrw5tvg': {
      'fr': '8',
      'en': '8',
    },
    'r5bn8c1l': {
      'fr': '9',
      'en': '9',
    },
    'iw4dymaq': {
      'fr': '10',
      'en': '10',
    },
  },
  // calender
  {
    'duy442hn': {
      'fr': 'January 2024',
      'en': 'January 2024',
    },
    '6se2uf56': {
      'fr': 'Mon',
      'en': 'My',
    },
    'gwmnptsv': {
      'fr': 'Tue',
      'en': 'Kill',
    },
    'efjed6jk': {
      'fr': 'Wed',
      'en': 'Wed',
    },
    'ti5gk3up': {
      'fr': 'Thu',
      'en': 'Thu',
    },
    '2je4byps': {
      'fr': 'Fri',
      'en': 'Fri',
    },
    'zbzss4zo': {
      'fr': 'Sat',
      'en': 'Sat',
    },
    'vo35mk2s': {
      'fr': 'Sun',
      'en': 'Sun',
    },
    'fdeb0226': {
      'fr': '1',
      'en': '1',
    },
    '64wlrxs4': {
      'fr': '2',
      'en': '2',
    },
    'wguav6ku': {
      'fr': '3',
      'en': '3',
    },
    'k1xyxog7': {
      'fr': '4',
      'en': '4',
    },
    'h85zoj12': {
      'fr': '5',
      'en': '5',
    },
    '5krl1wiv': {
      'fr': '6',
      'en': '6',
    },
    'eqrao92a': {
      'fr': '7',
      'en': '7',
    },
    'ysta3roy': {
      'fr': '8',
      'en': '8',
    },
    'rw5h624j': {
      'fr': '9',
      'en': '9',
    },
    'qisphyeg': {
      'fr': '10',
      'en': '10',
    },
    'hp4sd7qd': {
      'fr': '11',
      'en': '11',
    },
    '0bmgwqqr': {
      'fr': '12',
      'en': '12',
    },
    '5ljtcaxz': {
      'fr': '2024',
      'en': '2024',
    },
    'vtaqtvfd': {
      'fr': 'Today',
      'en': 'Today',
    },
  },
  // Nav
  {
    'ta7y8cwm': {
      'fr': 'Profile',
      'en': 'Profile',
    },
    'zr8sm0vs': {
      'fr': 'Réservations',
      'en': 'Reservations',
    },
    'gcf78h9n': {
      'fr': 'Chat',
      'en': 'Cat',
    },
    'lmuvotja': {
      'fr': 'Logout',
      'en': 'Logout',
    },
  },
  // confirmersuppoffre
  {
    '7bh1mryf': {
      'fr': 'Annuler',
      'en': 'Cancel',
    },
    '2wsws7m5': {
      'fr': 'supprimer',
      'en': 'DELETE',
    },
  },
  // confirmersuppvoyage
  {
    '6wjqzo9z': {
      'fr': 'Annuler',
      'en': 'Cancel',
    },
    'npgb6qcf': {
      'fr': 'supprimer',
      'en': 'DELETE',
    },
  },
  // LireTerms
  {
    'j1txqye5': {
      'fr': 'Vous Devez Lire les Termes et les condition!',
      'en': 'You Must Read the Terms and Conditions!',
    },
    'fotxu3o5': {
      'fr': 'D\'accord',
      'en': 'All right',
    },
  },
  // Miscellaneous
  {
    'iru5eve8': {
      'fr': 'Découvrir plus d\'offres',
      'en': 'Discover more offers',
    },
    'bi49r1d1': {
      'fr': '',
      'en': '',
    },
    '4274rs1q': {
      'fr': '',
      'en': '',
    },
    'd6ekgcd4': {
      'fr': '',
      'en': '',
    },
    'whvqttfg': {
      'fr': '',
      'en': '',
    },
    'eyovh2l9': {
      'fr': '',
      'en': '',
    },
    'jcy6twa7': {
      'fr': '',
      'en': '',
    },
    '8zmsgcqg': {
      'fr': '',
      'en': '',
    },
    'qwn9get6': {
      'fr': '',
      'en': '',
    },
    'vgmvxnh2': {
      'fr': '',
      'en': '',
    },
    'yg99kp1x': {
      'fr': '',
      'en': '',
    },
    'tcebi0ee': {
      'fr': '',
      'en': '',
    },
    'bl1nqa9x': {
      'fr': '',
      'en': '',
    },
    '54qr88hh': {
      'fr': '',
      'en': '',
    },
    'polzan13': {
      'fr': '',
      'en': '',
    },
    'jxpgjvgw': {
      'fr': '',
      'en': '',
    },
    '4p4pzc2q': {
      'fr': '',
      'en': '',
    },
    'gfb6g6sq': {
      'fr': '',
      'en': '',
    },
    'd6aypvpe': {
      'fr': '',
      'en': '',
    },
    'vgatmnql': {
      'fr': '',
      'en': '',
    },
    '0ucedfz0': {
      'fr': '',
      'en': '',
    },
    '79th0asr': {
      'fr': '',
      'en': '',
    },
    'oumwf64b': {
      'fr': '',
      'en': '',
    },
    'j8swpkuf': {
      'fr': '',
      'en': '',
    },
    '6yk8kie6': {
      'fr': '',
      'en': '',
    },
    'a3vo3gu5': {
      'fr': '',
      'en': '',
    },
    '584a7yks': {
      'fr': '',
      'en': '',
    },
    'kvm8a36h': {
      'fr': '',
      'en': '',
    },
    'xlpm779q': {
      'fr': '',
      'en': '',
    },
    'bekwh4bc': {
      'fr': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
