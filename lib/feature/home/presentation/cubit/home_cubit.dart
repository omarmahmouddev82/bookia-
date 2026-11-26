import 'package:bloc/bloc.dart';
import 'package:bookia/feature/home/data/models/books_model.dart';
import 'package:bookia/feature/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  getBestSellerBooks() async{
    emit(GetBestSellerLoading());
    final Response = await HomeRepo.getBestSellerBooks();
    if (Response is BooksModel){
      emit(GetBestSellerSuccess(Response.data?.products));
    }
    else {
      emit(GetBestSellerError());
    }
  }

  search (String text) async {
    emit(SearchLoading());
    final data = await HomeRepo.search(text);
    if (data is List<Products>){
      emit(SearchSuccess(data));
    }
    else{
      emit(SearchError());
    }
  }
}
