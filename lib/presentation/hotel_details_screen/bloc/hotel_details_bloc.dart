import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import '../models/rectangle_item_model.dart';import '../models/framenineteen_item_model.dart';import 'package:rhs_app/presentation/hotel_details_screen/models/hotel_details_model.dart';part 'hotel_details_event.dart';part 'hotel_details_state.dart';/// A bloc that manages the state of a HotelDetails according to the event that is dispatched to it.
class HotelDetailsBloc extends Bloc<HotelDetailsEvent, HotelDetailsState> {HotelDetailsBloc(HotelDetailsState initialState) : super(initialState) { on<HotelDetailsInitialEvent>(_onInitialize); }

_onInitialize(HotelDetailsInitialEvent event, Emitter<HotelDetailsState> emit, ) async  { emit(state.copyWith(hotelDetailsModelObj: state.hotelDetailsModelObj?.copyWith(rectangleItemList: fillRectangleItemList(), framenineteenItemList: fillFramenineteenItemList()))); } 
List<RectangleItemModel> fillRectangleItemList() { return [RectangleItemModel(rectangle: ImageConstant.imgRectangle7), RectangleItemModel(rectangle: ImageConstant.imgRectangle8), RectangleItemModel(rectangle: ImageConstant.imgRectangle9)]; } 
List<FramenineteenItemModel> fillFramenineteenItemList() { return [FramenineteenItemModel(jennyWilson: ImageConstant.imgEllipse1, jennyWilson1: "Jenny Wilson", dec: "Dec 10, 2024", veryniceandcomfortab: "Very nice and comfortable hotel, thank you for accompanying my vacation!"), FramenineteenItemModel(jennyWilson: ImageConstant.imgEllipse148x48, jennyWilson1: "Guy Hawkins", dec: "Dec 10, 2024", veryniceandcomfortab: "Very beautiful hotel, my family and I are very satisfied with the service!"), FramenineteenItemModel(jennyWilson: ImageConstant.imgEllipse11, jennyWilson1: "Kristin Watson", dec: "Dec 10, 2024", veryniceandcomfortab: "The rooms are very comfortable and the natural views are amazing, can't wait to come back again!")]; } 
 }
