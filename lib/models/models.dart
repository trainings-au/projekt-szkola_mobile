class InstructionModel {
  final String title;
  final String description;
  final String urlToIcon;
  final String type;
  final List<ContactDetails> models;

  InstructionModel(
      this.title, this.description, this.urlToIcon, this.type, this.models);

  factory InstructionModel.fromJson(Map<String, dynamic> json) {
    return InstructionModel(
        json['title'],
        json['description'],
        json['icon_path'],
        json['type'],
        json['contact_details']
            .map<ContactDetails>((e) => ContactDetails.fromJson(e))
            .toList());
  }
}

class ContactDetails {
  final String phone;
  final String www;
  final double lat;
  final double lon;
  final String address;
  ContactDetails(this.phone, this.www, this.lat, this.lon, this.address);

  factory ContactDetails.fromJson(Map<String, dynamic> json) {
    final address = generateAddress(json);
    return ContactDetails(json['phone_number'], json['website'],
        json['latitude'], json['longitude'], address);
  }

  static String generateAddress(Map<String, dynamic> json) {
    final city = json['city'];
    final street = json['street'];
    final buildingNumber = json['building_number'];
    final roomNumber = json['room_number'];
    final roomFormat = roomNumber != null && roomNumber.toString().isNotEmpty
        ? "/" + roomNumber.toString()
        : "";
    return city + ", " + street + " " + buildingNumber.toString() + roomFormat;
  }
}
