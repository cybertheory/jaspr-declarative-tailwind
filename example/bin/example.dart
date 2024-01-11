import 'package:jaspr_declarative_tailwind/tailwind.dart';
import 'package:jaspr_declarative_tailwind/utils.dart';

void main() {
  List<String> classes = TWClassList(
      generators: TWGenerators.layout(gridColumn: TWGridColumns.span1));
  print(classes);
}
