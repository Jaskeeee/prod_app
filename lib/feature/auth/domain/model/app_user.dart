class AppUser {

  final String uid;
  final String name;
  final String email;

  AppUser({
    required this.uid,
    required this.email,
    required this.name,
  });

  Map<String,dynamic> toJson(){
    return {
      "uid":uid,
      "email":email,
      "name":name
    };
  }

  factory AppUser.fromJson(Map<String,dynamic> json){
    return AppUser(
      uid: json["uid"], 
      email: json["email"], 
      name: json["name"]
    );
  }

}