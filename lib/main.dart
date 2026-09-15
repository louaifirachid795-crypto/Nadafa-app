
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const NadafaApp());
}

class NadafaApp extends StatelessWidget {
  const NadafaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تطبيق النظافة',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const DriverPage(),
    );
  }
}

class DriverPage extends StatefulWidget {
  const DriverPage({super.key});

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  bool tripStarted = false;

  static const LatLng startLocation = LatLng(
    36.7538,
    3.0588,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تطبيق سائق النظافة'),
        centerTitle: true,
      ),

      body: Column(
        children: [
          SizedBox(
            height: 350,
            width: double.infinity,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: startLocation,
                zoom: 14,
              ),
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
            ),
          ),

          const SizedBox(height: 20),

          Icon(
            tripStarted ? Icons.local_shipping : Icons.pause_circle,
            size: 70,
            color: tripStarted ? Colors.green : Colors.orange,
          ),

          const SizedBox(height: 20),

          Text(
            tripStarted
                ? 'الرحلة تعمل الآن'
                : 'الرحلة متوقفة',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: Icon(
                  tripStarted
                      ? Icons.stop
                      : Icons.play_arrow,
                ),
                label: Text(
                  tripStarted
                      ? 'إيقاف الرحلة'
                      : 'بدء الرحلة',
                  style: const TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      tripStarted ? Colors.red : Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    tripStarted = !tripStarted;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
