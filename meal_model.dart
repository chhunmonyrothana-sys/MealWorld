class Meal {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String thumbnail;
  final String? youtubeUrl;
  final List<String> ingredients;
  final List<String> measures;
  final bool isKhmer;

  Meal({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumbnail,
    this.youtubeUrl,
    required this.ingredients,
    required this.measures,
    this.isKhmer = false,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];
    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];
      if (ingredient != null && ingredient.toString().trim().isNotEmpty) {
        ingredients.add(ingredient.toString().trim());
        measures.add(measure?.toString().trim() ?? '');
      }
    }
    return Meal(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? '',
      category: json['strCategory'] ?? '',
      area: json['strArea'] ?? 'Cambodian',
      instructions: json['strInstructions'] ?? '',
      thumbnail: json['strMealThumb'] ?? '',
      youtubeUrl: json['strYoutube'],
      ingredients: ingredients,
      measures: measures,
      isKhmer: json['isKhmer'] ?? false,
    );
  }
}

class MealSummary {
  final String id;
  final String name;
  final String thumbnail;
  final bool isKhmer;

  MealSummary({
    required this.id,
    required this.name,
    required this.thumbnail,
    this.isKhmer = false,
  });

  factory MealSummary.fromJson(Map<String, dynamic> json) {
    return MealSummary(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? '',
      thumbnail: json['strMealThumb'] ?? '',
      isKhmer: json['isKhmer'] ?? false,
    );
  }
}

class KhmerFoodData {
  static const List<String> categories = [
    'All', 'Soup', 'Noodles', 'Rice', 'Grilled', 'Dessert',
  ];

