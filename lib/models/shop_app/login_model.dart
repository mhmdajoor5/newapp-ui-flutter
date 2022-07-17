class ShopLoginModel{
  late bool status;
  late String? message;
  late UserData? data;

   ShopLoginModel.formJson(Map <String,dynamic> json)
   {
     status = json['status'];
     message = json['message'];
     data = json['data'] != null ? UserData.formJson(json['data']) : null ;
   }

}

class UserData{
   int? id;
   String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  //named counctour

UserData.formJson(Map <String,dynamic> json)
{
  name = json['name'];
  email = json['email'];
  phone = json['phone'];
  image = json['image'];
  points = json['points'];
  credit = json['credit'];
  token = json['token'];
}
}









