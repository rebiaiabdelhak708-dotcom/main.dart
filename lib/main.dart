import 'package:flutter/material.dart';

void main() {
  runApp(const MatchZoneApp());
}

class MatchZoneApp extends StatelessWidget {
  const MatchZoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Match Zone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: Colors.greenAccent,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Zone ⚽', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1F1F1F),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          MatchCard(
            homeTeam: 'Real Madrid',
            awayTeam: 'Barcelona',
            score: '2 - 1',
            time: '85\'',
            isLive: true,
          ),
          MatchCard(
            homeTeam: 'Man City',
            awayTeam: 'Liverpool',
            score: '0 - 0',
            time: '20:00',
            isLive: false,
          ),
          MatchCard(
            homeTeam: 'Bayern Munich',
            awayTeam: 'Dortmund',
            score: '3 - 2',
            time: 'Finished',
            isLive: false,
          ),
        ],
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  final String homeTeam;
  final String awayTeam;
  final String score;
  final String time;
  final bool isLive;

  const MatchCard({
    super.key,
    required this.homeTeam,
    required this.awayTeam,
    required this.score,
    required this.time,
    required this.isLive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1F1F1F),
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(homeTeam, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            Column(
              children: [
                Text(score, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isLive ? Colors.greenAccent : Colors.white)),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: isLive ? Colors.redAccent : Colors.grey[800],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(time, style: const TextStyle(fontSize: 12, color: Colors.white)),
                ),
              ],
            ),
            Expanded(child: Text(awayTeam, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }
}
