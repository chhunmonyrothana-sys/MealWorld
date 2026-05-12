import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'meal_model.dart';
import 'meal_service.dart';

class DetailScreen extends StatefulWidget {
  final String mealId;
  const DetailScreen({super.key, required this.mealId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Meal? _meal;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadDetail();
  }

  Future<void> _loadDetail() async {
    try {
      final meal = await MealService.fetchMealDetail(widget.mealId);
      setState(() {
        _meal = meal;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Screen',
          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
        ),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text('Error: $_error'))
              : _meal == null
                  ? const Center(child: Text('Meal not found.'))
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Hero image
                          Image.network(
                            _meal!.thumbnail,
                            width: double.infinity,
                            height: 260,
                            fit: BoxFit.cover,
                            loadingBuilder: (_, child, prog) => prog == null
                                ? child
                                : const SizedBox(
                                    height: 260,
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Tags row
                                Row(
                                  children: [
                                    _Tag(label: _meal!.category,
                                        color: colorScheme.primaryContainer,
                                        textColor:
                                            colorScheme.onPrimaryContainer),
                                    const SizedBox(width: 8),
                                    _Tag(
                                        label: _meal!.area,
                                        color: colorScheme.secondaryContainer,
                                        textColor:
                                            colorScheme.onSecondaryContainer),
                                  ],
                                ),
                                const SizedBox(height: 12),

                                // Meal name
                                Text(
                                  _meal!.name,
                                  style: GoogleFonts.lato(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // Ingredients
                                Text(
                                  'Ingredients',
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ...List.generate(
                                  _meal!.ingredients.length,
                                  (i) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    child: Row(
                                      children: [
                                        Icon(Icons.circle,
                                            size: 8,
                                            color: colorScheme.primary),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            '${_meal!.measures[i]} ${_meal!.ingredients[i]}',
                                            style: GoogleFonts.lato(
                                                fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // Instructions
                                Text(
                                  'Instructions',
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  _meal!.instructions,
                                  style: GoogleFonts.lato(
                                    fontSize: 14,
                                    height: 1.7,
                                    color: colorScheme.onSurface
                                        .withOpacity(0.8),
                                  ),
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;

  const _Tag(
      {required this.label,
      required this.color,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.lato(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
