import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
void main() {
  runApp(const NadafaApp());
}

class NadafaApp extends StatelessWidget {
  const NadafaApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'نظافة',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تطبيق نظافة'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.local_shipping,
                size: 90,
              ),
              const SizedBox(height: 20),
              const Text(
                'مرحبًا بك في نظافة',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'اختر طريقة الدخول',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 35),

              // دخول المواطن
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => Scaffold(
      appBar: AppBar(
        
  title: const Text('صفحة المواطن'),
),
          style: TextStyle(fontSize: 24),
        ),
      ),
    ),
  ),
);
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CitizenPage(),
                      ),
                    );
                  },
                  ('دخول المواطن'),
                ),
              ),

              const SizedBox(height: 15),

              // دخول السائق
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>DriverPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.drive_eta),
                  label: const Text('دخول السائق'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// صفحة المواط// صفحة المواطن
class CitizenPage extends StatefulWidget {
  const CitizenPage({super.key});

  @override
  State<CitizenPage> createState() => _CitizenPageState();
}

class _CitizenPageState extends State<CitizenPage> {
  String message = 'اضغط الزر لتحديد موقع منزلك';

  Future<void> getLocation() async {
    try {
      bool serviceEnabled =
          await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        setState(() {
          message = 'يرجى تشغيل خدمة الموقع في الهاتف';
        });
        return;
      }

      LocationPermission permission =
          await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          setState(() {
            message = 'تم رفض إذن الموقع';
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          message = 'إذن الموقع مرفوض نهائياً';
        });
        return;
      }

      final Position position =
          await Geolocator.getCurrentPosition();

      setState(() {
        message =
            'تم تحديد موقع منزلك\n'
            'خط العرض: ${position.latitude}\n'
            'خط الطول: ${position.longitude}';
      });
    } catch (e) {
      setState(() {
        message = 'حدث خطأ أثناء تحديد الموقع';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('صفحة المواطن'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person_pin_circle,
                size: 90,
              ),
              const SizedBox(height: 20),
              const Text(
                'مرحباً بك أيها المواطن',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: getLocation,
                icon: const Icon(Icons.location_on),
                label: const Text('تحديد موقع منزلي'),
              ),
            ],
          ),
        ),
      ),
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
  String message = 'جاهز للانطلاق';

  Future<void> getLocation() async {
    try {
      bool serviceEnabled =
          await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        setState(() {
          message = 'يرجى تشغيل خدمة الموقع في الهاتف';
        });
        return;
      }

      LocationPermission permission =
          await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          setState(() {
            message = 'تم رفض إذن الموقع';
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          message = 'إذن الموقع مرفوض نهائياً';
        });
        return;
      }

      final Position position =
          await Geolocator.getCurrentPosition();

      setState(() {
        message =
            'GPS يعمل\n'
            'خط العرض: ${position.latitude}\n'
            'خط الطول: ${position.longitude}';
      });
    } catch (e) {
      setState(() {
        message = 'حدث خطأ أثناء تحديد الموقع';
      });
    }
  }

  void startTrip() {
    setState(() {
      tripStarted = true;
      message = 'الرحلة بدأت';
    });

    getLocation();
  }

  void stopTrip() {
    setState(() {
      tripStarted = false;
      message = 'تم إيقاف الرحلة';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('واجهة السائق'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.local_shipping,
                size: 90,
              ),
              const SizedBox(height: 20),
              const Text(
                'مرحباً بك أيها السائق',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: tripStarted ? null : startTrip,
                icon: const Icon(Icons.play_arrow),
                label: const Text('بدء الرحلة'),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: tripStarted ? stopTrip : null,
                icon: const Icon(Icons.stop),
                label: const Text('إيقاف الرحلة'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
