import 'package:flutter/material.dart';

void main() => runApp(const DressMeApp());

const pink = Color(0xFFE94B7A);
const dark = Color(0xFF242126);
const cream = Color(0xFFFFFAF8);

class DressMeApp extends StatelessWidget {
  const DressMeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DressMe',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(seedColor: pink, brightness: Brightness.light),
        fontFamily: 'sans',
        inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
      ),
      home: const Shell(),
    );
  }
}

class ClothingItem {
  final String name, category, color;
  final IconData icon;
  const ClothingItem(this.name, this.category, this.color, this.icon);
}

const items = <ClothingItem>[
  ClothingItem('Camicia bianca', 'Maglie', 'Bianco', Icons.checkroom),
  ClothingItem('Maglione beige', 'Maglie', 'Beige', Icons.checkroom),
  ClothingItem('Giacca nera', 'Giacche', 'Nero', Icons.checkroom),
  ClothingItem('Jeans blu', 'Pantaloni', 'Blu', Icons.checkroom),
  ClothingItem('Pantalone beige', 'Pantaloni', 'Beige', Icons.checkroom),
  ClothingItem('Gonna nera', 'Gonne', 'Nero', Icons.checkroom),
  ClothingItem('Vestito nero', 'Vestiti', 'Nero', Icons.checkroom),
  ClothingItem('Blazer beige', 'Giacche', 'Beige', Icons.checkroom),
  ClothingItem('Sneakers bianche', 'Scarpe', 'Bianco', Icons.directions_run),
  ClothingItem('Décolleté nere', 'Scarpe', 'Nero', Icons.stroller),
  ClothingItem('Borsa marrone', 'Accessori', 'Marrone', Icons.shopping_bag),
];

class Shell extends StatefulWidget {
  const Shell({super.key});
  @override State<Shell> createState() => _ShellState();
}
class _ShellState extends State<Shell> {
  int tab = 0;
  final pages = const [HomePage(), WardrobePage(), AddPage(), PlannerPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[tab],
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (i) => setState(() => tab = i),
        indicatorColor: pink.withOpacity(.13),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.inventory_2_outlined), selectedIcon: Icon(Icons.inventory_2), label: 'Armadio'),
          NavigationDestination(icon: Icon(Icons.add_circle_outline, size: 30), selectedIcon: Icon(Icons.add_circle, size: 30), label: 'Aggiungi'),
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
  Widget build(BuildContext context) => SafeArea(child: ListView(padding: const EdgeInsets.all(18), children: [
    Row(children: [const Expanded(child: Text('Buongiorno! 👋', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)), Icon(Icons.notifications_none)]),
    const SizedBox(height: 18),
    Card(color: Colors.white, child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(children: [Icon(Icons.location_on_outlined, size: 18), SizedBox(width: 6), Text('Pomezia')]),
      const SizedBox(height: 8),
      const Text('24°C', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700)),
      const Text('☀️ Sole  •  💨 Vento 12 km/h  •  🌧️ Pioggia 10%'),
    ]))),
    const SizedBox(height: 18),
    const Text('OUTFIT DEL GIORNO', style: TextStyle(color: pink, fontWeight: FontWeight.bold, letterSpacing: 1)),
    const SizedBox(height: 8),
    _OutfitCard(title: 'Casual chic', items: const ['Camicia bianca','Pantalone beige','Sneakers bianche','Borsa marrone']),
    const SizedBox(height: 12),
    Row(children: [
      Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.favorite_border), label: const Text('Mi piace'))),
      const SizedBox(width: 8), Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.close), label: const Text('Non mi piace'))),
    ]),
    const SizedBox(height: 8),
    FilledButton.icon(style: FilledButton.styleFrom(backgroundColor: pink), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AlternativesPage())), icon: const Icon(Icons.refresh), label: const Text('Nuovo outfit')),
    const SizedBox(height: 22),
    const Text('Suggerimento dello stylist', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    const SizedBox(height: 6),
    const Text('Oggi punta sui colori neutri: bianco, beige e marrone. Sono facili da combinare e perfetti per una giornata mite.'),
  ]));
}

class _OutfitCard extends StatelessWidget {
  final String title; final List<String> items;
  const _OutfitCard({required this.title, required this.items});
  @override Widget build(BuildContext context) => Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
    Container(height: 155, width: double.infinity, decoration: BoxDecoration(color: const Color(0xFFF4EFED), borderRadius: BorderRadius.circular(18)), child: const Center(child: Icon(Icons.checkroom, size: 76, color: pink))),
    const SizedBox(height: 12), Align(alignment: Alignment.centerLeft, child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
    const SizedBox(height: 8),
    Align(alignment: Alignment.centerLeft, child: Wrap(spacing: 8, runSpacing: 6, children: items.map((e) => Chip(label: Text(e))).toList())),
    const SizedBox(height: 4),
    const Align(alignment: Alignment.centerLeft, child: Text('Perfetto per 22–28°C e per il tuo stile.')),
  ])));
}

