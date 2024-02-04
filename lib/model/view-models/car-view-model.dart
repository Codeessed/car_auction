
import 'package:car_sale_app/common/base-view-model.dart';
import 'package:car_sale_app/locator.dart';
import 'package:car_sale_app/model/data-models/brand-item.model.dart';
import 'package:car_sale_app/model/data-models/brand-response.model.dart';
import 'package:car_sale_app/model/data-models/common/server-response-model.dart';
import 'package:car_sale_app/services/app-service.dart';
class CarViewModel extends BaseViewModel {
  AppService appService = locator<AppService>();

  final List<BrandItemModel> _brandItemList = [];
  List<BrandItemModel> get brandItemList => _brandItemList;

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


}