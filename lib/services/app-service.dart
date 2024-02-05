import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:car_sale_app/constants/app-endpoint.dart';
import 'package:car_sale_app/model/data-models/brand-response.model.dart';
import 'package:car_sale_app/model/data-models/car-details.model.dart';
import 'package:car_sale_app/model/data-models/car-response.model.dart';
import 'package:car_sale_app/model/data-models/common/ErrorMessages.dart';
import 'package:car_sale_app/model/data-models/common/server-response-model.dart';
import 'package:http/http.dart' as http;

class AppService {
  var client = http.Client();

  Future<BrandResponseModel> getBrands() async {
    try {
      var response = await client
          .get(Uri.parse("${BASEURL}inventory/make").replace(query: 'popular= false'), headers: {
        "Content-type": "application/json",
      });
      var data = jsonDecode(response.body);
      BrandResponseModel serverResponse = BrandResponseModel(
          makeList: data['makeList'],
          pagination: data['pagination']
      );
      return serverResponse;
    } on SocketException catch (_) {
      throw ErrorResponse("No internet connection");
    } on HttpException catch (_) {
      throw ErrorResponse("Service not currently available");
    } on TimeoutException catch (_) {
      throw ErrorResponse("Poor internet connection");
    } catch (e) {
      print(e);
      throw ErrorResponse("Something went wrong. Try again $e");
    }
  }

  Future<CarResponseModel> getCars() async {
    try {
      var response = await client.get(Uri.parse("${BASEURL}inventory/car/search").replace(query: 'country = NG'), headers: {
        "Content-type": "application/json",
      });
      var data = jsonDecode(response.body);
      CarResponseModel serverResponse = CarResponseModel(
          result: data['result'],
          pagination: data['pagination']
      );
      return serverResponse;
    } on SocketException catch (_) {
      throw ErrorResponse("No internet connection");
    } on HttpException catch (_) {
      throw ErrorResponse("Service not currently available");
    } on TimeoutException catch (_) {
      throw ErrorResponse("Poor internet connection");
    } catch (e) {
      print(e);
      throw ErrorResponse("Something went wrong. Try again $e");
    }
  }

  Future<CarDetailsModel?> getCarDetails(String id) async {
    try {
      var response = await client.get(Uri.parse("${BASEURL}inventory/car/$id").replace(query: 'country = NG'), headers: {
        "Content-type": "application/json",
      });
      var data = jsonDecode(response.body);

      CarDetailsModel serverResponse = CarDetailsModel.fromJson(data) ;

      return serverResponse;
    } on SocketException catch (_) {
      throw ErrorResponse("No internet connection");
    } on HttpException catch (_) {
      throw ErrorResponse("Service not currently available");
    } on TimeoutException catch (_) {
      throw ErrorResponse("Poor internet connection");
    } catch (e) {
      throw ErrorResponse("Something went wrong. Try again $e");
    }
  }


}
