//Address IP
class AddressIPInternetModel {
  late String ip;
  late String country_code;
  late String country_name;
  late String region_name;
  late String city_name;
  late num latitude;
  late num longitude;
  late String zip_code;
  late String time_zone;
  late String asn;
  late String asd;
  late bool is_proxy;

  AddressIPInternetModel.newEmpty() {
    ip = "";
    country_code = "";
    country_name = "";
    region_name = "";
    city_name = "";
    latitude = 0;
    longitude = 0;
    zip_code = "";
    time_zone = "";
    asn = "";
    asd = "";
    is_proxy = false;
  }

  AddressIPInternetModel.fromJson(Map<String, dynamic> json)
      : ip = json['ip'] as String,
        country_code = json['country_code'] as String,
        country_name = json['country_name'] as String,
        region_name = json['region_name'] as String,
        city_name = json['city_name'] as String,
        latitude = json['latitude'] as num,
        longitude = json['longitude'] as num,
        zip_code = json['zip_code'] as String,
        time_zone = json['time_zone'] as String,
        asn = json['asn'] as String,
        asd = json['as'] as String,
        is_proxy = json['is_proxy'] as bool;

  Map<String, dynamic> toJson() => {
        'ip': ip,
        'country_code': country_code,
        'country_name': country_name,
        'region_name': region_name,
        'city_name': city_name,
        'latitude': latitude,
        'longitude': longitude,
        'zip_code': zip_code,
        'time_zone': time_zone,
        'asn': asn,
        'as': asd,
        'is_proxy': is_proxy,
      };
}

///TheWeaTher
class ApiTheWeatherInternetModel {
  late String cod;
  late int message;
  late int cnt;
  late List<TheWeatherInternet> list;
  ApiTheWeatherInternetModel.newEmpty() {
    cod = "";
    message = 0;
    cnt = 0;
    list = [];
  }
  ApiTheWeatherInternetModel.fromJson(Map<String, dynamic> json)
      : cod = json['cod'] as String,
        message = json['message'] as int,
        cnt = json['cnt'] as int,
        list = (json['list'] as List<dynamic>)
            .map((data) => TheWeatherInternet.fromJson(data))
            .toList();
}

class TheWeatherInternet {
  late int dt;
  late Main main;
  late List<Weather> weather;
  late Clouds clouds;
  late Wind wind;
  late int visibility;
  late num pop;
  late Sys sys;
  late String dt_txt;
  TheWeatherInternet.newEmpty() {
    dt = 0;
    main = Main.newEmpty();
    weather = [];
    clouds = Clouds.newEmpty();
    wind = Wind.newEmpty();
    visibility = 0;
    pop = 0;
    sys = Sys.newEmpty();
    dt_txt = "";
  }
  TheWeatherInternet.fromJson(Map<String, dynamic> json)
      : dt = json['dt'] as int,
        main = Main.fromJson(json['main']),
        weather = (json['weather'] as List<dynamic>)
            .map((data) => Weather.fromJson(data))
            .toList(),
        clouds = Clouds.fromJson(json['clouds']),
        wind = Wind.fromJson(json['wind']),
        visibility = json['visibility'] as int,
        pop = json['pop'] as num,
        sys = Sys.fromJson(json['sys']),
        dt_txt = json['dt_txt'] as String;
}

class Main {
  late num temp;
  late num feels_like;
  late num temp_min;
  late num temp_max;
  late num pressure;
  late num sea_level;
  late num grnd_level;
  late num humidity;
  late num temp_kf;

  Main.newEmpty() {
    temp = 0;
    feels_like = 0;
    temp_min = 0;
    temp_max = 0;
    pressure = 0;
    sea_level = 0;
    grnd_level = 0;
    humidity = 0;
    temp_kf = 0;
  }
  Main.fromJson(Map<String, dynamic> json)
      : temp = json['temp'] as num,
        feels_like = json['feels_like'] as num,
        temp_min = json['temp_min'] as num,
        temp_max = json['temp_max'] as num,
        pressure = json['pressure'] as num,
        sea_level = json['sea_level'] as num,
        grnd_level = json['grnd_level'] as num,
        humidity = json['humidity'] as num,
        temp_kf = json['temp_kf'] as num;

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feels_like,
        'temp_min': temp_min,
        'temp_max': temp_max,
        'pressure': pressure,
        'sea_level': sea_level,
        'grnd_level': grnd_level,
        'humidity': humidity,
        'temp_kf': temp_kf,
      };
}

class Weather {
  late int id;
  late String main;
  late String description;
  late String icon;

  Weather.newEmpty() {
    id = 0;
    main = "";
    description = "";
    icon = "";
  }
  Weather.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        main = json['main'] as String,
        description = json['description'] as String,
        icon = json['icon'] as String;

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}

class Clouds {
  late num all;

  Clouds.newEmpty() {
    all = 0;
  }
  Clouds.fromJson(Map<String, dynamic> json) : all = json['all'] as num;

  Map<String, dynamic> toJson() => {'all': all};
}

class Wind {
  late num speed;
  late num deg;
  late num gust;

  Wind.newEmpty() {
    speed = 0;
    deg = 0;
    gust = 0;
  }
  Wind.fromJson(Map<String, dynamic> json)
      : speed = json['speed'] as num,
        deg = json['deg'] as num,
        gust = json['gust'] as num;

  Map<String, dynamic> toJson() => {
        'speed': speed,
        'deg': deg,
        'gust': gust,
      };
}

class Sys {
  late String pod;

  Sys.newEmpty() {
    pod = "";
  }
  Sys.fromJson(Map<String, dynamic> json) : pod = json['pod'] as String;

  Map<String, dynamic> toJson() => {'pod': pod};
}
