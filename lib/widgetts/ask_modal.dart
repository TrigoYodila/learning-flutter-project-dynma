import 'package:flutter/material.dart';

Future<String?> askModal(BuildContext context, String question) {
  return Navigator.push(
    context,
    PageRouteBuilder(
      opaque: false, 
      pageBuilder: (context, _, __) {
        return AskModal(question: question);
      },
    ),
  );
}


class AskModal extends StatelessWidget {
  final String question;

  const AskModal({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Card(
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: 300,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(question, style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, 'ok'), // retourne true
                      child: const Text('OK'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, 'annuler'), // retourne false
                      child: const Text('Annuler'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
