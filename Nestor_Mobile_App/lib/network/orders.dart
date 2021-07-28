import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nestore/model/result.dart';
import 'dart:convert';

import 'package:nestore/network/network_client.dart';
import 'package:nestore/util/request_type.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final client = NetworkClient(http.Client());

  Future<Result> register(payload) async {
    final response = await http.post(Uri.parse('http://web.nestoronline.in/api/registration/App'), body: payload);
    var decoded = json.decode(response.body.substring(response.body.indexOf('{'), response.body.indexOf('}')+1));
      if(response.statusCode == 200) {
        return Result.success(decoded);
      } else {
        return Result.error(decoded["message"] == null ? decoded["data"] : decoded["message"]);
      }
  }

  Future<Result> verityOTP(payload) async {
    final response = await http.post(Uri.parse('http://web.nestoronline.in/api/registration/otp/verify/App'), body: payload);
    var decoded = json.decode(response.body.substring(response.body.indexOf('{'), response.body.indexOf('}')+1));
    if(response.statusCode == 200) {
      return Result.success(decoded);
    } else {
      return Result.error(decoded["message"] == null ? decoded["data"] : decoded["message"]);
    }
  }

  Future<Result> loginByOTP(payload) async {
    final response = await http.post(Uri.parse('http://web.nestoronline.in/api/send_otp_for_login/App'), body: payload);
    print(response.body);
    var decoded = json.decode(response.body.substring(response.body.indexOf('{'), response.body.indexOf('}')+1));
    if(response.statusCode == 200) {
      return Result.success(decoded);
    } else {
      return Result.error(decoded["message"] == null ? decoded["data"] : decoded["message"]);
    }
  }

Future<Result> loginOTP(payload) async {
  try {
    print(payload);
    final response = await client.request(
        requestType: RequestType.POST,
        path: 'otp_verify_login/App',
        parameter: payload
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return Result.success(json.decode(response.body));
    }
    else {
      print("error from jobs list api");
      final Map<String, dynamic> msg = json.decode(response.body);
      print(msg);
      return Result.error(
          msg["message"] == null ? msg["data"] : msg["message"]);
    }
  } catch (error) {
    print(error);

    print("catch jobs list api");
    return Result.error("Something went wrong!");
  }
}

  Future<Result> verifyMobile(payload) async {

    try {
      print(payload);
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'user/updateContact',
          parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> getTermsAndCondition() async {

    try {
      final response = await client.request(
          requestType: RequestType.GET,
          path: 'terms_and_conditions/App'
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> getAboutUs() async {
    try {
      final response = await client.request(
          requestType: RequestType.GET,
          path: 'aboutus/App'
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> getGuestHomeData() async {
    try {
      final response = await client.request(
          requestType: RequestType.GET,
          path: 'home/App'
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> searchOrder(name) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String mobileValue = prefs.getString('mobile');
      var payload = {
        'mobile': mobileValue,
        'name': name
      };
      print(payload);
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'search_my_order/App',
          parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }
  Future<Result> getChemistHomeData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String mobileValue = prefs.getString('mobile');
      var payload = {
        'mobile': mobileValue
      };
      print(payload);
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'chemist_home/App',
        parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> loginByPassword(payload) async {
    try {
      print(payload);
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'login/App',
          parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> logout() async {
    try {
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'logout/App'
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> getUserDetail() async {
    try {
      final response = await client.request(
          requestType: RequestType.GET,
          path: 'details/App'
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> getAddressList() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String mobileValue = prefs.getString('mobile');
      var payload = {
        'mobile': mobileValue
      };
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'get_address/App',
        parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> setDefaultAddress(id) async {
    try {
      var payload = {
        'address_id': id
      };
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'set_as_a_default_address/App',
          parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> editAddress(payload) async {
    try {
print(payload);
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'edit_address/App',
          parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> addAddress(payload) async {
    try {

      final response = await client.request(
          requestType: RequestType.POST,
          path: 'add_address/App',
          parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> setCurrentAddress(id) async {
    try {
      var payload = {
        'address_id': id
      };
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'change_address/App',
          parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> getOrderHistory() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String mobileValue = prefs.getString('mobile');
      var payload = {
        'mobile': mobileValue
      };
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'list_of_order_history/App',
          parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> fetchProductDetail(id) async {

    try {
      var payload = {
        'product_id': id
      };
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'product_detail/App',
          parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> addProductToCart(payload) async {
    try {
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'add_to_cart/App',
          parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> searchProduct(value) async {

    try {
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'search/App',
          parameter: {'name': value}
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> fetchCart() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String mobileValue = prefs.getString('mobile');
      var payload = {
        'mobile': mobileValue
      };
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'my_cart/App',
          parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> placeOrder(payload) async {
    try {
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'place_your_order/App',
          parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> removeItem(payload) async {
    try {
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'remove_from_my_cart/App',
          parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> fetchProductByCategory(id) async {
    try {
      var payload = {
        'group_id': id
      };
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'products_by_group/App',
          parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> fetchProductByGroup(id) async {
    try {
      var payload = {
        'groupcategory_id': id
      };
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'products_by_groupcategory/App',
          parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }


  Future<Result> fetchStates() async {
    try {
      final response = await client.request(
          requestType: RequestType.GET,
          path: 'all_state_city/App'
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> getProductsByGroup(group_id, groupcategories_id) async {
    try {
      var payload = group_id != null ? {
        'group_id': group_id,
        'groupcategories_id': groupcategories_id
      } : null;
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'our_products/App',
        parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> getProductsByBrand(id) async {
    try {
      var payload = {
'ProductBrand_Code': id
      };
      final response = await client.request(
          requestType: RequestType.POST,
          path: 'products_by_brand/App',
          parameter: payload
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }

  Future<Result> fetchAllCategoriesWithSub() async {
    try {
      final response = await client.request(
          requestType: RequestType.GET,
          path: 'group_with_groupcategory/App'
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Result.success(json.decode(response.body));
      }
      else {
        print("error from jobs list api");
        final Map<String, dynamic> msg = json.decode(response.body);
        print(msg);
        return Result.error(
            msg["message"] == null ? msg["data"] : msg["message"]);
      }
    } catch (error) {
      print(error);

      print("catch jobs list api");
      return Result.error("Something went wrong!");
    }
  }
}