  static final List<Meal> khmerMeals = [
    Meal(
      id: 'k001',
      name: 'Amok Trey (Fish Amok)',
      category: 'Soup',
      area: 'Cambodian',
      thumbnail: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Amok_trey.jpg/320px-Amok_trey.jpg',
      instructions: 'Fish Amok is the national dish of Cambodia. Blend lemongrass, galangal, kaffir lime leaves, turmeric, garlic, shallots and dried chilies into a fine paste (kroeung). Mix the paste with coconut milk and egg. Add sliced fish and coat well. Steam in banana leaf cups for 20-25 minutes until set. Garnish with coconut cream and kaffir lime leaves. Serve with steamed rice.',
      ingredients: ['Fish fillet', 'Coconut milk', 'Lemongrass', 'Galangal', 'Kaffir lime leaves', 'Turmeric', 'Garlic', 'Shallots', 'Egg', 'Fish sauce', 'Palm sugar', 'Banana leaves'],
      measures: ['500g', '400ml', '2 stalks', '1 piece', '5 leaves', '1 tsp', '3 cloves', '3', '1', '2 tbsp', '1 tbsp', 'as needed'],
      isKhmer: true,
    ),
    Meal(
      id: 'k002',
      name: 'Bai Sach Chrouk (Pork & Rice)',
      category: 'Rice',
      area: 'Cambodian',
      thumbnail: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Bai_sach_chrouk.jpg/320px-Bai_sach_chrouk.jpg',
      instructions: 'Bai Sach Chrouk is a popular Cambodian breakfast dish. Marinate thinly sliced pork in coconut milk, garlic, and fish sauce for at least 2 hours or overnight. Grill the pork over charcoal until caramelized and slightly charred. Serve over broken rice with pickled daikon and carrots, fresh cucumber slices, and a bowl of clear broth on the side.',
      ingredients: ['Pork shoulder', 'Coconut milk', 'Garlic', 'Fish sauce', 'Sugar', 'Broken rice', 'Daikon radish', 'Carrots', 'Cucumber', 'Ginger', 'Salt', 'White pepper'],
      measures: ['500g', '200ml', '4 cloves', '3 tbsp', '2 tbsp', '2 cups', '1', '2', '1', '1 piece', 'to taste', 'to taste'],
      isKhmer: true,
    ),
    Meal(
      id: 'k003',
      name: 'Nom Banh Chok (Khmer Noodles)',
      category: 'Noodles',
      area: 'Cambodian',
      thumbnail: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Nom_Banh_Chok.jpg/320px-Nom_Banh_Chok.jpg',
      instructions: 'Nom Banh Chok is Cambodia\'s most beloved breakfast noodle dish. Make fish-based green curry sauce by blending lemongrass, galangal, turmeric, and kaffir lime into kroeung paste. Cook fish in water, remove bones and flake. Simmer kroeung in the fish broth, add coconut milk and flaked fish. Season with fish sauce. Pour over fresh rice noodles and top with fresh herbs, bean sprouts, banana blossom, and cucumber.',
      ingredients: ['Fresh rice noodles', 'Fish (snakehead)', 'Lemongrass', 'Galangal', 'Turmeric', 'Coconut milk', 'Fish sauce', 'Bean sprouts', 'Banana blossom', 'Mint leaves', 'Cucumber', 'Long beans'],
      measures: ['400g', '300g', '3 stalks', '2 pieces', '1 tsp', '200ml', '2 tbsp', '1 cup', '1 cup', 'handful', '1', '100g'],
      isKhmer: true,
    ),
    Meal(
      id: 'k004',
      name: 'Samlor Korko (Stirring Soup)',
      category: 'Soup',
      area: 'Cambodian',
      thumbnail: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Samlor_korko.jpg/320px-Samlor_korko.jpg',
      instructions: 'Samlor Korko is a traditional Cambodian vegetable soup. Roast unripe banana, eggplant, and prahok in the oven. Blend with lemongrass, galangal, and shallots. Boil water and add the blended paste. Add pork or chicken, long beans, green papaya, and other vegetables. Season with fish sauce and palm sugar. Stir continuously while adding vegetables.',
      ingredients: ['Pork ribs', 'Green papaya', 'Long beans', 'Eggplant', 'Unripe banana', 'Prahok', 'Lemongrass', 'Galangal', 'Shallots', 'Fish sauce', 'Palm sugar', 'Kaffir lime leaves'],
      measures: ['400g', '200g', '100g', '2', '1', '2 tbsp', '2 stalks', '1 piece', '3', '2 tbsp', '1 tbsp', '3 leaves'],
      isKhmer: true,
    ),
    Meal(
      id: 'k005',
      name: 'Lok Lak (Shaking Beef)',
      category: 'Grilled',
      area: 'Cambodian',
      thumbnail: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Lok_lak.jpg/320px-Lok_lak.jpg',
      instructions: 'Lok Lak is one of the most popular Cambodian dishes. Marinate beef cubes in oyster sauce, soy sauce, garlic, and sugar for 30 minutes. Heat oil in a wok on very high heat. Stir-fry the beef quickly, shaking the pan. Serve on a bed of lettuce and tomatoes with a dipping sauce made from lime juice, black pepper, and salt. Serve with rice and a fried egg on top.',
      ingredients: ['Beef tenderloin', 'Oyster sauce', 'Soy sauce', 'Garlic', 'Sugar', 'Black pepper', 'Lime', 'Lettuce', 'Tomatoes', 'Onion', 'Egg', 'Vegetable oil'],
      measures: ['500g', '3 tbsp', '2 tbsp', '4 cloves', '1 tsp', '1 tsp', '2', '1 head', '2', '1', '1', '3 tbsp'],
      isKhmer: true,
    ),
    Meal(
      id: 'k006',
      name: 'Kuy Teav (Noodle Soup)',
      category: 'Noodles',
      area: 'Cambodian',
      thumbnail: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Kuy_Teav.jpg/320px-Kuy_Teav.jpg',
      instructions: 'Kuy Teav is Cambodia\'s favourite noodle soup. Make the broth by boiling pork bones for 2-3 hours with garlic, shallots, and dried squid. Season with fish sauce and sugar. Cook rice noodles separately. Assemble bowls with noodles, sliced pork, shrimp, and pork balls. Pour hot broth over. Top with bean sprouts, spring onions, fried garlic, and fresh herbs.',
      ingredients: ['Rice noodles', 'Pork bones', 'Pork slices', 'Shrimp', 'Pork balls', 'Dried squid', 'Garlic', 'Shallots', 'Fish sauce', 'Sugar', 'Bean sprouts', 'Spring onions'],
      measures: ['300g', '500g', '200g', '150g', '100g', '30g', '5 cloves', '3', '3 tbsp', '1 tbsp', '1 cup', '3 stalks'],
      isKhmer: true,
    ),
    Meal(
      id: 'k007',
      name: 'Num Ansom Chek (Banana Sticky Rice)',
      category: 'Dessert',
      area: 'Cambodian',
      thumbnail: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Num_Ansom.jpg/320px-Num_Ansom.jpg',
      instructions: 'Num Ansom Chek is a traditional Cambodian sweet sticky rice cake. Soak glutinous rice overnight. Mix with coconut milk and salt. Place a layer of rice on a banana leaf, add a whole banana in the center, cover with more rice. Wrap tightly in banana leaves and tie with string. Steam or boil for 1.5-2 hours until fully cooked.',
      ingredients: ['Glutinous rice', 'Ripe bananas', 'Coconut milk', 'Palm sugar', 'Salt', 'Banana leaves', 'String'],
      measures: ['2 cups', '4', '400ml', '3 tbsp', '1 tsp', 'as needed', 'as needed'],
      isKhmer: true,
    ),
    Meal(
      id: 'k008',
      name: 'Moan Ang (Grilled Chicken)',
      category: 'Grilled',
      area: 'Cambodian',
      thumbnail: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Cambodian_BBQ.jpg/320px-Cambodian_BBQ.jpg',
      instructions: 'Moan Ang is Cambodian-style grilled chicken popular as street food. Marinate the whole chicken or pieces in lemongrass, garlic, turmeric, fish sauce, oyster sauce, coconut milk, and honey for at least 4 hours. Grill over charcoal on low heat, turning frequently and basting with the marinade. Cook until golden brown. Serve with Kampot pepper dipping sauce.',
      ingredients: ['Whole chicken', 'Lemongrass', 'Garlic', 'Turmeric', 'Fish sauce', 'Oyster sauce', 'Coconut milk', 'Honey', 'Kampot pepper', 'Lime juice', 'Salt', 'Vegetable oil'],
      measures: ['1 whole', '3 stalks', '6 cloves', '1 tsp', '3 tbsp', '2 tbsp', '100ml', '2 tbsp', '1 tsp', '2 tbsp', 'to taste', '2 tbsp'],
      isKhmer: true,
    ),
  ];

  static List<Meal> getByCategory(String category) {
    if (category == 'All') return khmerMeals;
    return khmerMeals.where((m) => m.category == category).toList();
  }

  static List<Meal> search(String query) {
    final q = query.toLowerCase();
    return khmerMeals.where((m) => m.name.toLowerCase().contains(q) || m.category.toLowerCase().contains(q)).toList();
  }

  static Meal? getById(String id) {
    try {
      return khmerMeals.firstWhere((m) => m.id == id);
    } catch (_) {
      return null;
    }
  }
}