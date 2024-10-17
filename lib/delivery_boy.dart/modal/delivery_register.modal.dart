class Delivery_Register_Model {
  String? name;
  String? password;
  String? email;
  String? address;
  String? age;
  String? phone;
  String? gender;
  String? bike;
  String? uid;

  Delivery_Register_Model({
    this.name,
    this.password,
    this.email,
    this.address,
    this.age,
    this.phone,
    this.gender,
    this.bike,
    this.uid
  });

  Map<String, dynamic> tojson(){
    return{
      "name" : name,
      "password" : password,
      "email" : email,
      "addrress" : address,
      "age" : age,
      "phone" : phone,
      "gender" : gender,
      "bike" : bike,
      "uid" : uid
    };
  }
}