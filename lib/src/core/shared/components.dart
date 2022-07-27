import 'package:flutter/material.dart';
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

Widget defaultFormField(
    {required TextEditingController controller,
    TextInputType? type,
    Function(String)? onSubmit,
    Function(String)? onChanged,
    GestureTapCallback? onTap,
    String? Function(String?)? validate,
    required String? label,
    required IconData? prefix,
    bool isClickable = true,
    IconData? suffix,
    void Function()? suffixPressed,
    bool obscureText = false}) {
  return TextFormField(
    obscureText: obscureText,
    enabled: isClickable,
    controller: controller,
    keyboardType: type,
    onFieldSubmitted: onSubmit,
    onChanged: onChanged,
    onTap: onTap,
    validator: validate,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefix),
      suffixIcon: IconButton(
        onPressed: suffixPressed,
        icon: Icon(suffix),
      ),
      border: const OutlineInputBorder(),
    ),
  );
}

Widget defaultTextButton({
  required String text,
  required void Function()? function,
}) =>
    TextButton(onPressed: function, child: Text(text.toUpperCase()));

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required void Function() function,
  required String text,
}) {
  return Container(
    width: width,
    height: 50.0,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius), color: background),
    child: MaterialButton(
      onPressed: function,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
