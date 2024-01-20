import 'package:equatable/equatable.dart';
import 'package:space_app/src/service/model/coordinate_dto.dart';

class AstronomicEventDTO extends Equatable {
  final String? sId;
  final List<String>? notification;
  final String? name;
  final String? description;
  final String? startDate;
  final String? endDate;
  final CoordinateDTO? coordinate;
  final List<String>? image;

  const AstronomicEventDTO(
      {this.sId,
      this.notification,
      this.name,
      this.description,
      this.startDate,
      this.endDate,
      this.coordinate,
      this.image});

  factory AstronomicEventDTO.fromJson(Map<String, dynamic> json) =>
      AstronomicEventDTO(
        sId: json['_id'] as String?,
        notification: (json['notification'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        name: json['name'] as String?,
        description: json['description'] as String?,
        startDate: json['start_date'] as String?,
        endDate: json['end_date'] as String?,
        coordinate: json['coordinate'] == null
            ? null
            : CoordinateDTO.fromJson(
                json['coordinate'] as Map<String, dynamic>),
        image:
            (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (notification != null) {
      data['notification'] = notification!.map((v) => v).toList();
    }
    data['name'] = name;
    data['description'] = description;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    if (coordinate != null) {
      data['coordinate'] = coordinate!.toJson();
    }
    data['image'] = image;
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
