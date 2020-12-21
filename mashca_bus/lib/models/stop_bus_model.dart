import 'package:mashca_bus/models/geo_location_model.dart';

class StopBuses{
  List<StopBus> items = new List();

  StopBuses();
  StopBuses.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null)return;

    for(var item in jsonList){
      final stopBus = new StopBus.fromJsonMap(item);
      items.add(stopBus);
    }
  }
}
class StopBus{
  String name;
  GeoLocation location;
  

  StopBus({this.name, this.location});

  StopBus.fromJsonMap(Map<dynamic,dynamic> json){
    if(json != null){
      name = json['name'];
      location= GeoLocation.fromJsonMap(json['location']);
    }
  }

}