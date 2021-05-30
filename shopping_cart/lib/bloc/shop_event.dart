import 'package:equatable/equatable.dart';
import 'package:shopping_cart/model/shopping.dart';

abstract class ShoppingEvent extends Equatable {
  const ShoppingEvent();
  @override
  List<Object> get props => [];
}

class ShoppingPageInitialEvent extends ShoppingEvent {}

class AddingItemToCardEvent extends ShoppingEvent {
  final List<ShopCardItem> cardItems;
  const AddingItemToCardEvent({this.cardItems});
}

class AddedItemToCardEvent extends ShoppingEvent {
  final List<ShopCardItem> cardItems;
  const AddedItemToCardEvent({this.cardItems});
}

class DeleteItemFromCardEvent extends ShoppingEvent {
  final List<ShopCardItem> cardItems;
  final int index;
  const DeleteItemFromCardEvent({this.cardItems, this.index});
}
