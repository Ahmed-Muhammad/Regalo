import 'package:flutter/material.dart';
import 'package:regalo/src/core/constants/constants.dart';
//--------------Navigator To Page -----------------------

void navigateTo(context, int durationInSec, {required pageName}) {
  Future.delayed(
    Duration(seconds: durationInSec),
    () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => pageName,
        ),
      );
    },
  );
}

void navigateToPage(context, {required pageName}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => pageName,
    ),
  );
}

void navigateAndFinish(context, int durationInSec, {required pageName}) {
  Future.delayed(
    Duration(seconds: durationInSec),
    () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => pageName,
        ),
      );
    },
  );
}

void navigateToPageAndFinish(context, {required pageName}) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => pageName,
    ),
  );
}

Widget buildArticleItem(article, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: SizedBox(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
        ],
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  TextInputType? type,
  Function(String)? onSubmit,
  Function(String)? onChanged,
  double? prefixIconSize,
  double? suffixIconSize,
  int maxLength = 50,
  GestureTapCallback? onTap,
  String? Function(String?)? validate,
  required String? label,
  required IconData? prefix,
  bool isClickable = true,
  IconData? suffix,
  void Function()? suffixPressed,
  bool obscureText = false,

}) {
  return TextFormField(
    maxLength: maxLength,
    obscureText: obscureText,
    enabled: isClickable,
    controller: controller,
    keyboardType: type,
    onFieldSubmitted: onSubmit,
    onChanged: onChanged,
    onTap: onTap,
    validator: validate,
    decoration: InputDecoration(
      counterText: "",
      labelText: label,
      prefixIcon: Icon(
        prefix,
        size: prefixIconSize,
        color: primaryColor,
      ),
      suffixIcon: IconButton(
        onPressed: suffixPressed,
        icon: Icon(
          suffix,
          size: suffixIconSize,
          color: primaryColor,
        ),
      ),
      border: const OutlineInputBorder(),
    ),
  );
}

Widget defaultTextButton({
  required String text,
  double? fontSize,
  bool isUpperCase = true,
  required void Function()? function,
}) =>
    TextButton(onPressed: function, child: Text(isUpperCase ? text.toUpperCase() : text , style:
    TextStyle(fontSize: fontSize),));

Widget defaultButton({
  double? width,
  double? height,
  bool isUpperCase = true,
  double radius = 50.0,
  double? fontSize,
  required void Function() function,
  required String text,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius), color: primaryColor),
    child: MaterialButton(
      onPressed: function,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style:  TextStyle(color: Colors.white , fontSize: fontSize ),
      ),
    ),
  );
}
