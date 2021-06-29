class UserModel {
  late final String name;
  late final String userProfile;
  late final List products;

  UserModel(
      {required this.name, required this.userProfile, required this.products});

  UserModel.fromJson(Map model) {
    this.name = model['name'];
    this.userProfile = model['userProfile'];
    this.products = model['products'];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "userProfile": this.userProfile,
      "products": this.products
    };
  }
}
