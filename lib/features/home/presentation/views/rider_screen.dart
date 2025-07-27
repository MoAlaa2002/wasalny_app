import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class RiderScreen extends StatelessWidget {
  const RiderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SliderDrawer(
            appBar: SliderAppBar(
              config: SliderAppBarConfig(
                title: Text(
                  "test",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            sliderOpenSize: 179,
            slider: Container(color: Colors.red),
            child: Container(color: Colors.amber),
          ),
        ],
      ),
    );
  }
}
