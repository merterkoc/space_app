class ISSResponseEntity {
  ISSResponseEntity({required this.timestamp, this.issPositionEntity});

  ISSResponseEntity.failed();

  ISSResponseEntity.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'] as int;
    issPositionEntity = json['iss_position'] != null
        ? ISSPositionEntity.fromJson(
      json['iss_position'] as Map<String, dynamic>,
    )
        : null;
  }

  late final int timestamp;
  late final ISSPositionEntity? issPositionEntity;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    if (issPositionEntity != null) {
      data['iss_position'] = issPositionEntity!.toJson();
    }
    return data;
  }
}

class ISSPositionEntity {
  ISSPositionEntity({required this.latitude, required this.longitude});

  ISSPositionEntity.fromJson(
      Map<String, dynamic> json,
      ) {
    latitude = json['latitude'] as double;
    longitude = json['longitude'] as double;
  }

  late final double latitude;
  late final double longitude;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }

  @override
  String toString() {
    return 'ISSPositionEntity{latitude: $latitude, longitude: $longitude}';
  }
}
