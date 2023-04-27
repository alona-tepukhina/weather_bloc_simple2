class CurrentWeather {
  CurrentWeather({
    this.city,
    this.conditionCode,
    this.weatherMessage,
    this.windSpeed,
    this.temperature,
  });

  String? city;
  int? conditionCode;
  String? weatherMessage;
  double? windSpeed;
  double? temperature;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        city: json['name'] as String,
        conditionCode: json["weather"][0]["id"] as int,
        weatherMessage: json["weather"][0]["description"] as String,
        windSpeed: json["wind"]["speed"] as double,
        temperature: json["main"]["temp"] as double,
      );
}
