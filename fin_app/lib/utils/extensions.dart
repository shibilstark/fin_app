extension AppStringExtension on String {
  bool isContainOneDigit() => RegExp('[0-9]').hasMatch(this);
  bool isContainOneCapitalLetter() => RegExp('[A-Z]').hasMatch(this);
  bool isContainOneSmallLetter() => RegExp('[a-z]').hasMatch(this);
  bool isContainOneSpecialCharecter() => RegExp('[_@./#&+-]').hasMatch(this);
}
