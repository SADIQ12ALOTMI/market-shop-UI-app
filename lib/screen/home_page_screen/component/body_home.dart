import 'dart:ui';

import 'package:encomme_shop/components/icon_with_btn_counter.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:encomme_shop/models/Sections_ourOffers.dart';
import 'package:encomme_shop/models/ouroffers_shop.dart';
import 'package:encomme_shop/screen/home_page_screen/component/sectionCard.dart';
import 'package:encomme_shop/screen/home_page_screen/component/tabbar_ouroffers.dart';
import 'package:encomme_shop/screen/stor_cart/cart_home_screen.dart';
import 'package:flutter/material.dart';

import 'The_New_Product_All.dart';

class body_Home extends StatefulWidget {
  final OurOffersProduct? ourOffersproduct;

  const body_Home({Key ?key, this.ourOffersproduct}) : super(key: key);

  @override
  _body_HomeState createState() => _body_HomeState();
}

class _body_HomeState extends State<body_Home>
    with TickerProviderStateMixin<body_Home> {
late  ScrollController _scrollController;
late  double _offset;
late  bool isSrink;
late  List<OurOffersProduct> ourOffersProducts;
 late List<TheNew> theNew;
  int currentbag = 0;
late  List<CartStorList> cartStorList;
 late bool iselectouroffers;
  int index_1 = 0;

late  bool _bool;

  @override
  void initState() {
    // index_1=0;
    _bool = true;
    iselectouroffers = true;
    // currentbag=0;
    _scrollController = ScrollController();
    _offset = 0.0;
    isSrink = false;
    cartStorList=CartStorList.cartStorList;
    _scrollController.addListener(_scrollListener);
    ourOffersProducts = OurOffersProduct.productClothingWoman;
    ourOffersProducts = OurOffersProduct.productMan;

    ourOffersProducts = OurOffersProduct.productWatches;
    ourOffersProducts = OurOffersProduct.productAccessories;
    ourOffersProducts = OurOffersProduct.productCaps;
    ourOffersProducts = OurOffersProduct.productBag;
    ourOffersProducts = OurOffersProduct.productElectronics;
    ourOffersProducts = OurOffersProduct.productShose;
    theNew=TheNew.theNew;




    super.initState();
  }


  _scrollListener() {
    setState(() {
      if (_scrollController.offset < 60) {
        _offset = _scrollController.offset;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return DefaultTabController(
        length: ourOffers.length,
        child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, index) {
              return <Widget>[
                SliverAppBar(
                  brightness: Brightness.dark,
                  elevation: 0,
                  expandedHeight: 100,
                  pinned: true,
                  backgroundColor: Colors.brown[50],
                  leading:  CircleAvatar(
                  backgroundColor: Colors.black12,
              radius: 15,
              child: Icon(
              Icons.person_outline_rounded,
              size: 30,
              color: Colors.white,
              ),
              ),
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsetsDirectional.only(
                      start: ((_offset / 100) * 60) +12,
                      bottom: 15,
                    ),
                    title: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Our Offers",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: IconWithBtnCounter(
                        iconsvg: "assets/icons/CartIcon.svg",
                        press: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartHomeScreen()));},
                        numOfItem: cartStorList.length,
                      ),
                    ),
                  ],
                )
              ];
            },
            body: SingleChildScrollView(

              child: Container(
                height: MediaQuery.of(context).size.height+115,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 260,
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Search",
                                      prefixIcon: Icon(Icons.search),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.cyan[100]!))),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red[100],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.filter_list,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        TabBar(
                          isScrollable: true,
                          //indicatorColor: Colors.white,
                          labelColor: Colors.black,

                          unselectedLabelColor: Colors.brown,
                          unselectedLabelStyle:
                              TextStyle(fontWeight: FontWeight.bold),

                          tabs: [
                            ...ourOffers.map((data) {
                              return Tab(
                                text: data,
                              );
                            })
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 220,
                          child: TabBarView(
                            children: [
                              buildSizedBoxWatches(),
                              buildSizedBoxElectronics(),
                              buildSizedBoxBags(),
                              SizedBox(
                                child: ListViewProduct(
                                    ourOfferproduct: OurOffersProduct.productCaps),
                              ),
                              SizedBox(
                                child: ListViewProduct(
                                    ourOfferproduct:
                                        OurOffersProduct.productAccessories),
                              ),

                              SizedBox(
                                child: ListViewProduct(
                                    ourOfferproduct: OurOffersProduct.productMan),
                              ),
                              SizedBox(
                                child: ListViewProduct(
                                    ourOfferproduct:
                                        OurOffersProduct.productClothingWoman),
                              ),
                              SizedBox(
                                child: ListViewProduct(
                                    ourOfferproduct: OurOffersProduct.productShose),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "The New :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Scroll left to See More",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.teal[900]),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_up,
                                    color: Colors.black,
                                    size: 25,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(
                                      theNew.length,
                                      (index) => TheNewProductAll(theNew: theNew[index],))
                                ],
                              ),
                            )),
                      ],
                    ),

                    // CustomNavigationDrawer(),
                  ],
                ),
              ),
            )));
  }





  SizedBox buildSizedBoxBags() {
    return SizedBox(
      height: 200,
      child: ListViewProduct(ourOfferproduct: OurOffersProduct.productBag),
    );
  }

  SizedBox buildSizedBoxElectronics() {
    return SizedBox(
      height: 200,
      child:
          ListViewProduct(ourOfferproduct: OurOffersProduct.productElectronics),
    );
  }

  SizedBox buildSizedBoxWatches() {
    return SizedBox(
      height: 200,
      child: ListViewProduct(ourOfferproduct: OurOffersProduct.productWatches),
    );
  }
}


