import 'package:flutter/material.dart';
class CustomListTile extends StatelessWidget {
  String? Title;
  Image? ImageName;
  VoidCallback? SelectFood;
  IconButton icon;
  Function ontap;

  CustomListTile({required this.Title , required this.ImageName , this.SelectFood,required this.icon , required this.ontap} );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: (){
          ontap();
        },
        child: Container(
          height: 80,
          child: Card(
            child: ListTile(
              leading: ImageName,
              title: Text(Title! ,
                style:const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff05b7ed),
                ),
              ),
              trailing: icon
              ),
            ),
          ),
      ),

    );
  }
}