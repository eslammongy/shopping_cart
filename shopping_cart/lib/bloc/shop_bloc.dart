import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/bloc/blocs.dart';
import 'package:shopping_cart/model/shopping.dart';
import 'package:shopping_cart/repository/shop_data_repository.dart';

class ShoppingBloc extends Bloc<ShoppingEvent, ShoppingState> {
  final ShopDataProvider shopDataProvider = ShopDataProvider();

  ShoppingBloc() : super(ShoppingInitialState()) {
    add(ShoppingPageInitialEvent());
  }
  @override
  Stream<ShoppingState> mapEventToState(ShoppingEvent event) async* {
    if (event is ShoppingPageInitialEvent) {
      ShoppingData shopData = await shopDataProvider.getShoppingItems();
      ShoppingData cardDate = await shopDataProvider.getCardItems();
      yield ShoppingLoadingState(shopData: shopData, cartData: cardDate);
    }
    if (event is AddingItemToCardEvent) {
      yield AddingItemToCardState(cardItems: event.cardItems);
    }
    if (event is AddedItemToCardEvent) {
      yield AddedItemToCardState(cardItems: event.cardItems);
    }
    if (event is DeleteItemFromCardEvent) {
      yield DeleteItemFromCardState(cardItems: event.cardItems);
    }
  }
}
