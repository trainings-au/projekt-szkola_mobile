class InstructionModel {
  final String title;
  final String description;
  final String urlToIcon;
  final List<ContactDetails> models;

  InstructionModel(this.title, this.description, this.urlToIcon, this.models);
}

class ContactDetails {
  final String phone;
  final String www;
  final String lat;
  final String lon;
  ContactDetails(this.phone, this.www, this.lat, this.lon);
}
