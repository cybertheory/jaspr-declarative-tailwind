import 'package:jaspr_declarative_tailwind/tailwind.dart';
import 'package:jaspr_declarative_tailwind/utils.dart';
import 'package:test/test.dart';

void main() {
  group('TWLayoutGenerator', () {
    test('layout generator creates correct classes', () {
      final generators = TWGenerators.layout(
        container: TWContainerType.containerSm,
        mxAuto: true,
        flex: TWFlexValue.flex1,
        flexDirection: TWFlexDirection.colReverse,
        justifyContent: TWJustifyContent.between,
        alignItems: TWAlignItems.baseline,
        gridCols: TWGridColumns.spanFull,
        gridColumn: TWGridColumns.span6,
        gridRows: TWGridRows.span4,
        gridRow: TWGridRows.span5,
        position: TWPositionType.absolute,
        top: TWSpacingUnit(value: TWSpacingValue.size6),
        right: TWSpacingUnit(value: TWSpacingValue.size10),
        bottom: TWSpacingUnit(value: TWSpacingValue.size14),
        left: TWSpacingUnit(value: TWSpacingValue.sizeHalf),
        display: TWDisplayType.inlineGrid,
        visibility: TWVisibilityType.invisible,
      );

      expect(
          generators.classes,
          equals([
            'containerSm',
            'mx-auto',
            'flex',
            'flex-flex1',
            'flex-colReverse',
            'justify-between',
            'items-baseline',
            'grid-cols-span-full',
            'col-span-6',
            'grid-rows-span-4',
            'row-span-5',
            'position-absolute',
            'top-6',
            'right-10',
            'bottom-14',
            'left-0.5',
            'display-inlineGrid',
            'visible-invisible'
          ]));
    });
  });

  // Add more test cases as needed for other classes and functionalities
}
