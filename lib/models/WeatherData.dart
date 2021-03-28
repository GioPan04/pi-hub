class WeatherData {
  final String location;
  final double temp;
  final String description;
  final String icon;

  WeatherData({
    required this.location,
    required this.temp,
    required this.description,
    required this.icon
  });

  String get iconUrl => "https://openweathermap.org/img/wn/$icon@2x.png";
  String get localizedTemp => temp.toStringAsFixed(0) + "°";

  factory WeatherData.fromJSON(Map<String,dynamic> data) => WeatherData(
    location: data["name"],
    temp:data['main']['temp'],
    description: data['weather'][0]['description'],
    icon: data['weather'][0]['icon'],
  );
}