import 'package:jaspr_declarative_tailwind/tailwind.dart';
import 'package:jaspr_declarative_tailwind/utils.dart';
import 'package:test/test.dart';

void main() {
  group('TWClassList', () {
    test('returns correct string', () {
      final generators = TWGenerators.layout(
        container: TWContainerType.container,
        mxAuto: true,
        flex: TWFlexValue.flex,
        flexDirection: TWFlexDirection.row,
        justifyContent: TWJustifyContent.center,
        alignItems: TWAlignItems.center,
        gridCols: TWGridColumns.span2,
        gridColumn: TWGridColumns.span1,
        gridRows: TWGridRows.span3,
        gridRow: TWGridRows.span2,
        position: TWPositionType.relative,
        top: TWSpacingUnit(value: TWSpacingValue.size4),
        right: TWSpacingUnit(value: TWSpacingValue.size8),
        bottom: TWSpacingUnit(value: TWSpacingValue.size12),
        left: TWSpacingUnit(value: TWSpacingValue.size16),
        display: TWDisplayType.inlineFlex,
        visibility: TWVisibilityType.visible,
      );

      final twClassList = TWClassList(generators: generators);

      expect(
          twClassList.toString(),
          equals(
              'container mx-auto flex flex-flex flex-row justify-center items-center grid-cols-span-2 col-span-1 grid-rows-span-3 row-span-2 position-relative top-4 right-8 bottom-12 left-16 display-inlineFlex visible-visible'));
    });

    test('length property works correctly', () {
      final twClassList = TWClassList(generators: TWGenerators.layout());

      expect(twClassList.length, equals(0));

      twClassList.add('custom-class-1');
      twClassList.add('custom-class-2');

      expect(twClassList.length, equals(2));

      twClassList.length = 1;

      expect(twClassList.length, equals(1));
      expect(twClassList[0], equals('custom-class-1'));
    });

    test('generator creates correct classes', () {
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
      List<String> classes = TWClassList(generators: generators);
      expect(
          classes,
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
