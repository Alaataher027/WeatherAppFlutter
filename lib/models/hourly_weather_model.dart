class HourlyWeatherModel {
  final String time;
  final double tempC;
  final String? image;
  final String weatherCondition;

  HourlyWeatherModel({
    required this.time,
    required this.tempC,
    this.image,
    required this.weatherCondition,
  });

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherModel(
        time: json['time'], // Extract time dynamically
        tempC: json['temp_c'], // Extract temperature dynamically
        weatherCondition: json["condition"]["text"]);
  }
}
