import 'package:encomme_shop/models/Sections_ourOffers.dart';
import 'package:flutter/material.dart';

import 'compnent/body_shose.dart';
class ShoseScreen extends StatelessWidget {

final SectionOffers? sectionOffers;

  const ShoseScreen({Key ?key, this.sectionOffers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
     body: body(),
      // body: ,
    );
  }
}
