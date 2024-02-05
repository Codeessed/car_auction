import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_sale_app/model/data-models/brand-item.model.dart';
import 'package:car_sale_app/model/data-models/car-details.model.dart';
import 'package:car_sale_app/model/view-models/car-view-model.dart';
import 'package:car_sale_app/theme/color.dart';
import 'package:car_sale_app/theme/sizes.dart';
import 'package:car_sale_app/views/common/app-button.dart';
import 'package:car_sale_app/views/common/app-text.dart';
import 'package:car_sale_app/views/common/height-spacer.dart';
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


  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    var formatter = NumberFormat('###,000');

    CarViewModel carViewModel = context.watch<CarViewModel>();
    CarDetailsModel car = carViewModel.carDetails;

    Size size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;

    return SafeArea(
        child: Scaffold(
          backgroundColor: appBackgroundColor,
          body: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
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
                                              color: Color(0xffe3e2f2),
                                              clipBehavior: Clip.hardEdge,
                                              child: CachedNetworkImage(imageUrl: carViewModel.carDetails.imageUrl, fit: BoxFit.cover,)),
                                        ),
                                        HeightSpacer(0.01),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
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
                                child: SvgPicture.asset('assets/icons/sample_icon.svg'),
                              onTap: (){
                                setState(() {
                                  noOfItem > 1 ? noOfItem-- : null;
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: AppText(
                                noOfItem.toString().padLeft(2, '0'),
                                weight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              child: SvgPicture.asset('assets/icons/sample_icon.svg'),
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


}