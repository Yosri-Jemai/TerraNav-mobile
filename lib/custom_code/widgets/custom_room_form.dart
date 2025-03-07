// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

class CustomRoomForm extends StatefulWidget {
  const CustomRoomForm({
    super.key,
    required this.width,
    required this.height,
  });
  final double width;
  final double height;

  @override
  _CustomRoomFormState createState() => _CustomRoomFormState();
}

class _CustomRoomFormState extends State<CustomRoomForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _roomNumberController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _isAvailable = true;
  bool _wifiEnabled = false;
  bool _breakfastEnabled = false;
  bool _parkingEnabled = false;

  // Référence à Firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fonction pour ajouter une chambre à Firestore
  Future<void> _addRoomToFirestore() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Ajouter à la collection "chambre"
        await _firestore.collection('chambre').add({
          'numero': int.parse(_roomNumberController.text),
          'prix': double.parse(_priceController.text),
          'superficie': double.parse(_areaController.text),
          'capacite': int.parse(_capacityController.text),
          'disponibilite': _isAvailable,
          'wifi': _wifiEnabled,
          'petit_dejeuner': _breakfastEnabled,
          'parking': _parkingEnabled,
          'description': _descriptionController.text,
          'created_at': FieldValue.serverTimestamp(), // Ajouter un timestamp
        });

        // Ajouter à la collection "hebergement" (si nécessaire)
        await _firestore.collection('hebergement').add({
          'nom':
              'Nom de l\'hébergement', // Remplacez par une valeur dynamique si nécessaire
          'localisation': 'Localisation', // Remplacez par une valeur dynamique
          'nb_chambres': 1, // Mettez à jour dynamiquement
          'type_hebergement':
              'Type d\'hébergement', // Remplacez par une valeur dynamique
          'created_at': FieldValue.serverTimestamp(),
        });

        // Afficher un message de succès
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Chambre ajoutée avec succès !')),
        );

        // Réinitialiser le formulaire
        _formKey.currentState!.reset();
      } catch (e) {
        // Gérer les erreurs
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur : $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
      child: SingleChildScrollView(
        primary: false,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Remplissez les détails ci-dessous pour ajouter cette chambre',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).secondaryHeaderColor,
                      letterSpacing: 0.0,
                    ),
              ),
              _buildBasicInfoSection(),
              _buildTypeAndAvailabilitySection(),
              _buildAmenitiesSection(),
              _buildPhotosAndDescriptionSection(),
              _buildSubmitButton(),
            ]
                .map((widget) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: widget,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildBasicInfoSection() {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Informations de base',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                      letterSpacing: 0.0,
                    ),
              ),
              TextFormField(
                controller: _roomNumberController,
                decoration: InputDecoration(
                  labelText: 'Numéro de chambre',
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un numéro de chambre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Prix par nuit (€)',
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: const Icon(Icons.euro_symbol),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un prix';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _areaController,
                decoration: InputDecoration(
                  labelText: 'Superficie (m²)',
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: const Icon(Icons.square_foot),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une superficie';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypeAndAvailabilitySection() {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Type et Disponibilité',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                      letterSpacing: 0.0,
                    ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _capacityController,
                decoration: InputDecoration(
                  labelText: 'Capacité',
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une capacité';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Disponibilité',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Checkbox(
                    value: _isAvailable,
                    onChanged: (newValue) {
                      setState(() {
                        _isAvailable = newValue ?? true;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmenitiesSection() {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Commodités',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                      letterSpacing: 0.0,
                    ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildAmenitySwitch(
                    icon: Icons.wifi,
                    label: 'Wi-Fi gratuit',
                    value: _wifiEnabled,
                    onChanged: (newValue) {
                      setState(() {
                        _wifiEnabled = newValue;
                      });
                    },
                  ),
                  _buildAmenitySwitch(
                    icon: Icons.free_breakfast,
                    label: 'Petit-déjeuner',
                    value: _breakfastEnabled,
                    onChanged: (newValue) {
                      setState(() {
                        _breakfastEnabled = newValue;
                      });
                    },
                  ),
                  _buildAmenitySwitch(
                    icon: Icons.local_parking,
                    label: 'Parking',
                    value: _parkingEnabled,
                    onChanged: (newValue) {
                      setState(() {
                        _parkingEnabled = newValue;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmenitySwitch({
    required IconData icon,
    required String label,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 16, 8, 16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Theme.of(context).primaryColor, size: 20),
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
            Switch(
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotosAndDescriptionSection() {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Photos et Description',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                      letterSpacing: 0.0,
                    ),
              ),
              const SizedBox(height: 24),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_a_photo,
                          size: 40, color: Theme.of(context).primaryColor),
                      Text('Ajouter des photos',
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  filled: true,
                  fillColor: Colors.white,
                ),
                maxLines: 8,
                minLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une description';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _addRoomToFirestore,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      child: Text(
        'Ajouter',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              letterSpacing: 0.0,
            ),
      ),
    );
  }
}
