import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_sale_app/model/data-models/brand-item.model.dart';
import 'package:car_sale_app/model/data-models/car-details.model.dart';
import 'package:car_sale_app/model/data-models/car-media-item.model.dart';
import 'package:car_sale_app/model/view-models/car-view-model.dart';
import 'package:car_sale_app/theme/color.dart';
import 'package:car_sale_app/theme/sizes.dart';
import 'package:car_sale_app/views/common/app-button.dart';
import 'package:car_sale_app/views/common/app-text.dart';
import 'package:car_sale_app/views/common/height-spacer.dart';
import 'package:car_sale_app/views/common/video-widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CarDetailsScreen extends StatefulWidget{
  const CarDetailsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarDetailsScreenState();
  }

}

class _CarDetailsScreenState extends State<CarDetailsScreen> {

  int noOfItem = 1;
  int selectedMediaIndex = 0;

  List<CarMediaItemModel> carMediaList = [];


  @override
  void initState() {
    var id = context.read<CarViewModel>().carDetails.id;
    // getCarMedia(id);
    getCarMedia('R1nVTV4Mj');
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    var formatter = NumberFormat('###,000');

    CarViewModel carViewModel = context.watch<CarViewModel>();
    CarDetailsModel car = carViewModel.carDetails;
    carMediaList.clear();
    carMediaList.addAll(carViewModel.carMediaItemList.where((element) => element.url.isNotEmpty));

    Size size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;

    return SafeArea(
        child: Scaffold(
          backgroundColor: appBackgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeightSpacer(0.01),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    GestureDetector(
                        child: Image.asset('assets/icons/back_icon.png', height: 20, width: 20,),
                      onTap: (){
                          Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: AppText(
                          'Vehicle',
                          weight: FontWeight.bold,
                          align: TextAlign.center,
                          size: ts3,
                        ),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.asset('assets/icons/cart_icon.png', height: 30, width: 30,),
                        Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black
                          ),
                          child: AppText(
                            '3',
                            align: TextAlign.center,
                            size: ts6,
                            color: Color(0xfffdcf68),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeightSpacer(0.03),
                            AppText(
                              car.carName,
                              weight: FontWeight.bold,
                              align: TextAlign.end,
                              size: ts2,
                            ),
                            HeightSpacer(0.01),
                            IntrinsicHeight(
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: screenHeight * 0.15,),
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.white
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.maxFinite,
                                          height: screenHeight * 0.4,
                                          child: Card(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                              color: Color(0xffebe9f6),
                                              clipBehavior: Clip.hardEdge,
                                              child: carMediaList.isNotEmpty ?
                                              carMediaList[selectedMediaIndex].type.contains('video') ? VideoWidget(videoUrl: carMediaList[selectedMediaIndex].url) : CachedNetworkImage(imageUrl: carMediaList[selectedMediaIndex].url, fit: BoxFit.cover,)
                                                  : Container()),
                                        ),
                                        HeightSpacer(0.01),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              if (carMediaList.isNotEmpty) Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 10),
                                                child: SizedBox(
                                                  width: double.maxFinite,
                                                  height: screenHeight * 0.1,
                                                  child: ListView.builder(
                                                      itemCount: carMediaList.length,
                                                      scrollDirection: Axis.horizontal,
                                                      itemBuilder: (context, index){
                                                        var  mediaItem = carMediaList[index];
                                                        return Padding(
                                                          padding: const EdgeInsets.only(right: 10),
                                                          child: GestureDetector(
                                                            onTap: (){
                                                              if(selectedMediaIndex != index){
                                                                setState(() {
                                                                  selectedMediaIndex = index;
                                                                });
                                                              }
                                                            },
                                                            child: SizedBox(
                                                              height: screenHeight * 0.3,
                                                              width: screenWidth * 0.3,
                                                              child: Column(
                                                                children: [
                                                                  Expanded(
                                                                    child: Stack(
                                                                      alignment: Alignment.center,
                                                                      children: [
                                                                        SizedBox(
                                                                          height: double.maxFinite,
                                                                          width: double.maxFinite,
                                                                          child: Card(
                                                                            shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                                side: BorderSide(
                                                                                    width: 3,
                                                                                    color: selectedMediaIndex == index ? Colors.yellow : Colors.transparent
                                                                                )
                                                                            ),
                                                                            clipBehavior: Clip.hardEdge,
                                                                            color: Color(0xfff0f0f2),
                                                                            child: carMediaList[index].type.contains('video') ? Container(color: Colors.black,) : CachedNetworkImage(imageUrl: mediaItem.url, fit: BoxFit.cover,),
                                                                          ),
                                                                        ),
                                                                        carMediaList[index].type.contains('video') ? Image.asset('assets/icons/play_icon.png', height: 20, width: 20,) : Container()
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  AppText(
                                                                    mediaItem.name,
                                                                    maxLines: 1,
                                                                    textOverflow: TextOverflow.ellipsis,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                  ),
                                                ),
                                              ) else Container(),
                                              vehicleDetail(key: 'Price', value: '₦${formatter.format(car.marketplacePrice)}'),
                                              vehicleDetail(key: 'Loan Value', value: '₦${formatter.format(car.loanValue)}'),
                                              vehicleDetail(key: 'Installment', value: '₦${formatter.format(car.installment)}'),
                                              vehicleDetail(key: 'Available', value: car.sold ? 'YES' : 'NO'),
                                              vehicleDetail(key: 'Insured', value: car.insured ? 'YES' : 'NO'),
                                              vehicleDetail(key: 'Mileage', value: '${car.mileage} ${car.mileageUnit}'),
                                              vehicleDetail(key: 'Car Name', value: car.carName),
                                              // vehicleDetail(key: 'Wheel Type', value: '₦${formatter.format(car.marketplacePrice)}'),
                                              vehicleDetail(key: 'Owner Type', value: car.ownerType),
                                              vehicleDetail(key: 'Transmission', value: car.transmission),
                                              vehicleDetail(key: 'Fuel Type', value: car.fuelType),
                                              // vehicleDetail(key: 'Body Type', value: car.fuelType),
                                              vehicleDetail(key: 'Engine Type', value: car.engineType),
                                              vehicleDetail(key: 'Location', value: '${car.city}, ${car.state}'),
                                              vehicleDetail(key: 'Selling Condition', value: car.sellingCondition),

                                            ],
                                          ),
                                        ),
                                        HeightSpacer(0.02),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            HeightSpacer(0.02),
                          ],
                        ),
                      )
                  )
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                                child: Image.asset('assets/icons/subtract_icon.png', height: 20, width: 20,),
                              onTap: (){
                                setState(() {
                                  noOfItem > 1 ? noOfItem-- : null;
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: AppText(
                                noOfItem.toString().padLeft(2, '0'),
                                weight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              child: Image.asset('assets/icons/add_icon.png', height: 20, width: 20,),
                              onTap: (){
                                setState(() {
                                  noOfItem++;
                                });
                              },
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: AppText(
                              'Total: ₦${formatter.format(car.marketplacePrice * noOfItem)}',
                              weight: FontWeight.bold,
                              align: TextAlign.end,
                            ),
                          ),
                        )
                      ],
                    ),
                    HeightSpacer(0.02),
                    AppButton(
                        'Add to cart',
                        textColor: Color(0xfffdcf68),
                        btnColor: Color(0xff343434),
                        onTap: (){

                        }
                    )
                  ],
                ),
              )

            ],
          ),
        )
    );
  }

  Widget vehicleDetail({
    required String key,
    required String value,
}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(
            '$key :',
            size: ts3,
            weight: FontWeight.bold,
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: AppText(
                  value.replaceFirst(value[0], value[0].toUpperCase()),
                  align: TextAlign.end,
                ),
              )
          )
        ],
      ),
    );
}

  void getCarMedia(String id){
    context.read<CarViewModel>().getCarMedia(id);
  }


}