class WardrobePage extends StatefulWidget {
  const WardrobePage({super.key});
  @override State<WardrobePage> createState() => _WardrobePageState();
}
class _WardrobePageState extends State<WardrobePage> {
  String cat = 'Tutto';
  @override Widget build(BuildContext context) {
    final filtered = cat == 'Tutto' ? items : items.where((e) => e.category == cat).toList();
    final cats = ['Tutto','Maglie','Pantaloni','Gonne','Vestiti','Giacche','Scarpe','Accessori'];
    return SafeArea(child: Column(children: [
      Padding(padding: const EdgeInsets.fromLTRB(18, 18, 18, 8), child: Row(children: [const Expanded(child: Text('Il mio armadio', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))), IconButton(onPressed: () {}, icon: const Icon(Icons.search)), IconButton(onPressed: () {}, icon: const Icon(Icons.tune))])),
      SizedBox(height: 42, child: ListView.separated(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 18), itemCount: cats.length, separatorBuilder: (_, __) => const SizedBox(width: 6), itemBuilder: (_, i) => ChoiceChip(label: Text(cats[i]), selected: cat == cats[i], onSelected: (_) => setState(() => cat = cats[i]), selectedColor: pink.withOpacity(.2)))),
      Expanded(child: GridView.builder(padding: const EdgeInsets.all(18), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: .86), itemCount: filtered.length + 1, itemBuilder: (_, i) {
        if (i == filtered.length) return InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddPage())), child: Card(child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.add_circle_outline, size: 42, color: pink), const SizedBox(height: 8), const Text('Aggiungi capo')]))));
        final x = filtered[i]; return Card(child: InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ItemPage(item: x))), child: Padding(padding: const EdgeInsets.all(10), child: Column(children: [Expanded(child: Container(decoration: BoxDecoration(color: const Color(0xFFF3EEEC), borderRadius: BorderRadius.circular(16)), child: Icon(x.icon, size: 58, color: dark))), const SizedBox(height: 8), Text(x.name, style: const TextStyle(fontWeight: FontWeight.bold)), Text(x.color, style: const TextStyle(color: Colors.grey))]))));
      }))
    ]));
  }
}

class AddPage extends StatelessWidget {
  const AddPage({super.key});
  @override Widget build(BuildContext context) => SafeArea(child: Padding(padding: const EdgeInsets.all(22), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Text('Aggiungi un capo', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
    const SizedBox(height: 8), const Text('Scatta una foto e DressMe proverà a riconoscere automaticamente il capo.'),
    const SizedBox(height: 24),
    Expanded(child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Container(width: 230, height: 230, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28), border: Border.all(color: pink.withOpacity(.4))), child: const Icon(Icons.camera_alt_outlined, size: 80, color: pink)), const SizedBox(height: 18), const Text('Foto del capo', style: TextStyle(fontWeight: FontWeight.bold)), const SizedBox(height: 6), const Text('La fotocamera e il riconoscimento AI saranno collegati nella prossima versione.')])),
    FilledButton.icon(style: FilledButton.styleFrom(backgroundColor: pink, minimumSize: const Size.fromHeight(52)), onPressed: () => _showDemo(context), icon: const Icon(Icons.photo_camera), label: const Text('Scatta / scegli foto')),
  ])));
  void _showDemo(BuildContext context) => showDialog(context: context, builder: (_) => AlertDialog(title: const Text('Demo V1'), content: const Text('Qui collegheremo fotocamera e AI per riconoscere automaticamente categoria, colore, stile e stagione del capo.'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))]));
}

class AlternativesPage extends StatelessWidget {
  const AlternativesPage({super.key});
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Altri outfit per oggi')), body: ListView(padding: const EdgeInsets.all(18), children: [
    _MiniOutfit(number: '1', title: 'Casual', desc: 'Jeans blu + T-shirt bianca + sneakers'),
    _MiniOutfit(number: '2', title: 'Elegante', desc: 'Pantalone nero + camicia + décolleté'),
    _MiniOutfit(number: '3', title: 'Aperitivo', desc: 'Gonna nera + top + blazer beige'),
    const SizedBox(height: 8), FilledButton.icon(style: FilledButton.styleFrom(backgroundColor: pink), onPressed: () {}, icon: const Icon(Icons.refresh), label: const Text('Voglio un altro outfit')),
  ]));
}
class _MiniOutfit extends StatelessWidget { final String number,title,desc; const _MiniOutfit({required this.number,required this.title,required this.desc}); @override Widget build(BuildContext context) => Card(margin: const EdgeInsets.only(bottom: 12), child: ListTile(leading: CircleAvatar(backgroundColor: pink, foregroundColor: Colors.white, child: Text(number)), title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: Text(desc), trailing: const Icon(Icons.favorite_border))); }

