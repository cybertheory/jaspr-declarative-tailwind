class TypographyGenerator {
  // Text properties
  String? fontSize;
  String? fontWeight;
  bool fontItalic;
  bool fontUnderline;
  String? letterSpacing;
  String? lineHeight;

  TypographyGenerator({
    this.fontSize,
    this.fontWeight,
    this.fontItalic = false,
    this.fontUnderline = false,
    this.letterSpacing,
    this.lineHeight,
  });

  List<String> generateTypographyClasses() {
    List<String> classes = [];

    // Font size
    if (fontSize != null) {
      classes.add('text-$fontSize');
    }

    // Font weight
    if (fontWeight != null) {
      classes.add('font-$fontWeight');
    }

    // Font style (italic)
    if (fontItalic) {
      classes.add('italic');
    }

    // Text decoration (underline)
    if (fontUnderline) {
      classes.add('underline');
    }

    // Letter spacing
    if (letterSpacing != null) {
      classes.add('tracking-$letterSpacing');
    }

    // Line height
    if (lineHeight != null) {
      classes.add('leading-$lineHeight');
    }

    return classes;
  }
}
