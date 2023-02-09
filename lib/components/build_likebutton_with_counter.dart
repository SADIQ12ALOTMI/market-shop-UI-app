import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
class BuildLikeIconWithCounter extends StatefulWidget {

  final IconData? iconData;

  const BuildLikeIconWithCounter({Key ?key, this.iconData}) : super(key: key);
  @override
  _BuildLikeIconWithCounterState createState() => _BuildLikeIconWithCounterState();
}

class _BuildLikeIconWithCounterState extends State<BuildLikeIconWithCounter> {
  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 20,
      isLiked: null,
      circleColor: CircleColor(
        start: Colors.red[100]!,
        end: Colors.red[400]!,
      ),
      bubblesColor: BubblesColor(
          dotPrimaryColor: Colors.red[300]!,
          dotSecondaryColor: Colors.red[200]!
      ),
      likeBuilder: (bool islike){
        return Icon(widget.iconData,color: Colors.red,size: 20,);
      },
      likeCount: 888,
      countBuilder: (int? count ,bool islike,String text){
        var color=Colors.red;
        Widget result;
        if(count==0){
          result=Text("Love",style: TextStyle(color: color),);
        }else{
          result=Text(text,style: TextStyle(color: color),);
        }
        return result;
      },
      likeCountPadding: EdgeInsets.only(left: 6),

    );
  }
}

