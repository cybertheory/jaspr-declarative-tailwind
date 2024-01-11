import 'dart:collection';
import 'utils.dart';

class TWClassList extends ListBase<String> {
  final List<String> customClasses = [];

  TWClassList({required TWGenerators generators}) {
    customClasses.addAll(generators.classes);
  }

  String toClasses() {
    return customClasses.join(' ');
  }

  @override
  void set length(int newLength) {
    customClasses.length = newLength;
  }

  @override
  int get length => customClasses.length;
  @override
  void add(String element) => customClasses.add(element);
  @override
  void addAll(Iterable<String> iterable) => customClasses.addAll(iterable);
  @override
  String operator [](int index) => customClasses[index];
  @override
  void operator []=(int index, String value) {
    customClasses[index] = value;
  }
}

abstract class TWGenerators {
  List<String> classes = [];
  TWGenerators();

  factory TWGenerators.layout({
    // Container
    TWContainerType? container,
    bool mxAuto,

    // Flexbox
    TWFlexValue? flex,
    TWFlexDirection? flexDirection,
    TWJustifyContent? justifyContent,
    TWAlignItems? alignItems,

    // Grid
    TWGridColumns? gridCols,
    TWGridColumns? gridColumn,
    TWGridRows? gridRows,
    TWGridRows? gridRow,

    // Positioning
    TWPositionType? position,
    TWSpacingUnit? top,
    TWSpacingUnit? right,
    TWSpacingUnit? bottom,
    TWSpacingUnit? left,

    // Display
    TWDisplayType? display,
    TWVisibilityType? visibility,
  }) = _TWLayoutGenerator;

  factory TWGenerators.combined({required List<TWGenerators> generators}) =
      _TWCombinedGenerator;
}

class _TWLayoutGenerator extends TWGenerators {
  _TWLayoutGenerator({
    this.container,
    this.mxAuto = false,
    this.flex,
    this.flexDirection,
    this.justifyContent,
    this.alignItems,
    this.gridCols,
    this.gridColumn,
    this.gridRows,
    this.gridRow,
    this.position,
    this.top,
    this.right,
    this.bottom,
    this.left,
    this.display,
    this.visibility,
  }) {
    classes.addAll([
      if (container != null) container!.name,
      if (mxAuto) 'mx-auto',
      if (flex != null) ...['flex', 'flex-${flex!.name}'],
      if (flexDirection != null) 'flex-${flexDirection!.name}',
      if (justifyContent != null) 'justify-${justifyContent!.name}',
      if (alignItems != null) 'items-${alignItems!.name}',
      if (gridCols != null) 'grid-cols-${gridCols!.name}',
      if (gridColumn != null) 'col-${gridColumn!.name}',
      if (gridRows != null) 'grid-rows-${gridRows!.name}',
      if (gridRow != null) 'row-${gridRow!.name}',
      if (position != null) 'position-${position!.name}',
      if (top != null) 'top-$top',
      if (right != null) 'right-$right',
      if (bottom != null) 'bottom-$bottom',
      if (left != null) 'left-$left',
      if (display != null) 'display-${display!.name}',
      if (visibility != null) 'visible-${visibility!.name}',
    ]);
  }

  // Container
  TWContainerType? container;
  bool mxAuto;

  // Flexbox
  TWFlexValue? flex;
  TWFlexDirection? flexDirection;
  TWJustifyContent? justifyContent;
  TWAlignItems? alignItems;

  // Grid
  TWGridColumns? gridCols;
  TWGridColumns? gridColumn;
  TWGridRows? gridRows;
  TWGridRows? gridRow;

  // Positioning
  TWPositionType? position;
  TWSpacingUnit? top;
  TWSpacingUnit? right;
  TWSpacingUnit? bottom;
  TWSpacingUnit? left;

  // Display
  TWDisplayType? display;
  TWVisibilityType? visibility;
}

class _TWCombinedGenerator extends TWGenerators {
  _TWCombinedGenerator({required List<TWGenerators> generators}) {
    generators.forEach((element) {
      classes.addAll(element.classes);
    });
  }
}

class _TWBorderGenerator extends TWGenerators {
  // Border properties
  String? borderWidth;
  String? borderStyle;
  String? borderRadius;

  _TWBorderGenerator({
    this.borderWidth,
    this.borderStyle,
    this.borderRadius,
  }) {
    // Border width
    if (borderWidth != null) {
      classes.add('border-$borderWidth');
    }

    // Border style
    if (borderStyle != null) {
      classes.add('border-$borderStyle');
    }

    // Border radius
    if (borderRadius != null) {
      classes.add('rounded-$borderRadius');
    }
  }
}
