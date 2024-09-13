import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyTextButton extends StatelessWidget {
  final String textToCopy;

  const CopyTextButton({super.key, required this.textToCopy});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Copiar texto al portapapeles
        Clipboard.setData(ClipboardData(text: textToCopy));

        // Mostrar un Snackbar como confirmación
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('ID copiado: $textToCopy'),
          ),
        );
      },
      child: Text(
        "ID: $textToCopy",
        style: const TextStyle(
          color: Colors.black38,
        ),
      ),
    );
  }
}
