import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_sale_app/model/data-models/brand-item.model.dart';
import 'package:car_sale_app/model/view-models/car-view-model.dart';
import 'package:car_sale_app/theme/color.dart';
import 'package:car_sale_app/views/common/app-text.dart';
import 'package:car_sale_app/views/common/height-spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatefulWidget{
  const ExploreScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExploreScreenState();
  }

}

class _ExploreScreenState extends State<ExploreScreen> {


  @override
  void initState() {
    getCarBrands();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    CarViewModel carViewModel = context.watch<CarViewModel>();

    Size size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;

    return SafeArea(
        child: Scaffold(
          backgroundColor: appBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
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
                Expanded(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index){
                          return Padding(
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
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(color: Colors.white, width: 2),
                                              color: Color(0xffe3e2f2)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: SvgPicture.asset('assets/icons/sample_icon.svg'),
                                          ),
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
                                                          'Air Jordan 1 Mid'
                                                      )
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                    child: SvgPicture.asset('assets/icons/sample_icon.svg'),
                                                  ),
                                                  AppText(
                                                      '(5.0)'
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 5),
                                                child: AppText(
                                                    'Nike'
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(right: 10),
                                                      child: AppText(
                                                          '\$115.00'
                                                      ),
                                                    ),
                                                  ),
                                                  SvgPicture.asset('assets/icons/sample_icon.svg')
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
                          );
                        }
                    )
                )
              ],
            ),
          ),
        )
    );
  }

  void getCarBrands(){
    context.read<CarViewModel>().getBrandItems();
  }

}