import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      content: const Text('Hello I am a SnackBar'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Ths is is a dialog!!'),
        content: const Text('Occaecat pariatur aliquip ea ex laboris aute sunt aute laborum dolor sunt culpa. Laboris cillum excepteur minim incididunt reprehenderit aliqua nulla ut officia aute velit magna reprehenderit. Eu nulla velit excepteur incididunt sint tempor esse qui. In veniam nulla aute dolore enim. Ipsum quis aute reprehenderit duis ullamco proident. Mollit ut minim magna ipsum commodo reprehenderit. Sint magna cillum mollit voluptate Lorem eiusmod et officia commodo adipisicing.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: ()=> context.pop(), child: const Text('Aceptar'))
        ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SnackBar Screen')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      'Proident incididunt Lorem ut eu ea voluptate est consectetur quis qui. Nisi consequat velit excepteur commodo consequat. In in pariatur laborum ullamco laborum aute incididunt laborum officia ex velit in incididunt. Reprehenderit veniam et voluptate consectetur cillum excepteur mollit qui culpa cupidatat.',
                    ),
                  ],
                );
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton(
              onPressed: () => openDialog(context),
              child: const Text('Dialogo en pantalla'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show SnackBar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
