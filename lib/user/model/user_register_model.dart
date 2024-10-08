class user_register_Model{
  String? name;
  String? password;
  String? emaill;
  String? address;
  String? age;
  String? phone;
  String? uid;

  user_register_Model({
    this.name,
    this.password,
    this.emaill,
    this.address,
    this.age,
    this.phone,
    this.uid
  });

  Map<String, dynamic> tojson(){
    return {
      "name" : name,
      "password" : password,
      "email" : emaill,
      "addrress" : address,
      "age" : age,
      "phone" : phone,
      "uid" : uid
      
    };
  }
}