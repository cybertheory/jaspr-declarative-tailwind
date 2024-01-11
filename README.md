# jaspr-declarative-tailwind
A declarative Tailwind class generator written in dart

```bash
dart pub add jaspr-declarative-tailwind
```

## Usage
Wherever you may need Tailwind classes instantiate a `TWClassList`
```dart
//example with Jaspr's DomComponent
DomComponent(tag: "p", classes: TWClassList(generators: ));
```

The package provides a declarative interface to Tailwind's utility classes categorized by many common use cases in the form of `TWGenerators`

i.e

```dart
//example with flex styling in the layout generator
 DomComponent(
      tag: "p",
      classes: TWClassList(
          generators: TWGenerators.layout(flex: TWFlexValue.flexAuto)));
```

How does this work? Well, TwClass list is a descendant of the ListBase<String> class, so it can be used like a list of strings (each string being a class).

i.e

```dart
 //this will work!
 List<String> classes = TWClassList(
          generators: TWGenerators.layout(flex: TWFlexValue.flexAuto));
```

If you need a super-string of all classes, We have overrided to the toString method

```dart
  print(TWClassList(
          generators: TWGenerators.layout(flex: TWFlexValue.flexAuto)));

  // output: 'flex flex-auto'
```
