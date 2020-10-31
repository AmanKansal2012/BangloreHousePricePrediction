
import 'package:house_price_prediction/price_model.dart';
import 'package:http/http.dart' as http;

class PriceFetchService {
  static const API = 'http://127.0.0.1:5000';
  static const headers = {'Content-Type': 'application/json'};

  Future<PriceModel> fetchPrice(Map<String, dynamic> inputs) async {
    print("1");
    final response = await http.post('http://10.0.2.2:5000/predict',
      body: inputs,
    );
    print("ahha${response}");
    print(response.statusCode);

    if (response.statusCode == 200) {
      final String responseString = response.body;


      print(responseString);

      return priceModelFromJson(responseString);
    } else {
     print("error");
    }
  }

}