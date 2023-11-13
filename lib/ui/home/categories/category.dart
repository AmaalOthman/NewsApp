import 'dart:ui';
class Category{
  String id;
  String title;
  Color color;
  String imageName;
  Category (this.id,this.title,this.imageName,this.color,);
  
  static List<Category> getAllCategories(){
    return[
      Category('sports', 'sports','sports.png',Color(0xFFC91C22)),
      Category('general','general', 'politics.png', Color(0xFF003E90)),
      Category('health', 'health','health.png', Color(0xFFED1E79)),
      Category('business', 'business','business.png',Color(0xFFCF7E48)),
      Category('technology', 'technology', 'enviroment.png', Color(0xFF4882CF)),
      Category('science', 'science', 'science.png', Color(0xFFF2D352)),
    ];
  }
  

}