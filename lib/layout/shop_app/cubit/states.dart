import '../../../models/shop_app/change_favorites_model.dart';

abstract class ShopStates{}

class ShopInitialStates extends ShopStates{}

class ShopChangeBottomNavStates extends ShopStates {}

class ShopLoadingHomeDataStates extends ShopStates {}

class ShopSuccessHomeDataStates extends ShopStates {}

class ShopErrorHomeDataStates extends ShopStates {}

class ShopSuccessCategoriesStates extends ShopStates {}

class ShopErrorCategoriesStates extends ShopStates {}

class ShopSuccessFavoritesStates extends ShopStates {}

class ShopErrorFavoritesStates extends ShopStates {}

class ShopLoadingFavoritesStates extends ShopStates {}

class ShopSuccessChangeFavoritesStates extends ShopStates {}

class ShopErrorChangeFavoritesStates extends ShopStates {}

class ShopSuccessFavorStates extends ShopStates {
  final ChangeFavoritesModel model;

  ShopSuccessFavorStates(this.model);
}

class ShopLoadingUserDataStates extends ShopStates {}

class ShopSuccessUserDataStates extends ShopStates {}

class ShopErrorUserDataStates extends ShopStates {}

class ShopLoadingUpdateUserStates extends ShopStates {}

class ShopSuccessUpdateUserStates extends ShopStates {}

class ShopErrorUpdateUserStates extends ShopStates {}
