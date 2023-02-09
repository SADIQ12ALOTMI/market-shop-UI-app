import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
class BuildLikeIcon extends StatefulWidget {
  const BuildLikeIcon({
    Key ?key, this.iconData,
  }) : super(key: key);
  final IconData ? iconData;

  @override
  _BuildLikeIconState createState() => _BuildLikeIconState();
}

class _BuildLikeIconState extends State<BuildLikeIcon> {
  final int likeIcon=999;
  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 20,
      likeCount: likeIcon,
      likeBuilder: (bool islike){
        return Icon(widget.iconData,color:islike?Colors.pinkAccent:Colors.grey,);
      },
      countBuilder: (int? count,bool islike,String text)
      {
        var color=islike?Colors.pinkAccent:Colors.grey;
        Widget result=SizedBox();
        if(count==0){
          result==Text("love",style: TextStyle(color: color),);
        }else
        {
          result=Text(count!>=1000.0?(count/1000.0).toStringAsFixed(1)+"k":text,style:TextStyle(color: color));
        };
        return result;
      },
      likeCountAnimationType: likeIcon<1000?LikeCountAnimationType.part:LikeCountAnimationType.none,
      likeCountPadding: EdgeInsets.only(left: 7.0),
      onTap: onLikeButtonTapped,
    );
  }
  Future<bool>onLikeButtonTapped(bool islike)async{
    return !islike;
  }
}


