import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buttons Screen')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 16,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Elevated Button')),

            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated Button'),
            ),

            ElevatedButton.icon(
              onPressed: () {},
              label: Text('Elevate Button Icon'),
              icon: Icon(Icons.add),
            ),

            FilledButton(onPressed: () {}, child: Text('Filled Button')),
            FilledButton.icon(
              onPressed: () {},
              label: Text('Filled Button Icon'),
              icon: Icon(Icons.add_alarm),
            ),

            OutlinedButton(
              onPressed: () {},
              child: const Text('Outline Button'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              label: Text('Outline Button Icon'),
              icon: Icon(Icons.access_alarm),
            ),

            TextButton(onPressed: () {}, child: const Text('Text Button')),
            TextButton.icon(
              onPressed: () {},
              label: const Text('Text icon Button'),
              icon: const Icon(Icons.accessibility),
            ),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.access_alarms_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_balance),
              style: IconButton.styleFrom(
                backgroundColor: colors.primary,
                foregroundColor: colors.inversePrimary,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_balance),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                foregroundColor: WidgetStatePropertyAll(colors.inversePrimary),
              ),
            ),

            _CustomButton()
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: colors.primary,
        child: InkWell(
          
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Text(
              'Hola Button!!!',
              style: TextStyle(color: Colors.white),
              ),
            ),
        ),
      ),
    );
  }
}
