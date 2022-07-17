import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/models/shop_app/search_model.dart';
import 'package:udemy_flutter/modules/shop_app/search/cubit/states.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super (SearchInitialStates());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;

  void search(String text) {
    emit(SearchLoadingStates());
    DioHelper.postData(
        url: SEARCH,
        token: token,
        data: {
          'text':text,
        },
    ).then((value) {
      model = SearchModel.fromJson(value.data);
      emit(SearchSuccessStates());
    });
  }
}