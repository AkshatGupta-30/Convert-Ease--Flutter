abstract class ConverterAb<T> {
  ConverterAb(String s, String t);

  double convert(double inputValue, T fromUnit, T toUnit);
}
