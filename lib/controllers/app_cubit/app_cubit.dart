import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controllers/app_cubit/app_states.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  List<ArticleModel> searchList = [];
  void searchInNews({required query})async {
    emit(SearchLoadingState());
  searchList = await NewsService(Dio()).searchInNews(query: query);
    emit(SearchSuccessState());
  }
}
