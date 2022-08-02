class User {
  String id ="";
  String firstName ="";
  String lastName ="";
  String email ="";
  String gender ="";
  String image ="";
  String profile ="";
  String job ="";


  User(this.id, this.firstName, this.lastName, this.email, this.gender,
      this.image, this.profile, this.job);

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    gender = json['gender'];
    image = json['image'];
    profile = json['profile'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['profile'] = this.profile;
    data['job'] = this.job;
    return data;
  }
}

class Record {
  String id ="";
  String name ="";
  String describe ="";
  int? challenger;
  String image ="";
  int? popular;


  Record(this.name, this.describe, this.challenger, this.image, this.popular);

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    describe = json['describe'];
    challenger = json['challenger'];
    image = json['image'];
    popular = json['popular'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['describe'] = this.describe;
    data['challenger'] = this.challenger;
    data['image'] = this.image;
    data['popular'] = this.popular;
    return data;
  }
}