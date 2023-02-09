
import 'package:encomme_shop/models/ouroffers_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ProductList extends StatelessWidget {
  List<OurOffersProduct>? ourOffersProduct;

  final SwiperController swiperController = SwiperController();

  ProductList({Key ?key, this.ourOffersProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height/2.7;
    double cardWidth = MediaQuery.of(context).size.width/1.8;
    if(ourOffersProduct==null)
      ourOffersProduct = [];

    return SizedBox(
      height: cardHeight,
      child: Swiper(
        itemCount: ourOffersProduct!.length,
        itemBuilder: (_, index) {
          return ProductCard(
              height: cardHeight,
              width: cardWidth,
              offersProduct: ourOffersProduct![index]
          );
        },
        scale: 0.8,
        controller: swiperController,
        viewportFraction: 0.6,
        loop: false,
        fade: 0.5,
        pagination: SwiperCustomPagination(
          builder: (context, config) {
            if (config.itemCount > 20) {
              print(
                  "The itemCount is too big, we suggest use FractionPaginationBuilder instead of DotSwiperPaginationBuilder in this sitituation");
            }
            Color activeColor = Colors.red[100]!;
            Color color = Colors.grey[300]!;
            double size = 10.0;
            double space = 5.0;

            if (config.indicatorLayout != PageIndicatorLayout.NONE &&
                config.layout == SwiperLayout.DEFAULT) {
              return new PageIndicator(
                count: config.itemCount,
                controller: config.pageController,
                layout: config.indicatorLayout,
                size: size,
                activeColor: activeColor,
                color: color,
                space: space,
              );
            }

            List<Widget> dots = [];

            int itemCount = config.itemCount;
            int activeIndex = config.activeIndex;

            for (int i = 0; i < itemCount; ++i) {
              bool active = i == activeIndex;
              dots.add(Container(
                key: Key("pagination_$i"),
                margin: EdgeInsets.all(space),
                child: ClipOval(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: active ? activeColor : color,
                    ),
                    width: size,
                    height: size,
                  ),
                ),
              ));
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: dots,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final OurOffersProduct offersProduct;
  final double? height;
  final double? width;



  const ProductCard({Key? key,required this.offersProduct,this.height,this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 30),
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            color: Colors.red[100],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
                color: Colors.white,
              ),
              Column(
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          offersProduct.name ?? '',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      )),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12.0),
                      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 12.0, 4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Color.fromRGBO(224, 69, 10, 1),
                      ),
                      child: Text(
                        '\$${offersProduct.price ?? 0.0}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          child: Hero(
            tag: offersProduct.imag!,
            child: Image.asset(
              offersProduct.imag ?? '',
              height: height!/1.7,
              width: width!/1.4,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
