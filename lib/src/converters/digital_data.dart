import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum DigitalData {
  bit, nibble, kilobit, megabit, gigabit, terabit, petabit, exabit,
  kibibit, mebibit, gibibit, tebibit, pebibit, exbibit,
  byte, kilobyte, megabyte, gigabyte, terabyte, petabyte, exabyte,
  kibibyte, mebibyte, gibibyte, tebibyte, pebibyte, exbibyte,
}

extension DigitalDataExt on DigitalData {
  Converter get toConverter {
    switch (this) {
      case DigitalData.bit: return Converter("Bit", "b");
      case DigitalData.nibble: return Converter("Nibble", "Nibble");
      case DigitalData.kilobit: return Converter("Kilobit", "kb");
      case DigitalData.megabit: return Converter("Megabit", "Mb");
      case DigitalData.gigabit: return Converter("Gigabit", "Gb");
      case DigitalData.terabit: return Converter("Terabit", "Tb");
      case DigitalData.petabit: return Converter("Petabit", "Pb");
      case DigitalData.exabit: return Converter("Exabit", "Eb");
      case DigitalData.kibibit: return Converter("Kibibit", "Kibit");
      case DigitalData.mebibit: return Converter("Mebibit", "Mibit");
      case DigitalData.gibibit: return Converter("Gibibit", "Gibit");
      case DigitalData.tebibit: return Converter("Tebibit", "Tibit");
      case DigitalData.pebibit: return Converter("Pebibit", "Pibit");
      case DigitalData.exbibit: return Converter("Exbibit", "Eibit");
      case DigitalData.byte: return Converter("Byte", "B");
      case DigitalData.kilobyte: return Converter("Kilobyte", "kB");
      case DigitalData.megabyte: return Converter("Megabyte", "MB");
      case DigitalData.gigabyte: return Converter("Gigabyte", "GB");
      case DigitalData.terabyte: return Converter("Terabyte", "TB");
      case DigitalData.petabyte: return Converter("Petabyte", "PB");
      case DigitalData.exabyte: return Converter("Exabyte", "EB");
      case DigitalData.kibibyte: return Converter("Kibibyte", "KiB");
      case DigitalData.mebibyte: return Converter("Mebibyte", "MiB");
      case DigitalData.gibibyte: return Converter("Gibibyte", "GiB");
      case DigitalData.tebibyte: return Converter("Tebibyte", "TiB");
      case DigitalData.pebibyte: return Converter("Pebibyte", "PiB");
      case DigitalData.exbibyte: return Converter("Exbibyte", "Eibyte");
    }
  }

  static final Map<DigitalData, int> to = {
    DigitalData.bit: 1,
    DigitalData.nibble: 4,
    DigitalData.kilobit: 1000,
    DigitalData.megabit: 1000000,
    DigitalData.gigabit: 1000000000,
    DigitalData.terabit: 1000000000000,
    DigitalData.petabit: 1000000000000000,
    DigitalData.exabit: 1000000000000000000,
    DigitalData.kibibit: 1024,
    DigitalData.mebibit: 1048576,
    DigitalData.gibibit: 1073741824,
    DigitalData.tebibit: 1099511627776,
    DigitalData.pebibit: 1125899906842624,
    DigitalData.exbibit: 1152921504606846976,
    DigitalData.byte: 8,
    DigitalData.kilobyte: 1000 * 8,
    DigitalData.megabyte: 1000000 * 8,
    DigitalData.gigabyte: 1000000000 * 8,
    DigitalData.terabyte: 1000000000000 * 8,
    DigitalData.petabyte: 1000000000000000 * 8,
    DigitalData.exabyte: 1000000000000000000 * 8,
    DigitalData.kibibyte: 1024 * 8,
    DigitalData.mebibyte: 1048576 * 8,
    DigitalData.gibibyte: 1073741824 * 8,
    DigitalData.tebibyte: 1099511627776 * 8,
    DigitalData.pebibyte: 1125899906842624 * 8,
    DigitalData.exbibyte: 1152921504606846976 * 8,
  };

  static final Map<DigitalData, double> from = to.map((key, value) => MapEntry(key, 1 / value));

}


class DigitalDataConverter implements ConverterAb<DigitalData> {
  @override
  double convert(double value, DigitalData from, DigitalData to) {
    double bits = value * DigitalDataExt.to[from]!;
    return bits * DigitalDataExt.from[to]!;
  }
}