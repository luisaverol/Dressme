
import 'package:flutter/material.dart';

void main() => runApp(const DressMeApp());

class DressMeApp extends StatelessWidget {
  const DressMeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DressMe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFFAF7),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE77C8E)),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selected = 0;
  final pages = const [HomePage(), WardrobePage(), PlannerPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[selected]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected,
        onDestinationSelected: (i) => setState(() => selected = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.checkroom_outlined), selectedIcon: Icon(Icons.checkroom), label: 'Armadio'),
          NavigationDestination(icon: Icon(Icons.calendar_month_outlined), selectedIcon: Icon(Icons.calendar_month), label: 'Planner'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profilo'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text('Buongiorno 👋', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        const Text('Il tuo personal stylist digitale', style: TextStyle(color: Colors.black54)),
        const SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFFFFE8EC), Color(0xFFFFF5F1)]),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Row(children: [
            Icon(Icons.wb_sunny_rounded, size: 45, color: Color(0xFFE5A32A)),
            SizedBox(width: 14),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Pomezia • Oggi', style: TextStyle(fontWeight: FontWeight.w700)),
              Text('26°C', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Text('Sereno • vento moderato', style: TextStyle(color: Colors.black54)),
            ]),
          ]),
        ),
        const SizedBox(height: 24),
        const Text('OUTFIT DEL GIORNO', style: TextStyle(letterSpacing: 1.2, fontWeight: FontWeight.bold, color: Colors.black54)),
        const SizedBox(height: 10),
        Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(children: [
              Container(
                height: 190,
                decoration: BoxDecoration(color: const Color(0xFFF5EAE5), borderRadius: BorderRadius.circular(20)),
                child: const Center(child: Icon(Icons.checkroom, size: 90, color: Color(0xFFD49A9A))),
              ),
              const SizedBox(height: 15),
              const Text('Camicia bianca • Pantalone beige • Sneakers bianche',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 7),
              const Text('Casual chic • ideale per 24–28°C', style: TextStyle(color: Colors.black54)),
              const SizedBox(height: 15),
              Row(children: [
                Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.favorite_border), label: const Text('Mi piace'))),
                const SizedBox(width: 10),
                Expanded(child: FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.refresh), label: const Text('Cambia'))),
              ]),
            ]),
          ),
        ),
        const SizedBox(height: 20),
        const Text('ALTERNATIVE', style: TextStyle(letterSpacing: 1.2, fontWeight: FontWeight.bold, color: Colors.black54)),
        const SizedBox(height: 8),
        const Wrap(spacing: 8, children: [Chip(label: Text('Casual')), Chip(label: Text('Elegante')), Chip(label: Text('Aperitivo'))]),
      ],
    );
  }
}

class WardrobePage extends StatelessWidget {
  const WardrobePage({super.key});
  @override
  Widget build(BuildContext context) {
    final clothes = ['Camicia bianca','Jeans blu','Pantalone beige','Blazer nero','Sneakers bianche','Gonna nera'];
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Il mio armadio', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.add), label: const Text('Aggiungi')),
        ]),
        const SizedBox(height: 8),
        const Text('Qui saranno salvati i tuoi capi.', style: TextStyle(color: Colors.black54)),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: clothes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: .82),
          itemBuilder: (_, i) => Card(
            clipBehavior: Clip.antiAlias,
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(child: Container(color: i.isEven ? const Color(0xFFF3E8E2) : const Color(0xFFF0E9F1), child: Icon(Icons.checkroom, size: 58, color: Colors.black.withOpacity(.25)))),
              Padding(padding: const EdgeInsets.all(10), child: Text(clothes[i], style: const TextStyle(fontWeight: FontWeight.bold))),
            ]),
          ),
        ),
      ],
    );
  }
}

class PlannerPage extends StatelessWidget {
  const PlannerPage({super.key});
  @override
  Widget build(BuildContext context) {
    const days = ['Lunedì','Martedì','Mercoledì','Giovedì','Venerdì'];
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text('Planner', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('Organizza i tuoi outfit della settimana.', style: TextStyle(color: Colors.black54)),
        const SizedBox(height: 18),
        ...days.map((d) => Card(child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.style)),
          title: Text(d, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: const Text('Casual chic'),
          trailing: const Icon(Icons.chevron_right),
        ))),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text('Il mio profilo', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        const CircleAvatar(radius: 38, backgroundColor: Color(0xFFF3D5DB), child: Icon(Icons.person, size: 40, color: Color(0xFFE05D75))),
        const SizedBox(height: 18),
        const ListTile(leading: Icon(Icons.palette_outlined), title: Text('Preferenze di stile'), trailing: Icon(Icons.chevron_right)),
        const ListTile(leading: Icon(Icons.favorite_border), title: Text('Outfit preferiti'), trailing: Icon(Icons.chevron_right)),
        const ListTile(leading: Icon(Icons.settings_outlined), title: Text('Impostazioni'), trailing: Icon(Icons.chevron_right)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFFE77C8E), Color(0xFFF2A6A9)]),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('DRESSME PREMIUM', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Il tuo personal stylist sempre con te.', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Armadio illimitato • Planner • Valigia intelligente • AI Stylist', style: TextStyle(color: Colors.white)),
          ]),
        ),
      ],
    );
  }
}
