import 'package:bookia/core/networking/api_endpoints.dart';
import 'package:bookia/core/networking/doi_factory.dart';
import 'package:bookia/feature/home/data/models/books_model.dart';

class HomeRepo {
  static Future<BooksModel?> getBestSellerBooks() async{
    try{
      final response = await DoiFactory.dio?.get (ApiEndpoints.bestSeller);
      if (response?.statusCode == 200){
        BooksModel books = BooksModel.fromJson(response?.data);
        return books;
      }
      else {
        return null;
      }
    }
    catch(error){
      return null;
    }
  }
  static Future<List<Products?>?> search (String text) async{
    try{
      final Response = await DoiFactory.dio?.get(
        ApiEndpoints.search,
        queryParameters: {
          "name": text
        }
      );
      if (Response?.statusCode==200) {
        BooksModel booksModel = BooksModel.fromJson(Response?.data);
        return booksModel.data?.products;
      }
      else {
        return null;
      }
    }
    catch(error){
      return null;
    }
  }
}