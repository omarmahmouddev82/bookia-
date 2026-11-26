import 'package:bookia/core/networking/api_endpoints.dart';
import 'package:bookia/core/networking/doi_factory.dart';
import 'package:bookia/feature/book_details/data/models/book_details_model.dart';

class BookDetailsRepo {
  static getBookDetails (int id) async {
    try{
      final response = await DoiFactory.dio?.get("${ApiEndpoints.bookDetails}$id");
      if(response?.statusCode==200){
        BookDetailsModel details = BookDetailsModel.fromJson(response?.data);
        return details;
      }
      else {
        return null;
      }
    }
    catch(e){
      return null;
    }
  }
}