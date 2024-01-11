import '../generators/effect_generator.dart';
import '../tailwind.dart';
import '../utils.dart';

void main() {
  print(TWGridColumns.span1.name);
  List<String> classes = TWClassList(
      generators: TWGenerators.layout(gridColumn: TWGridColumns.span1));
  print(classes);
}