class ItemPage extends StatelessWidget { final ClothingItem item; const ItemPage({super.key, required this.item}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Abbina questo capo')), body: ListView(padding: const EdgeInsets.all(18), children: [Card(child: Padding(padding: const EdgeInsets.all(18), child: Row(children: [Container(width: 105,height:105,decoration: BoxDecoration(color: const Color(0xFFF3EEEC),borderRadius: BorderRadius.circular(18)),child: Icon(item.icon,size:52)),const SizedBox(width:16),Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(item.name,style:const TextStyle(fontSize:20,fontWeight:FontWeight.bold)),Text(item.color)])])),const SizedBox(height:18),const Text('Come vuoi indossarla?',style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)),const SizedBox(height:10),_Look(title:'CASUAL',desc:'T-shirt + sneakers + borsa'),_Look(title:'ELEGANTE',desc:'Camicia + décolleté + blazer'),_Look(title:'SERA',desc:'Top + blazer + décolleté'),const SizedBox(height:8),FilledButton.icon(style:FilledButton.styleFrom(backgroundColor:pink),onPressed:(){},icon:const Icon(Icons.auto_awesome),label:const Text('Crea il mio outfit'))])); }
class _Look extends StatelessWidget {final String title,desc;const _Look({required this.title,required this.desc});@override Widget build(BuildContext context)=>Card(child:ListTile(leading:const Icon(Icons.style),title:Text(title,style:const TextStyle(fontWeight:FontWeight.bold)),subtitle:Text(desc),trailing:const Icon(Icons.chevron_right)));}

class PlannerPage extends StatelessWidget { const PlannerPage({super.key}); @override Widget build(BuildContext context){final days=['LUNEDÌ','MARTEDÌ','MERCOLEDÌ','GIOVEDÌ','VENERDÌ','SABATO','DOMENICA'];final outfits=['Ufficio','Casual chic','Casual','Ufficio','Aperitivo','Tempo libero','Relax'];return SafeArea(child:ListView(padding:const EdgeInsets.all(18),children:[const Text('Planner settimanale',style:TextStyle(fontSize:24,fontWeight:FontWeight.bold)),const SizedBox(height:12),...List.generate(7,(i)=>Card(child:ListTile(leading:Text('☀️',style:const TextStyle(fontSize:22)),title:Text(days[i],style:const TextStyle(fontWeight:FontWeight.bold)),subtitle:Text('20°C / 26°C  •  ${outfits[i]}'),trailing:const Icon(Icons.checkroom))) ]));}}

class ProfilePage extends StatelessWidget { const ProfilePage({super.key}); @override Widget build(BuildContext context)=>SafeArea(child:ListView(padding:const EdgeInsets.all(18),children:[const Row(children:[CircleAvatar(radius:28,backgroundColor:Color(0xFFF5DCE4),child:Icon(Icons.person,color:pink)),SizedBox(width:12),Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('Luisa',style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)),Text('Il tuo profilo')])]),const SizedBox(height:18),...['Il mio stile','Il mio armadio','I miei outfit preferiti','Statistiche','Impostazioni'].map((x)=>Card(child:ListTile(title:Text(x),trailing:const Icon(Icons.chevron_right)))),const SizedBox(height:10),Card(color:const Color(0xFFFFF0F4),child:Padding(padding:const EdgeInsets.all(18),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[const Text('✨ PASSA A DRESSME PREMIUM',style:TextStyle(color:pink,fontWeight:FontWeight.bold)),const SizedBox(height:8),const Text('€3,99 / mese',style:TextStyle(fontSize:22,fontWeight:FontWeight.bold)),const Text('oppure €29,99 / anno'),const SizedBox(height:10),const Text('✓ Armadio illimitato\n✓ Outfit illimitati\n✓ Planner settimanale\n✓ Outfit per occasioni\n✓ Valigia intelligente\n✓ AI Stylist avanzato'),const SizedBox(height:12),FilledButton(onPressed:(){},style:FilledButton.styleFrom(backgroundColor:pink),child:const Text('Scopri tutti i vantaggi'))]))])); }
}
