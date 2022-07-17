import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/states.dart';
import 'package:udemy_flutter/models/shop_app/categories_model.dart';
import 'package:udemy_flutter/models/shop_app/login_model.dart';
import 'package:udemy_flutter/modules/shop_app/cateogries/cateogries_screen.dart';
import 'package:udemy_flutter/modules/shop_app/favorites/favorites_screen.dart';
import 'package:udemy_flutter/modules/shop_app/products/products_screen.dart';
import 'package:udemy_flutter/modules/shop_app/settings/settings.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

import '../../../models/shop_app/change_favorites_model.dart';
import '../../../models/shop_app/favorites_Model.dart';
import '../../../models/shop_app/home_model.dart';
import '../../../shared/components/constants.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit() : super (ShopInitialStates());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreen  = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen()
  ];



  void changeHome(int index){
    currentIndex = index ;
    emit(ShopChangeBottomNavStates());
  }
  late HomeModel? homeModel = null ;
  Map<int, bool> favorites = {};

  void getHomeModel(){
    emit(ShopLoadingHomeDataStates());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {

   //   print(token);
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data!.products.forEach((element) {
        favorites.addAll({
          element.id : element.in_favorites,
        }) ;
      });
   //   print(favorites.toString());
      emit(ShopSuccessHomeDataStates());
    }).catchError((onError){
      print(onError);
      emit(ShopErrorHomeDataStates());
    });
  }

  late CategoriesModel? categoriesModel ;

  void getCategories(){
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value) {

      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesStates());
    }).catchError((onError){
      print(onError);
      emit(ShopErrorCategoriesStates());
    });



  }

    ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorites(int productId){

    favorites[productId] = !favorites[productId]!;

    emit(ShopSuccessChangeFavoritesStates());

    DioHelper.postData(
        url: FAVORITES,
        data: {
          'product_id' : productId,
        },
      token: token,
    ).then((value){

      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
     // print(value.data);

      if(!changeFavoritesModel!.status){

        favorites[productId] = !favorites[productId]!;
      }else{
        getFavorites();
      }
    emit(ShopSuccessFavorStates(changeFavoritesModel!));
    }).catchError((onError){

      favorites[productId] = !favorites[productId]!;

      emit(ShopErrorChangeFavoritesStates());
    });
  }

  late FavoritesModel? favoritesModel ;

  void getFavorites(){

    emit(ShopLoadingFavoritesStates());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {

      favoritesModel = FavoritesModel.fromJson(value.data);
      emit(ShopSuccessFavoritesStates());
    }).catchError((onError){
      print(onError.toString());
      emit(ShopErrorFavoritesStates());
    });
  }


 late ShopLoginModel? userModel ;

  void getUserData(){

    emit(ShopLoadingUserDataStates());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {

      userModel =  ShopLoginModel.formJson(value.data);
      print(userModel!.data!.name);
      emit(ShopSuccessUserDataStates());
    }).catchError((onError){
      emit(ShopErrorUserDataStates());
    }) ;



  }

  void updateUser({
  required String name,
  required String email,
  required String phone,
}){

    emit(ShopLoadingUpdateUserStates());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name' : name,
        'email' : email,
        'phone' : phone,
      },
    ).then((value) {

      userModel =  ShopLoginModel.formJson(value.data);
      print(userModel!.data!.name);
      emit(ShopSuccessUserDataStates());

    }).catchError((onError){
      emit(ShopErrorUpdateUserStates());
    });



  }
}

