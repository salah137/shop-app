class UserModel {
  final String name;
  final String userProfile;
  final List products;

  UserModel({required this.name, required this.userProfile, required this.products});

  Map<String,dynamic> toMap() {
    return {
      "name": this.name,
      "userProfile": this.userProfile,
      "products": this.products
    };
  }
}
