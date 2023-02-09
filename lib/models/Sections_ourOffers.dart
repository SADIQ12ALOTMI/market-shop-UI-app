class SectionOffers{

  final String? imag,name;

  SectionOffers({this.imag, this.name});
  static List<SectionOffers> sectionOffers=[

    SectionOffers(imag: "assets/images/section_ourOffers/bag_6.png",name: "Bags"),

    SectionOffers(imag: "assets/images/section_ourOffers/cap_3.png",name: "Caps"),
    SectionOffers(imag: "assets/images/section_ourOffers/headphone_9.png",name: "Hear Phone"),

    SectionOffers(imag: "assets/images/section_ourOffers/ring_1.png",name: "Accessories"),
    SectionOffers(imag: "assets/images/watches/smartwatch15.png",name: "Watches"),
    SectionOffers(imag: "assets/images/section_ourOffers/womanshoe_3.png",name: "Shose"),

    SectionOffers(imag: "assets/images/section_ourOffers/girlClo1.png",name: "Girl Clothing"),
    SectionOffers(imag: "assets/images/section_ourOffers/MenClo1.png",name: "Men Clothing"),
    SectionOffers(imag: "assets/images/section_ourOffers/WomenClo1.png",name: "Women Clothing"),

  ];
}
class TheNew{
  final String? tital,imgs;
  final double? price;

  TheNew({this.tital, this.imgs, this.price});
  static List<TheNew> theNew=[
    TheNew(imgs: "assets/images/the_new/the_new_product_all.png",tital: "SmartWatch",price: 33.4),
    TheNew(imgs: "assets/images/splash/bag1.png",tital: "Bag Back",price: 33.4),
    TheNew(imgs: "assets/images/the_new/the_new_product_all_3.png",tital: "EarPhone",price: 33.4),
    TheNew(imgs: "assets/images/the_new/the_new_product_all_4.png",tital: "JT shirt",price: 33.4),
    TheNew(imgs: "assets/images/the_new/the_new_product_all_5.png",tital: "SmartWatch",price: 33.4),
    TheNew(imgs: "assets/images/the_new/the_new_product_all_6.png",tital: "dress",price: 33.4),
  ];

}