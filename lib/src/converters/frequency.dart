import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum Frequency {
  hertz, kilohertz, megahertz, gigahertz, terahertz,
  revolutionsPerMinute, cyclesPerSecond, beatsPerMinute,
}

extension FrequencyExt on Frequency {
  Converter get toConverter {
    switch (this) {
      case Frequency.hertz: return Converter("Hertz", "Hz");
      case Frequency.kilohertz: return Converter("Kilohertz", "kHz");
      case Frequency.megahertz: return Converter("Megahertz", "MHz");
      case Frequency.gigahertz: return Converter("Gigahertz", "GHz");
      case Frequency.terahertz: return Converter("Terahertz", "THz");
      case Frequency.revolutionsPerMinute: return Converter("Revolutions Per Minute", "rpm");
      case Frequency.cyclesPerSecond: return Converter("Cycles Per Second", "cps");
      case Frequency.beatsPerMinute: return Converter("Beats Per Minute", "bpm");
    }
  }

  static final Map<Frequency, double> to = {
    Frequency.hertz: 1,
    Frequency.kilohertz: 1000,
    Frequency.megahertz: 1000000,
    Frequency.gigahertz: 1000000000,
    Frequency.terahertz: 1000000000000,
    Frequency.revolutionsPerMinute: 1 / 60, // 1 rpm = 1/60 Hz
    Frequency.cyclesPerSecond: 1,
    Frequency.beatsPerMinute: 1 / 60, // 1 bpm = 1/60 Hz
  };

  static final Map<Frequency, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}


class FrequencyConverter implements ConverterAb<Frequency> {
  @override
  double convert(double value, Frequency from, Frequency to) {
    var hertz = value * FrequencyExt.to[from]!;
    return hertz * FrequencyExt.from[to]!;
  }
}