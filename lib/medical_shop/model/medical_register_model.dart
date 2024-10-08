class Medical_Register_Modal{
  String? name;
  String? password;
  String? email;
  String? address;
  String? licensenumber;
  String? phone;
  String? shopname;
  String? uid; 

  Medical_Register_Modal({
    this.name,
    this.password,
    this.email,
    this.address,
    this.licensenumber,
    this.phone,
    this.shopname,
    this.uid
  });

  Map<String, dynamic> tojson(){
    return{
      "name" : name,
      "password" : password,
      "email" : email,
      "addrress" : address,
      "license" : licensenumber,
      "phone" : phone,
      "shop" : shopname,
      "uid" : uid
    };
  }
}