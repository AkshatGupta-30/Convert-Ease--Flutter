import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum Time {
  seconds, deciseconds, centiseconds, milliseconds, microseconds, nanoseconds,
  minutes, hours, days, weeks, years365, lustrum, decades, centuries, millennium,
}

extension TimeExt on Time {
  Converter get toConverter {
    switch (this) {
      case Time.seconds: return Converter("Seconds", "s");
      case Time.deciseconds: return Converter("Deciseconds", "ds");
      case Time.centiseconds: return Converter("Centiseconds", "cs");
      case Time.milliseconds: return Converter("Milliseconds", "ms");
      case Time.microseconds: return Converter("Microseconds", "µs");
      case Time.nanoseconds: return Converter("Nanoseconds", "ns");
      case Time.minutes: return Converter("Minutes", "min");
      case Time.hours: return Converter("Hours", "hr");
      case Time.days: return Converter("Days", "days");
      case Time.weeks: return Converter("Weeks", "weeks");
      case Time.years365: return Converter("Years365", "years");
      case Time.lustrum: return Converter("Lustrum", "lustrum");
      case Time.decades: return Converter("Decades", "decades");
      case Time.centuries: return Converter("Centuries", "centuries");
      case Time.millennium: return Converter("Millennium", "millennium");
    }
  }

  static final Map<Time, double> to = {
    Time.seconds: 1,
    Time.deciseconds: 0.1,
    Time.centiseconds: 0.01,
    Time.milliseconds: 0.001,
    Time.microseconds: 0.000001,
    Time.nanoseconds: 0.000000001,
    Time.minutes: 60,
    Time.hours: 3600,
    Time.days: 86400,
    Time.weeks: 604800,
    Time.years365: 31536000,
    Time.lustrum: 157680000,
    Time.decades: 315360000,
    Time.centuries: 3153600000,
    Time.millennium: 31536000000,
  };

  static final Map<Time, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}

class TimeConverter implements ConverterAb<Time> {
  @override
  double convert(double value, Time from, Time to) {
    return value * TimeExt.to[from]! * TimeExt.from[to]!;
  }
}