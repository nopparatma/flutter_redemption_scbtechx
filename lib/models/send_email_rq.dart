class SendEmailRq {
  String? serviceId;
  String? templateId;
  String? userId;
  String? accessToken;
  TemplateParams? templateParams;

  SendEmailRq({this.serviceId, this.templateId, this.userId, this.accessToken, this.templateParams});

  SendEmailRq.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    templateId = json['template_id'];
    userId = json['user_id'];
    accessToken = json['accessToken'];
    templateParams = json['template_params'] != null ? TemplateParams.fromJson(json['template_params']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_id'] = serviceId;
    data['template_id'] = templateId;
    data['user_id'] = userId;
    data['accessToken'] = accessToken;
    if (templateParams != null) {
      data['template_params'] = templateParams!.toJson();
    }
    return data;
  }
}

class TemplateParams {
  String? toName;
  String? userEmail;
  String? productName;
  String? productPrice;
  String? productRate;
  String? totalPoint;
  String? pointBalance;

  TemplateParams({this.toName, this.userEmail, this.productName, this.productPrice, this.productRate, this.totalPoint, this.pointBalance});

  TemplateParams.fromJson(Map<String, dynamic> json) {
    toName = json['to_name'];
    userEmail = json['user_email'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productRate = json['product_rate'];
    totalPoint = json['total_point'];
    pointBalance = json['point_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['to_name'] = toName;
    data['user_email'] = userEmail;
    data['product_name'] = productName;
    data['product_price'] = productPrice;
    data['product_rate'] = productRate;
    data['total_point'] = totalPoint;
    data['point_balance'] = pointBalance;
    return data;
  }
}
