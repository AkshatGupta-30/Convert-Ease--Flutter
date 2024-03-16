import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum Temperature {
  fahrenheit, celsius, kelvin, reamur,
  romer, delisle, rankine,
}

extension TemperatureExt on Temperature {
  Converter get toConverter {
    switch (this) {
      case Temperature.fahrenheit: return Converter("Fahrenheit", "°F");
      case Temperature.celsius: return Converter("Celsius", "°C");
      case Temperature.kelvin: return Converter("Kelvin", "K");
      case Temperature.reamur: return Converter("Reamur", "°Re");
      case Temperature.romer: return Converter("Romer", "°Rø");
      case Temperature.delisle: return Converter("Delisle", "°De");
      case Temperature.rankine: return Converter("Rankine", "°R");
    }
  }

  static final Map<Temperature, double> to = {
    Temperature.fahrenheit: 9/5, // Fahrenheit to Kelvin
    Temperature.celsius: 1, // Celsius to Kelvin
    Temperature.kelvin: 1, // Kelvin to Kelvin
    Temperature.reamur: 5/4, // Reamur to Kelvin
    Temperature.romer: 40/21, // Romer to Kelvin
    Temperature.delisle: -2/3, // Delisle to Kelvin
    Temperature.rankine: 5/9, // Rankine to Kelvin
  };

  static final Map<Temperature, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}

class TemperatureConverter implements ConverterAb<Temperature> {
  @override
  double convert(double value, Temperature from, Temperature to) {
    var celsiusValue = value * TemperatureExt.to[from]!;
    return celsiusValue * TemperatureExt.from[to]!;
  }
}