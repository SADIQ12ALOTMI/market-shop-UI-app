

import 'package:encomme_shop/Section_Screen/shoses/compnent/pageView_scroll.dart';
import 'package:encomme_shop/Section_Screen/shoses/compnent/tabbar_view_to_product_shose.dart';
import 'package:encomme_shop/components/back_pop.dart';
import 'package:encomme_shop/components/icon_with_btn_counter.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:encomme_shop/screen/home_page_screen/component/tabbar_ouroffers.dart';
import 'package:encomme_shop/screen/stor_cart/cart_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class body extends StatefulWidget {
  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<body> with TickerProviderStateMixin<body> {
  ScrollController? _scrollController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TabbarShose.length,
      child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, index) => <Widget>[
                SliverAppBar(
                  brightness: Brightness.dark,
                  elevation: 0,
                  expandedHeight: 40,
                  pinned: true,
                  backgroundColor: Colors.blueGrey[50],
                  leading: BackPop(),
                  title: Text("Shose Store".toUpperCase()),
                  centerTitle: true,
                  actions: [
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: IconWithBtnCounter(
                        iconsvg: "assets/icons/CartIcon.svg",
                        press: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartHomeScreen()));},
                        numOfItem: CartStorList.cartStorList.length,
                      ),
                    ),
                  ],
                ),
              ],
          body: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              TabBar(
                isScrollable: true,
                labelColor: Colors.brown,
                unselectedLabelColor: Colors.red,
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                tabs: [
                  ...TabbarShose.map((e) => Tab(
                        text: e,
                      ))
                ],
              ),
              SizedBox(
                height: 15,
              ),

              SizedBox(
                  height: 282,
                  child: TabBarViewToProductShose()),
               PagViewShose()
            ],
          )),
    );
  }
}


