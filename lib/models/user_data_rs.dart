class UserDataRs {
  CustomerData? customerData;

  UserDataRs({this.customerData});

  UserDataRs.fromJson(Map<String, dynamic> json) {
    customerData = json['customerData'] != null ? CustomerData.fromJson(json['customerData']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customerData != null) {
      data['customerData'] = customerData!.toJson();
    }
    return data;
  }
}

class CustomerData {
  String? name;
  int? pointAmount;
  String? email;

  CustomerData({this.name, this.pointAmount, this.email});

  CustomerData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    pointAmount = json['pointAmount'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['pointAmount'] = pointAmount;
    data['email'] = email;
    return data;
  }
}
