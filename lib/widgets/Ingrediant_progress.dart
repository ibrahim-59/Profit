import 'package:flutter/material.dart';
class IngredientProgress extends StatelessWidget {
  final String Ingredient;
  final int leftAmount;
  final double progress, width;
  final Color progressColor;

  const IngredientProgress(
      {required this.Ingredient,
        required this.leftAmount,
        required this.progress,
        required this.width,
        required this.progressColor});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Ingredient.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Container(
                  width: width,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  width: width*progress,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color:progressColor,
                  ),
                ),
              ],
            ),
            SizedBox(width: 10,),

            Text("${leftAmount}g")
          ],
        )
      ],
    );
  }
}