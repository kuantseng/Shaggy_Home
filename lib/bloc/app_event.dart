// lib/bloc/app_event.dart

abstract class AppEvent {}

class SwitchPage extends AppEvent{
  final int index;

  SwitchPage({required this.index});
}