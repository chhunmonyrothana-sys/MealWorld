import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const List<Map<String, String>> members = [
    {
      'name': 'Chhun monyrothana',
      'role': 'Developer',
      'photo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAwLk7BdSBwMGmmO6YCyxEP0otqy_0jXtY6w&s',
    },
    {
      'name': 'Tongvandy Roriza',
      'role': 'Developer',
      'photo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA51Hk-IxsWTIv0ruG1KzaLkbulzIqG0Kk_Q&s',
    },
    {
      'name': 'Chhor lyhouy',
      'role': 'Designer',
      'photo': "data:image/jpeg;base64,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",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('About Us',
            style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            CircleAvatar(
              radius: 50,
              backgroundColor: colorScheme.primaryContainer,
              child: Icon(Icons.restaurant_menu,
                  size: 52, color: colorScheme.primary),
            ),
            const SizedBox(height: 16),
            Text('MealWorld',
                style: GoogleFonts.lato(
                    fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text('Powered by TheMealDB API',
                style: GoogleFonts.lato(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                'MealWorld is a Flutter mobile application built as a group assignment. '
                'It lets you explore meals from around the world, browse by category, '
                'search for your favourite dishes, and view detailed recipes.',
                style: GoogleFonts.lato(fontSize: 14, height: 1.6),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Our Team',
                  style: GoogleFonts.lato(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),

            // ── Team Members ──────────────────────────────────────────
            ...members.map((m) => Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: ClipOval(
                      child: Image.network(
                        m['photo']!,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            CircleAvatar(
                          radius: 24,
                          backgroundColor: colorScheme.primaryContainer,
                          child: Text(
                            m['name']![0],
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onPrimaryContainer),
                          ),
                        ),
                      ),
                    ),
                    title: Text(m['name']!,
                        style: GoogleFonts.lato(fontWeight: FontWeight.w600)),
                    subtitle: Text(m['role']!,
                        style:
                            GoogleFonts.lato(fontSize: 13, color: Colors.grey)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}