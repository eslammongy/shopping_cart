import 'package:equatable/equatable.dart';
import 'package:shopping_cart/model/shopping.dart';

abstract class ShoppingState extends Equatable {
  const ShoppingState();
  @override
  List<Object> get props => [];
}

class ShoppingInitialState extends ShoppingState {}

class ShoppingLoadingState extends ShoppingState {
  final ShoppingData shopData;
  final ShoppingData cartData;

  ShoppingLoadingState({this.cartData, this.shopData});
}

class AddingItemToCardState extends ShoppingState {
  final ShoppingData cartData;
  final List<ShopCardItem> cardItems;
  AddingItemToCardState({this.cartData, this.cardItems});
}

class AddedItemToCardState extends ShoppingState {
  final List<ShopCardItem> cardItems;
  AddedItemToCardState({this.cardItems});
}

class DeleteItemFromCardState extends ShoppingState {
  final List<ShopCardItem> cardItems;
  DeleteItemFromCardState({this.cardItems});
}
