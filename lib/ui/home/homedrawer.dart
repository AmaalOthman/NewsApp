import 'package:flutter/material.dart';

typedef OnMenueItemClick = void Function(MenueItem clickedItemPos);

class HomeDrawer extends StatelessWidget {
  OnMenueItemClick onMenueItemClick;
  HomeDrawer(this.onMenueItemClick,{super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(
                vertical: 48
              ),
              alignment: Alignment.center,
              //color: Theme.of(context).primaryColor,
              child: Text('News App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),),
            ),
            InkWell(
              onTap: (){
                onMenueItemClick(MenueItem.categories);

              },
              child: Row(
                children: [
                  Icon(Icons.list,size: 32,),
                  Text('Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){
                onMenueItemClick(MenueItem.settings);

              },
              child: Row(
                children: [
                  Icon(Icons.settings,size: 32,),
                  Text('Settings',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
enum MenueItem{
  categories,
  settings

}
