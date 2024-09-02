import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      print("loading");
      emit(WeatherBlocLoading());
      try {
        WeatherFactory wf = WeatherFactory("1c06ba256def9d380f8606cc47b0eed8",
            language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);

        emit(WeatherBlocSuccess(weather));
        print("weather");
        print(weather);
      } catch (e) {
        emit(WeatherBlocFilure());
        print("error occured");
      }
    });
  }
}
