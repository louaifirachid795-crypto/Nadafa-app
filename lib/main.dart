import 'package:flutter/material.dart';

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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CitizenPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.person),
                  label: const Text('دخول المواطن'),
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
                        builder: (context) => const DriverPage(),
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

// صفحة المواطن
class CitizenPage extends StatelessWidget {
  const CitizenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('واجهة المواطن'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person_pin_circle,
                size: 90,
              ),
              const SizedBox(height: 20),
              const Text(
                'مرحبًا بك أيها المواطن',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'سيتم هنا تحديد موقع منزلك\nومتابعة شاحنة النظافة.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// صفحة السائق
class DriverPage extends StatelessWidget {
  const DriverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('واجهة السائق'),
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
                'واجهة السائق',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'من هنا سيتم بدء الرحلة\nوتحديث موقع الشاحنة.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
