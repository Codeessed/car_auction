import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_sale_app/model/data-models/brand-item.model.dart';
import 'package:car_sale_app/model/data-models/car-item.model.dart';
import 'package:car_sale_app/model/view-models/car-view-model.dart';
import 'package:car_sale_app/theme/color.dart';
import 'package:car_sale_app/theme/sizes.dart';
import 'package:car_sale_app/views/car-details-screen.dart';
import 'package:car_sale_app/views/common/app-text.dart';
import 'package:car_sale_app/views/common/height-spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ExploreScreen extends StatefulWidget{
  const ExploreScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExploreScreenState();
  }

}

class _ExploreScreenState extends State<ExploreScreen> {

  List<CarItemModel> carList = [];
  String searchText = '';


  @override
  void initState() {
    carList.addAll(context.read<CarViewModel>().carItemList);
    getCarBrands();
    getCars();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    var formatter = NumberFormat('###,000');

    CarViewModel carViewModel = context.watch<CarViewModel>();
    carList.clear();
    carList.addAll(carViewModel.carItemList.where((element) => element.title.toLowerCase().contains(searchText.toLowerCase())).toList());
    Size size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
          child: Scaffold(
            backgroundColor: appBackgroundColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  HeightSpacer(0.01),
                  Row(
                    children: [
                      Image.asset('assets/icons/explore_icon.png', height: 20, width: 20,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: AppText(
                            'Explore',
                            weight: FontWeight.bold,
                            align: TextAlign.start,
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
                  HeightSpacer(0.02),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: TextFormField(
                            onChanged: (String text){
                              setState(() {
                                searchText = text;
                              });
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                hintText: 'Search',
                                hintStyle: TextStyle(color: Colors.grey, fontSize: ts4),
                                isDense: false,
                                prefixIcon: Image.asset('assets/icons/search_icon.png', color: Colors.grey,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                ),
                                fillColor: Color(0xfff6f6f8),
                                filled: true
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black
                        ),
                        child: Image.asset('assets/icons/filter_icon.png', height: 20, width: 20, color: Color(0xfffdcf68),),
                      )
                    ],
                  ),
                  HeightSpacer(0.02),
                  SizedBox(
                    height: screenHeight * 0.1,
                    child: ListView.builder(
                        itemCount: carViewModel.brandItemList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          var brandItem = carViewModel.brandItemList[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: SizedBox(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: double.maxFinite,
                                      width: double.maxFinite,
                                      child: Card(
                                        shape: CircleBorder(),
                                        clipBehavior: Clip.hardEdge,
                                        child: CachedNetworkImage(imageUrl: brandItem.imageUrl,),
                                        color: Color(0xfff0f0f2),
                                      ),
                                    ),
                                  ),
                                  AppText(
                                    brandItem.name,
                                    maxLines: 1,
                                    textOverflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                  HeightSpacer(0.02),
                  Expanded(
                      child: ListView.builder(
                          itemCount: carList.length,
                          itemBuilder: (context, index){
                            var car = carList[index];
                            return GestureDetector(
                              onTap: () async {
                                bool detail = await carViewModel.getCarDetails(car.id);
                                if(detail){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CarDetailsScreen()));
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: IntrinsicHeight(
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          Expanded(
                                              child: Container()
                                          ),
                                          Container(
                                            height: 250,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.white
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
                                              height: 200,
                                              child: Card(
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                color: Color(0xffe3e2f2),
                                                  clipBehavior: Clip.hardEdge,
                                                  child: CachedNetworkImage(imageUrl: car.imageUrl, fit: BoxFit.cover,)),
                                            ),
                                            HeightSpacer(0.01),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: AppText(
                                                              car.title,
                                                            weight: FontWeight.bold,
                                                            size: ts2,
                                                            textOverflow: TextOverflow.ellipsis,
                                                            maxLines: 1,
                                                          )
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                        child: Image.asset('assets/icons/star_icon.png', height: 20, width: 20,)
                                                      ),
                                                      AppText(
                                                          '(${car.gradeScore.toStringAsFixed(1)})',
                                                        color: Color(0xffa0a2ac),
                                                        weight: FontWeight.bold,
                                                        size: ts4,
                                                        textOverflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                      )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                                    child: AppText(
                                                        '${car.city}, ${car.state} State',
                                                      color: Color(0xffa0a2ac),
                                                      weight: FontWeight.bold,
                                                      size: ts4,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(right: 10),
                                                          child: AppText(
                                                              '₦${formatter.format(car.marketplacePrice)}',
                                                            weight: FontWeight.bold,
                                                            size: ts3,
                                                          ),
                                                        ),
                                                      ),
                                                      Image.asset('assets/icons/filled_add_icon.png', height: 30, width: 30,)
                                                    ],
                                                  )
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
                              ),
                            );
                          }
                      )
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

  void getCarBrands(){
    context.read<CarViewModel>().getBrandItems();
  }

  void getCars(){
    context.read<CarViewModel>().getCars();
  }

}