import 'package:flutter/material.dart';
class BuildContainerWithIcon extends StatefulWidget {
  const BuildContainerWithIcon({
    Key ?key,
  }) : super(key: key);

  @override
  _BuildContainerWithIconState createState() => _BuildContainerWithIconState();
}

class _BuildContainerWithIconState extends State<BuildContainerWithIcon> {
  bool? isfavorate;
  @override
  void initState() {
    isfavorate=true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
                offset: Offset(0,6),
                color: Colors.black38,
                blurRadius: 10
            )
          ]
      ),
      child: IconButton(icon:isfavorate!? Icon(Icons.favorite_outlined,size: 35,color: Colors.white,):Icon(Icons.favorite_outlined,size: 35,color: Colors.red,), onPressed: (){},),
    );
  }
}