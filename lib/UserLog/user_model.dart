

class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? phonebnumber;
  String? addresslocatation;


  UserModel({this.uid, this.email, this.firstName, this.lastName,this.phonebnumber,this.addresslocatation});


  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['secondName'],
      phonebnumber: map['phonebnumber'],
      addresslocatation: map['addresslocatation'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': lastName,
      "addresslocatation":addresslocatation,
      "phonebnumber":phonebnumber,
    };
  }
}
