import 'package:flutter/material.dart';
import 'package:learning_firebase/screen/auth/register/widget/web_widget/web_widgegt.dart';
import 'package:learning_firebase/utils/my_utils.dart';

class WebWiew extends StatefulWidget {
  const WebWiew({super.key});

  @override
  State<WebWiew> createState() => _WebWiewState();
}

class _WebWiewState extends State<WebWiew> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>WebWidget(box: 'apple',)));
          }, child:Padding(
            padding:  EdgeInsets.symmetric(horizontal: height(context)*0.01),
            child: const Icon(Icons.apple),
          )),

          InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>WebWidget(box: 'google',)));
          }, child:Padding(
            padding: EdgeInsets.symmetric(horizontal: height(context)*0.01),
            child: const Icon(Icons.apple),
          ),),

          InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>WebWidget(box: 'twitter',)));
          }, child:Padding(
            padding: EdgeInsets.symmetric(horizontal: height(context)*0.01),
            child: const Icon(Icons.apple),
          )),

          InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>WebWidget(box: 'facebook',)));
          }, child:Padding(
            padding: EdgeInsets.symmetric(horizontal: height(context)*0.01),
            child: const Icon(Icons.apple),
          ),),
         ],
      ),
    );
  }
}
