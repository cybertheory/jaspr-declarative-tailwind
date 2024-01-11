enum TWContainerType {
  container,
  containerSm,
  containerMd,
  containerLg,
  containerXl,
}

enum TWFlexDirection {
  row,
  rowReverse,
  col,
  colReverse,
}

enum TWFlexValue {
  flex,
  flex1,
  flexAuto,
  flexInitial,
  flexNone,
}

enum TWJustifyContent {
  start,
  end,
  center,
  between,
  around,
  evenly,
}

enum TWAlignItems {
  start,
  end,
  center,
  baseline,
  stretch,
}

enum TWGridColumns {
  auto,
  span1,
  span2,
  span3,
  span4,
  span5,
  span6,
  spanFull,
}

extension TWGridColumnsExtension on TWGridColumns {
  String get name {
    if (this == TWGridColumns.auto) {
      return 'auto';
    } else if (this == TWGridColumns.spanFull) {
      return 'span-full';
    }
    final spanNumber =
        toString().split('.').last.substring(4); // remove 'span' prefix

    return 'span-$spanNumber';
  }
}

enum TWGridRows {
  auto,
  span1,
  span2,
  span3,
  span4,
  span5,
  span6,
  spanFull,
}

extension TWGridRowsExtension on TWGridRows {
  String get name {
    if (this == TWGridRows.auto) {
      return 'auto';
    } else if (this == TWGridRows.spanFull) {
      return 'span-full';
    } else {
      final spanNumber =
          toString().split('.').last.substring(4); // remove 'span' prefix
      return 'span-$spanNumber';
    }
  }
}

enum TWPositionType {
  static,
  relative,
  absolute,
  fixed,
  sticky,
}

enum TWDisplayType {
  block,
  inline,
  inlineBlock,
  flex,
  inlineFlex,
  grid,
  inlineGrid,
}

enum TWVisibilityType {
  visible,
  invisible,
}

enum TWSpacingValue {
  size0, // 0
  px,
  size1, // 1
  size2,
  size3,
  // 0.5 rem is represented by size05 in the enum, so we'll use a comment to indicate the equivalent rem value
  sizeHalf, // 2
  // 1.5 rem is represented by size15 in the enum, so we'll use a comment to indicate the equivalent rem value
  sizeOneAndHalf, // 4
  // 2.5 rem is represented by size25 in the enum, so we'll use a comment to indicate the equivalent rem value
  sizeTwoAndHalf, // 6
  // 3.5 rem is represented by size35 in the enum, so we'll use a comment to indicate the equivalent rem value
  sizeThreeAndHalf, // 8
  size4, // 9
  size5, // 10
  size6, // 11
  size7, // 12
  size8, // 13
  size9, // 14
  size10, // 15
  size11, // 16
  size12, // 17
  size14, // 18
  size16, // 19
  size20, // 20
  size24, // 21
  size28, // 22
  size32, // 23
  size36, // 24
  size40, // 25
  size44, // 26
  size48, // 27
  size52, // 28
  size56, // 29
  size60, // 30
  size64, // 31
  size72, // 32
  size80, // 33
  size96, // 34
}

extension TWSpacingValueExtension on TWSpacingValue {
  String get name {
    if (this == TWSpacingValue.px || this == TWSpacingValue.size1) {
      return 'px';
    } else if (this.toString().contains('Half')) {
      if (this == TWSpacingValue.sizeHalf) return '0.5';
      if (this == TWSpacingValue.sizeOneAndHalf) return '1.5';
      if (this == TWSpacingValue.sizeTwoAndHalf) return '2.5';
      if (this == TWSpacingValue.sizeThreeAndHalf) return '3.5';
    }
    final number =
        toString().split('.').last.substring(4); // remove 'span' prefix
    return '$number';
  }
}

class TWSpacingUnit {
  final TWSpacingValue value;

  TWSpacingUnit({required this.value});

  @override
  String toString() {
    return value.name;
  }
}

