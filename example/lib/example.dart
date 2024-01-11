import 'package:jaspr/jaspr.dart';
import 'package:jaspr_declarative_tailwind/tailwind.dart';
import 'package:jaspr_declarative_tailwind/utils.dart';

void main() {
  print(TWGridColumns.span1.name);
  List<String> classes = TWClassList(
      generators: TWGenerators.layout(gridColumn: TWGridColumns.span1));
  print(classes);

  DomComponent(
      tag: "p",
      classes: TWClassList(
          generators: TWGenerators.layout(flex: TWFlexValue.flexAuto)));
  print(
      TWClassList(generators: TWGenerators.layout(flex: TWFlexValue.flexAuto)));
}
