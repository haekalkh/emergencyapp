import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataSubmissionPage extends StatelessWidget {
  final String buttonText;

  const DataSubmissionPage({super.key, required this.buttonText});

  Future<void> _submitData(BuildContext context) async {
    final databaseReference = FirebaseDatabase.instance.ref().child('data');
    String dataKey;
    dynamic value;

    switch (buttonText) {
      case 'Button 1':
        dataKey = 'kebakaran';
        value = true;
        break;
      case 'Button 2':
        dataKey = 'bencana_alam';
        value = true;
        break;
      case 'Button 3':
        dataKey = 'pencurian';
        value = true;
        break;
      case 'Button 4':
        dataKey = 'darurat';
        value = 'true'; // Specific value for button 4
        break;
      default:
        return; // If no matching buttonText, exit function
    }

    try {
      final newEntryRef = databaseReference.child(dataKey);
      await newEntryRef.set({
        'value': value,
        'timestamp': DateTime.now().toIso8601String(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$dataKey data submitted successfully')),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Submit Data',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 24),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 100, 130, 173),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Submit data for $buttonText',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _submitData(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                backgroundColor: const Color.fromARGB(255, 100, 130, 173),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
