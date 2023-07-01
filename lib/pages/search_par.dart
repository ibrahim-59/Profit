import 'package:flutter/material.dart';
import 'package:mlmodel/pages/search_page.dart';
import 'package:mlmodel/provider/favorite_provider.dart';


class SearchPar extends StatelessWidget {
  String? name;


  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(

            onSubmitted: (v){
              name=v;
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(search: name,)));
            },


            decoration: InputDecoration(
              suffixIcon: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(search: name,)));
              },icon: Icon(Icons.search),),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              fillColor: Colors.grey,
              filled: true,
            ),
          ),
        ),
      ),
    );
  }
}
