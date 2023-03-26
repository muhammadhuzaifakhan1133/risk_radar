import 'package:stacked/stacked.dart';

class PaymentViewModel extends BaseViewModel {
  Map<String, bool> selected = {
    'Visa': true,
    'Paypal': false,
    "Master": false,
  };
}