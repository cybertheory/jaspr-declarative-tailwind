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
