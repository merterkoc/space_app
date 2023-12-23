import 'package:equatable/equatable.dart';

class AstronomicEventDTO extends Equatable {
  String? sId;
  List<String>? notification;
  String? name;
  String? description;
  String? startDate;
  String? endDate;
  Coordinate? coordinate;
  List<String>? image;

  AstronomicEventDTO(
      {this.sId,
      this.notification,
      this.name,
      this.description,
      this.startDate,
      this.endDate,
      this.coordinate,
      this.image});

  AstronomicEventDTO.fromJson(Map<String, dynamic> json) {
    sId = json['id'];
    if (json['notification'] != null) {
      notification = List.empty(growable: true);
      json['notification'].forEach((v) {
        notification!.add(v);
      });
    }
    name = json['name'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    coordinate = json['coordinate'] != null
        ? Coordinate.fromJson(json['coordinate'])
        : null;
    image = json['image'] != null ? List<String>.from(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.notification != null) {
      data['notification'] = this.notification!.map((v) => v).toList();
    }
    data['name'] = this.name;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    if (this.coordinate != null) {
      data['coordinate'] = this.coordinate!.toJson();
    }
    data['image'] = this.image;
    return data;
  }

  @override
  List<Object?> get props => [
        sId,
        notification,
        name,
        description,
        startDate,
        endDate,
        coordinate,
        image,
      ];
}

class Coordinate {
  double? latitude;
  double? longitude;

  Coordinate({this.latitude, this.longitude});

  Coordinate.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
