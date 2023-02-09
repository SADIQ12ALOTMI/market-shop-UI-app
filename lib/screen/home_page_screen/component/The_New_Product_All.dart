import 'package:encomme_shop/models/Sections_ourOffers.dart';
import 'package:flutter/material.dart';
class TheNewProductAll extends StatelessWidget {

  final TheNew theNew;

  const TheNewProductAll({Key ?key,required this.theNew}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10),
      child: Container(
        height: 120,
        width: 220,
        decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius:
            BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              theNew.imgs!,
              width: 120,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.blue[50]!.withOpacity(0.7),
                      shape: BoxShape.circle
                  ),
                  child: Icon(Icons.favorite_rounded),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 8, top: 20),
                  child: Text(theNew.tital!),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.red[200],
                      borderRadius:
                      BorderRadius.only(
                          bottomRight:
                          Radius
                              .circular(
                              20),
                          topLeft: Radius
                              .circular(
                              20))),
                  child: Center(child: Text("\$ ${theNew.price}"),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}