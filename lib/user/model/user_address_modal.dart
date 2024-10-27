class User_Address_Modal{
  String? name;
  String? phone;
  String? pincode;
  String? address;

  User_Address_Modal({
    this.name,
    this.phone,
    this.pincode,
    this.address
  });

  Map<String, dynamic> tojson(){
    return {
      "name" : name,
      "phone" : phone,
      "pincode" : pincode,
      "address" : address
      
    };
  }
}