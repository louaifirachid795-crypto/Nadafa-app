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
      home: const HomePage(),
    );
  }
}

// ==================== الصفحة الرئيسية ====================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تطبيق النظافة'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.local_shipping,
              size: 100,
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            const Text(
              'مرحباً بك في تطبيق النظافة',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'اختر نوع الدخول',
              style: TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 40),

            // زر المواطن
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.person,
                  size: 30,
                ),
                label: const Text(
                  'دخول المواطن',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CitizenPage(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // زر السائق
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.local_shipping,
                  size: 30,
                ),
                label: const Text(
                  'دخول السائق',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DriverPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== صفحة المواطن ====================

class CitizenPage extends StatelessWidget {
  const CitizenPage({super.key});

  static const LatLng homeLocation = LatLng(
    36.7538,
    3.0588,
  );

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('تطبيق المواطن'),
      centerTitle: true,
    ),
    body: Column(
      children: [
        SizedBox(
          height: 350,
          width: double.infinity,
          child: Container(
            color: Colors.grey[200],
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map,
                    size: 70,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'الخريطة ستظهر هنا',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 25),

        const Icon(
          Icons.home,
          size: 70,
          color: Colors.blue,
        ),

        const SizedBox(height: 15),

        const Text(
          'حدد موقع منزلك',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 25),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text(
                'حفظ موقع المنزل',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'سيتم حفظ موقع المنزل هنا',
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
  );
}
}

// ==================== صفحة السائق ====================
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
            tripStarted
                ? Icons.local_shipping
                : Icons.pause_circle,
            size: 70,
            color: tripStarted
                ? Colors.green
                : Colors.orange,
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
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: tripStarted
                      ? Colors.red
                      : Colors.green,
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
