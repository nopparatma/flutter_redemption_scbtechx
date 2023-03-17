import '../models/send_email_rq.dart';
import 'base_service.dart';

class EmailService extends BaseService {
  var mainUrl = 'https://api.emailjs.com/api/v1.0/email';

  sendEmail(SendEmailRq rq) async {
    return await post(
      '$mainUrl/send',
      rq.toJson(),
      (data) => data,
    );
  }
}
