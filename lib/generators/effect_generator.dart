class EffectsGenerator {
  // Effects properties
  bool isHovered;
  bool isFocused;
  String? boxShadow;
  String? opacity;

  EffectsGenerator({
    this.isHovered = false,
    this.isFocused = false,
    this.boxShadow,
    this.opacity,
  });

  List<String> generateEffectsClasses() {
    List<String> classes = [];

    // Hover effect
    if (isHovered) {
      classes.add(
          'hover:bg-gray-300'); // Example hover effect for background color
    }

    // Focus effect
    if (isFocused) {
      classes.add(
          'focus:outline-none'); // Example focus effect for removing outline
    }

    // Box shadow
    if (boxShadow != null) {
      classes.add('shadow-$boxShadow');
    }

    // Opacity
    if (opacity != null) {
      classes.add('opacity-$opacity');
    }

    return classes;
  }
}
