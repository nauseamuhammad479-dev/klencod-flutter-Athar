import 'package:flutter/material.dart';

void main() {
  runApp(const AtharApp());
}

class AtharApp extends StatelessWidget {
  const AtharApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'أَثَر | ATHAR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF09090B),
        primaryColor: Colors.amber,
        fontFamily: 'Cairo',
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  int _tasbihCount = 0;

  final List<Map<String, dynamic>> _prayerTimes = [
    {'name': 'الفجر', 'time': '04:45 ص', 'active': false},
    {'name': 'الشروق', 'time': '06:15 ص', 'active': false},
    {'name': 'الظهر', 'time': '12:05 م', 'active': true},
    {'name': 'العصر', 'time': '03:30 م', 'active': false},
    {'name': 'المغرب', 'time': '06:00 م', 'active': false},
    {'name': 'العشاء', 'time': '07:20 م', 'active': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // الهيدر العلوي
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF09090B).withOpacity(0.8),
                border: const Border(
                  bottom: BorderSide(color: Color(0x33F59E0B)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFBBF24), Color(0xFFD97706)],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.auto_awesome, color: Color(0xFF09090B)),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'أَثَر | ATHAR',
                            style: TextStyle(
                              color: Color(0xFFFBBF24),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'التطبيق الإسلامي الفاخر',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings, color: Color(0xFFFBBF24)),
                  ),
                ],
              ),
            ),
            // محتوى الشاشات
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: _buildBodyContent(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0x33F59E0B))),
          color: Color(0xFF09090B),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFFFBBF24),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'القرآن'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'الأذكار'),
            BottomNavigationBarItem(icon: Icon(Icons.adjust), label: 'المسبحة'),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    switch (_currentIndex) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFF59E0B).withOpacity(0.15),
                    const Color(0xFFF59E0B).withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0x4DF59E0B)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0x33F59E0B),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0x4DF59E0B)),
                        ),
                        child: const Text(
                          '15 رمضان 1447 هـ',
                          style: TextStyle(color: Color(0xFFFDE68A), fontSize: 12),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text('متبقي على الأذان', style: TextStyle(color: Colors.white60, fontSize: 10)),
                          Text('01:24:10', style: TextStyle(color: Color(0xFFFBBF24), fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'الصلاة القادمة: الظهر',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('مواقيت الصلاة اليوم', style: TextStyle(color: Color(0xFFFBBF24), fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.5,
              ),
              itemCount: _prayerTimes.length,
              itemBuilder: (context, index) {
                final p = _prayerTimes[index];
                bool active = p['active'];
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: active ? const Color(0x33F59E0B) : Colors.white.withOpacity(0.03),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: active ? const Color(0x80F59E0B) : Colors.white12,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(p['name'], style: TextStyle(color: active ? const Color(0xFFFBBF24) : Colors.white70, fontWeight: active ? FontWeight.bold : FontWeight.normal)),
                      Text(p['time'], style: TextStyle(color: active ? const Color(0xFFFBBF24) : Colors.white54, fontWeight: active ? FontWeight.bold : FontWeight.normal)),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('القرآن الكريم', style: TextStyle(color: Color(0xFFFBBF24), fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...['سورة الفاتحة', 'سورة البقرة', 'سورة آل عمران', 'سورة الكهف', 'سورة الملك'].map((surah) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.03),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0x33F59E0B)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0x22F59E0B),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('📖', style: TextStyle(fontSize: 14)),
                      ),
                      const SizedBox(width: 12),
                      Text(surah, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Icon(Icons.chevron_left, color: Color(0xFFFBBF24)),
                ],
              ),
            )),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('حصن المسلم والأذكار', style: TextStyle(color: Color(0xFFFBBF24), fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.03),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0x33F59E0B)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('أذكار الصباح', style: TextStyle(color: Color(0xFFFBBF24), fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(
                    '"رضيت بالله رباً، وبالإسلام ديناً، وبمحمد صلى الله عليه وسلم نبياً ورسولاً."',
                    style: TextStyle(color: Colors.white, fontSize: 16, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        );
      case 3:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('السبحة الإلكترونية', style: TextStyle(color: Color(0xFFFBBF24), fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () => setState(() => _tasbihCount++),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFFF59E0B).withOpacity(0.2),
                        const Color(0xFF09090B),
                        const Color(0xFFD97706).withOpacity(0.1),
                      ],
                    ),
                    border: Border.all(color: const Color(0x80F59E0B), width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('سُبْحَانَ اللَّهِ', style: TextStyle(color: Color(0xFFFBBF24), fontSize: 12)),
                      const SizedBox(height: 8),
                      Text('$_tasbihCount', style: const TextStyle(color: Color(0xFFFDE68A), fontSize: 48, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      const Text('اضغط للتسبيح', style: TextStyle(color: Colors.white38, fontSize: 10)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () => setState(() => _tasbihCount = 0),
                icon: const Icon(Icons.refresh),
                label: const Text('إعادة العداد'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0x22F59E0B),
                  foregroundColor: const Color(0xFFFBBF24),
                  side: const BorderSide(color: Color(0x4DF59E0B)),
                ),
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }
}
