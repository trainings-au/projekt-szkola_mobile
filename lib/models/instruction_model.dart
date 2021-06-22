import 'contact_details.dart';

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
