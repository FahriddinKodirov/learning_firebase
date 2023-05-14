import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyUtils {
  static getMyToast({required String message}) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade300,
        textColor: Colors.black,
        fontSize: 16.0,
      );
}

InputDecoration getInputDecoration(
    {required IconData icon, required String word, required Widget eye}) {
  return InputDecoration(
    suffixIcon: word == 'Password' || word == 'Confirm' ? eye : null,
    prefixIcon: Icon(
      icon,
      color: Colors.black54,
    ),
    hintText: word,
    labelStyle: const TextStyle(color: Colors.black),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.black54,
      ),
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(width: 1, color: Colors.black)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(width: 1, color: Colors.black),
    ),
  );
}

InputDecoration getInputDecorationTwo({required String label}) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        width: 1,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black)),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black)),
    errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black)),
  );
}


searchHeaderPage(
    {required String header,
    required String iconOne,
    required String iconTwo,
    isTrue}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        header,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
      InkWell(
          onTap: () {
            isTrue = !isTrue;
          },
          child:
              isTrue ? Icon(Icons.devices_fold_sharp) : Icon(Icons.devices_fold_sharp)),
    ],
  );
}

gridWiew({
  required var categoryLenth,
  required var height,
  required var width,
  required var count,
  required var extent,
  required var search,
}) {
  return SizedBox(
      height: height,
      width: width,
      child: GridView.builder(
          itemCount: categoryLenth,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 14,
              crossAxisSpacing: 20,
              mainAxisExtent: extent),
          itemBuilder: ((context, index) {
            return Dismissible(
                behavior: HitTestBehavior.translucent,
                direction: DismissDirection.endToStart,
                key: Key(index.toString()),
                background: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xfffbd1d8),
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: width * 0.1),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 32,
                  ),
                ),
                child: search);
          })));
}

notFounPage(
    {context, required String wordLineOne, required String wordLineTwo}) {
  return Column(
    children: [
      SizedBox(height: MediaQuery.of(context).size.height * 0.11),
      Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.height * 0.08,
            decoration: BoxDecoration(
                color: const Color(0xFFE1F4F1),
                borderRadius: BorderRadius.circular(20)),
            child: const Center(
                child: Text(
              '🥵',
              style: TextStyle(fontSize: 20),
            )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Text(
            wordLineOne,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.004),
          Text(
            wordLineTwo,
            style: const TextStyle(color: Colors.black45),
          ),
        ],
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.1),
    ],
  );
}

check(context,
    {required String word, required String money, required Color myColor}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.06),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(word),
        Text(
          '\$ $money',
          style: TextStyle(fontSize: 22, color: myColor),
        )
      ],
    ),
  );
}

class MyIndicator {
  static List<double> indexThree = [14, 38, 60];

  static List<double> indexTwo = [38, 60, 38];

  static List<double> indexOne = [60, 14, 14];

  static List indexIndecator = [indexOne, indexTwo, indexThree];
}

height(context) => MediaQuery.of(context).size.height;
width(context) => MediaQuery.of(context).size.width;

favorite(context,isTrue) {
  return Container(
    height: height(context)*0.04,
    width: height(context)*0.04,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: isTrue?Colors.transparent:Colors.red)
    ),
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: height(context) * 0.03,
        width: height(context) * 0.03,
        decoration: BoxDecoration(
            color: isTrue?Colors.white:Colors.red,
            border: Border.all(color: Colors.grey[300]!), shape: BoxShape.circle),
        child: Icon(
          isTrue?Icons.favorite_outline:Icons.favorite,
          color: isTrue?Colors.red:Colors.white,
          size: 12,
        ),
      ),
    ),
  );
}

bigFavorite(context,isTrue) {
  return Container(
    height: height(context)*0.06,
    width: height(context)*0.06,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: isTrue?Colors.transparent:Colors.red)
    ),
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: height(context) * 0.05,
        width: height(context) * 0.05,
        decoration: BoxDecoration(
            color: isTrue?Colors.white:Colors.red,
            border: Border.all(color: Colors.grey[300]!), shape: BoxShape.circle),
        child: Icon(
          isTrue?Icons.favorite_outline:Icons.favorite,
          color: isTrue?Colors.red:Colors.white,
          size: 22,
        ),
      ),
    ),
  );
}


profileGetInputDecoration(context, {required String label}) {
  return InputDecoration(
    contentPadding: EdgeInsets.only(left: width(context) * 0.06),
    hintText: label,
    prefixIcon: Icon(Icons.search,color: Colors.black,),
    border: InputBorder.none,
    filled: true,
    fillColor: Colors.grey[200],
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(width(context)),
      borderSide: const BorderSide(
        color: Color(0xFFA5A9B6),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(width(context)),
      borderSide: const BorderSide(color: Color(0xFF333743)),
    ),
  );
}