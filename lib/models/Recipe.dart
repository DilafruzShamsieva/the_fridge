class Recipe {
  final String recipe_id;
  final List<String> ingredients;
  final String prepSteps;

  Recipe({
    required this.recipe_id,
    required this.ingredients,
    required this.prepSteps,
  });
}