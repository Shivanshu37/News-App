import 'category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = <CategoryModel>[];
  CategoryModel categoryModel0 = CategoryModel();
  categoryModel0.title = "Business";
  categoryModel0.imgURL =
      "https://static6.depositphotos.com/1000816/608/i/600/depositphotos_6086054-stock-photo-handshake-with-map-of-the.jpg";
  categories.add(categoryModel0);
  CategoryModel categoryModel1 = CategoryModel();
  categoryModel1.title = "Entertainment";
  categoryModel1.imgURL =
      "https://209859-635214-1-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2018/09/freestocks-11SgH7U6TmI-unsplash-1-1024x683.jpg";
  categories.add(categoryModel1);
  CategoryModel categoryModel2 = CategoryModel();
  categoryModel2.title = "Health";
  categoryModel2.imgURL =
      "https://www.healthcareitnews.com/sites/hitn/files/Global%20healthcare_2.jpg";
  categories.add(categoryModel2);
  CategoryModel categoryModel3 = CategoryModel();
  categoryModel3.title = "Science";
  categoryModel3.imgURL =
      "https://img.freepik.com/free-vector/hand-drawn-science-education-background_23-2148499325.jpg?size=626&ext=jpg";
  categories.add(categoryModel3);
  CategoryModel categoryModel4 = CategoryModel();
  categoryModel4.title = "Sports";
  categoryModel4.imgURL =
      "https://mongooseagency.com/files/3415/9620/1413/Return_of_Sports.jpg";
  categories.add(categoryModel4);
  CategoryModel categoryModel5 = CategoryModel();
  categoryModel5.title = "Technology";
  categoryModel5.imgURL =
      "https://www.investopedia.com/thmb/QvLIdxSBRTqN0PFDFfW0YV9ZA70=/2121x1193/smart/filters:no_upscale()/GettyImages-964033964-ca3290057ccc4024b57e755423572264.jpg";
  categories.add(categoryModel5);
  return categories;
}
