
import 'package:car_sale_app/common/base-view-model.dart';
import 'package:car_sale_app/helper/loader.util.dart';
import 'package:car_sale_app/helper/random.dart';
import 'package:car_sale_app/locator.dart';
import 'package:car_sale_app/model/data-models/brand-item.model.dart';
import 'package:car_sale_app/model/data-models/brand-response.model.dart';
import 'package:car_sale_app/model/data-models/car-details.model.dart';
import 'package:car_sale_app/model/data-models/car-item.model.dart';
import 'package:car_sale_app/model/data-models/car-media-item.model.dart';
import 'package:car_sale_app/model/data-models/car-media-response.model.dart';
import 'package:car_sale_app/model/data-models/car-response.model.dart';
import 'package:car_sale_app/services/app-service.dart';
class CarViewModel extends BaseViewModel {
  AppService appService = locator<AppService>();

  final List<BrandItemModel> _brandItemList = [];
  List<BrandItemModel> get brandItemList => _brandItemList;

  final List<CarItemModel> _carItemList = [];
  List<CarItemModel> get carItemList => _carItemList;

  final List<CarMediaItemModel> _carMediaItemList = [];
  List<CarMediaItemModel> get carMediaItemList => _carMediaItemList;

  CarDetailsModel? _carDetails;
  CarDetailsModel get carDetails => _carDetails!;

  Future<bool> getBrandItems() async {
    BrandResponseModel brandResponse = await appService.getBrands();
    try{
      if(brandResponse.makeList.isNotEmpty){
        List<BrandItemModel> brandItems =  (brandResponse.makeList).map((e) => BrandItemModel.fromJson(e)).toList();
        _brandItemList.clear();
        _brandItemList.addAll(brandItems);
        notifyListeners();
        return true;
      }
      return false;
    }catch(e){
      return false;
    }

  }


  Future<bool> getCars() async {
    AppLoaderUtil.showSecondaryLoading('Loading...');
    CarResponseModel carResponse = await appService.getCars();
    try{
      if(carResponse.result.isNotEmpty){
        List<CarItemModel> carItems =  (carResponse.result).map((e) => CarItemModel.fromJson(e)).toList();
        _carItemList.clear();
        _carItemList.addAll(carItems);
        notifyListeners();
        AppLoaderUtil.dismiss();
        return true;
      }
      AppLoaderUtil.dismiss();
      RandomFunction.toast('List of Cars is empty', isError: true);
      return false;
    }catch(e){
      AppLoaderUtil.dismiss();
      RandomFunction.toast(e.toString(), isError: true);
      return false;
    }

  }

  Future<bool> getCarDetails(String id) async {
    AppLoaderUtil.showSecondaryLoading('Loading...');
    CarDetailsModel? carDetailResponse = await appService.getCarDetails(id);
    try{
      if(carDetailResponse != null){
        CarDetailsModel details =  carDetailResponse;
        _carDetails = details;
        notifyListeners();
        AppLoaderUtil.dismiss();
        return true;
      }
      RandomFunction.toast('Could not get car details', isError: true);
      AppLoaderUtil.dismiss();
      return false;
    }catch(e){
      AppLoaderUtil.dismiss();
      RandomFunction.toast(e.toString(), isError: true);
      return false;
    }
  }

  Future<bool> getCarMedia(String id) async {
    _carMediaItemList.clear();
    CarMediaResponseModel carMediaResponse = await appService.getCarMedia(id);
    try{
      if(carMediaResponse.carMediaList.isNotEmpty){
        List<CarMediaItemModel> carMediaItems =  (carMediaResponse.carMediaList).map((e) => CarMediaItemModel.fromJson(e)).toList();
        _carMediaItemList.addAll(carMediaItems);
        notifyListeners();
        return true;
      }
      return false;
    }catch(e){
      return false;
    }

  }



}