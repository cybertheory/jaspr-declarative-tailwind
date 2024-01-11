# jaspr-declarative-tailwind

A declarative Tailwind class generator written in dart. Create a list or string of Tailwind classes using a declarative interface, similar to Flutter and Jaspr.

## Quickstart

The Tailwind Class generator can be used in a Jaspr app or in any other dart project where inline Tailwind utility classes are needed.
It allows you to generate the needed Tailwind classes in a Flutter-like structure.

If you are using the declarative Tailwind generator for Jaspr, make sure you have jaspr installed and [setup](https://docs.page/schultek/jaspr/quick-start).

Then create a new jaspr project.
```bash
jaspr create my_new_project
```

Install JDT
'''bash
dart pub add jaspr-declarative-Tailwind
'''

If you are not using Jaspr, just install JDT and use it as needed.

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

How does this work? Well, TWClassList is a descendant of the ListBase<String> class, so it can be used like a list of strings (each string being a class).
i.e
```dart
 //this will work!
 List<String> classes = TWClassList(
          generators: TWGenerators.layout(flex: TWFlexValue.flexAuto));
```

If you need a super-string of all classes, use `TWClassList` like a string
```dart
  print(TWClassList(
          generators: TWGenerators.layout(flex: TWFlexValue.flexAuto)));

  // output: 'flex flex-auto'
```
