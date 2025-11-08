import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI Controls Screen')),
      body: _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  Transportation transportation = Transportation.car;
  bool wantsBreakfast = true;
  bool wantsLunch = true;
  bool wantsDinner = true;

  void updateTransportation(Transportation value) {
    setState(() {
      transportation = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Enable developer options'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),

        _TransportationView(
          transportation: transportation,
          onChanged: updateTransportation,
        ),

        CheckboxListTile(
          title: const Text('Breakfast ?'),
          value: wantsBreakfast,
          onChanged: (value) {
            setState(() {
              wantsBreakfast = !wantsBreakfast;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Lunch ?'),
          value: wantsLunch,
          onChanged: (value) {
            setState(() {
              wantsLunch = !wantsLunch;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Dinner ?'),
          value: wantsDinner,
          onChanged: (value) {
            setState(() {
              wantsDinner = !wantsDinner;
            });
          },
        ),
      ],
    );
  }
}

class _TransportationView extends StatelessWidget {
  final Transportation transportation;
  final ValueChanged<Transportation> onChanged;

  const _TransportationView({
    required this.transportation,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Transportation'),
      subtitle: const Text('Choose your preferred transportation'),
      children: [
        RadioGroup(
          groupValue: transportation,
          onChanged: (value) {
            if (value == null) return;

            onChanged(value);
          },
          child: Column(
            children: [
              RadioListTile(
                value: Transportation.car,
                title: Text('By Car'),
                subtitle: Text('Travel by car'),
              ),
              RadioListTile(
                value: Transportation.plane,
                title: Text('By Plane'),
                subtitle: Text('Travel by plane'),
              ),
              RadioListTile(
                value: Transportation.boat,
                title: Text('By Boat'),
                subtitle: Text('Travel by boat'),
              ),
              RadioListTile(
                value: Transportation.submarine,
                title: Text('By Submarine'),
                subtitle: Text('Travel by Submarine'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