enum TWColor {
  transparent,
  current,
  black,
  white,
  gray100,
  gray200,
  gray300,
  gray400,
  gray500,
  gray600,
  gray700,
  gray800,
  gray900,
  red100,
  red200,
  red300,
  red400,
  red500,
  red600,
  red700,
  red800,
  red900,
  yellow100,
  yellow200,
  yellow300,
  yellow400,
  yellow500,
  yellow600,
  yellow700,
  yellow800,
  yellow900,
  green100,
  green200,
  green300,
  green400,
  green500,
  green600,
  green700,
  green800,
  green900,
  blue100,
  blue200,
  blue300,
  blue400,
  blue500,
  blue600,
  blue700,
  blue800,
  blue900,
  indigo100,
  indigo200,
  indigo300,
  indigo400,
  indigo500,
  indigo600,
  indigo700,
  indigo800,
  indigo900,
  purple100,
  purple200,
  purple300,
  purple400,
  purple500,
  purple600,
  purple700,
  purple800,
  purple900,
  pink100,
  pink200,
  pink300,
  pink400,
  pink500,
  pink600,
  pink700,
  pink800,
  pink900,
}

extension TWColorExtension on TWColor {
  String get name {
    final colorName = toString().toLowerCase().split('.').last;
    final dashIndex = colorName.indexOf(RegExp(r'[0-9]'));
    final color = colorName.substring(0, dashIndex);
    final number = colorName.substring(dashIndex);
    return '$color-$number';
  } // remove 'span' prefix
}

class TWBorderColor {
  late final TWColor? color;
  late final TWColor? left;
  late final TWColor? top;
  late final TWColor? bottom;
  late final TWColor? right;
  late final TWColor? x;
  late final TWColor? y;
  late final TWColor? inlineStart;
  late final TWColor? inlineEnd;

  TWBorderColor.all({required this.color});

  TWBorderColor.only({this.left, this.top, this.right, this.bottom});

  TWBorderColor.ltrb(this.left, this.top, this.right, this.bottom);

  TWBorderColor.symmetric({this.x, this.y});

  TWBorderColor.inline({this.inlineEnd, this.inlineStart});

  @override
  String toString() {
    String classes = "";
    if (color != null) {
      classes += " border-color-$color";
    } else if (left != null) {
      classes += " border-color-l-$left";
    } else if (right != null) {
      classes += " border-color-r-$right";
    } else if (top != null) {
      classes += " border-color-t-$top";
    } else if (bottom != null) {
      classes += " border-color-b-$bottom";
    } else if (x != null) {
      classes += " border-color-x-$x";
    } else if (y != null) {
      classes += " border-color-y-$y";
    } else if (inlineStart != null) {
      classes += " border-color-s-$inlineStart";
    } else if (inlineEnd != null) {
      classes += " border-color-e-$inlineEnd";
    }
    return classes.trim();
  }
}

enum TWBorderWidthValue {
  width0,
  width1,
  width2,
  width4,
  width8,
}

extension TWBorderWidthExtension on TWBorderWidthValue {
  String get name {
    if (this == TWBorderWidthValue.width1) {
      return '';
    }
    final number =
        toString().split('.').last.substring(5); // remove 'span' prefix
    return number;
  }
}

class TWBorderWidth {
  late final TWBorderWidthValue? value;
  late final TWBorderWidthValue? left;
  late final TWBorderWidthValue? top;
  late final TWBorderWidthValue? bottom;
  late final TWBorderWidthValue? right;
  late final TWBorderWidthValue? x;
  late final TWBorderWidthValue? y;
  late final TWBorderWidthValue? inlineStart;
  late final TWBorderWidthValue? inlineEnd;

  TWBorderWidth.all({required this.value});

  TWBorderWidth.only({this.left, this.top, this.right, this.bottom});

  TWBorderWidth.ltrb(this.left, this.top, this.right, this.bottom);

  TWBorderWidth.symmetric({this.x, this.y});

  TWBorderWidth.inline({this.inlineEnd, this.inlineStart});

  TWBorderWidth({required this.value});

  @override
  String toString() {
    String classes = "";
    if (value != null) {
      classes += " border-$value";
    } else if (left != null) {
      classes += " border-l-$left";
    } else if (right != null) {
      classes += " border-r-$right";
    } else if (top != null) {
      classes += " border-t-$top";
    } else if (bottom != null) {
      classes += " border-b-$bottom";
    } else if (x != null) {
      classes += " border-x-$x";
    } else if (y != null) {
      classes += " border-y-$y";
    } else if (inlineStart != null) {
      classes += " border-s-$inlineStart";
    } else if (inlineEnd != null) {
      classes += " border-e-$inlineEnd";
    }
    return classes.trim().replaceAll("border-", "border");
  }
}

enum TWBorderRadiusValue {
  none,
  roundsm,
  round,
  roundmd,
  roundlg,
  roundxl,
  round2xL,
  round3xl,
  roundfull
}
