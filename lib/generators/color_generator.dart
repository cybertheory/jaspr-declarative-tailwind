class ColorGenerator {
  // Color properties
  String? textColor;
  String? backgroundColor;
  String? borderColor;
  String? divideColor;
  String? placeholderColor;

  ColorGenerator({
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    this.divideColor,
    this.placeholderColor,
  });

  List<String> generateColorClasses() {
    List<String> classes = [];

    // Text color
    if (textColor != null) {
      classes.add('text-$textColor');
    }

    // Background color
    if (backgroundColor != null) {
      classes.add('bg-$backgroundColor');
    }

    // Border color
    if (borderColor != null) {
      classes.add('border-$borderColor');
    }

    // Divide color
    if (divideColor != null) {
      classes.add('divide-$divideColor');
    }

    // Placeholder color
    if (placeholderColor != null) {
      classes.add('placeholder-$placeholderColor');
    }

    return classes;
  }
}

void main() {
  // Example usage
  var colorGenerator = ColorGenerator(
    textColor: 'blue-700',
    backgroundColor: 'gray-200',
    borderColor: 'border-blue-500',
    divideColor: 'divide-gray-400',
    placeholderColor: 'placeholder-gray-500',
  );

  List<String> colorClasses = colorGenerator.generateColorClasses();

  // Output the generated color classes
  print(colorClasses);
}
