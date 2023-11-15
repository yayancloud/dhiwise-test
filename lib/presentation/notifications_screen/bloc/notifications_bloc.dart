import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import '../models/sectionlist_item_model.dart';import 'package:rhs_app/presentation/notifications_screen/models/notifications_model.dart';part 'notifications_event.dart';part 'notifications_state.dart';/// A bloc that manages the state of a Notifications according to the event that is dispatched to it.
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {NotificationsBloc(NotificationsState initialState) : super(initialState) { on<NotificationsInitialEvent>(_onInitialize); }

_onInitialize(NotificationsInitialEvent event, Emitter<NotificationsState> emit, ) async  { emit(state.copyWith(notificationsModelObj: state.notificationsModelObj?.copyWith(sectionlistItemList: fillSectionlistItemList()))); } 
List<SectionlistItemModel> fillSectionlistItemList() { return [SectionlistItemModel(groupBy: "Today"), SectionlistItemModel(groupBy: "Today"), SectionlistItemModel(groupBy: "Yesterday"), SectionlistItemModel(groupBy: "Yesterday")]; } 
 }
