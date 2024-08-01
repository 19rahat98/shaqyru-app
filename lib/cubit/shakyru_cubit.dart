import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shaqyru_app/extantions/string_convert.dart';

class ShakyruCubit extends Cubit<ShakyruState> {
  ShakyruCubit() : super(ShakyruLoading());

  late String userName;
  late String userId;

  void initCubit(String userName, String userId) {
    this.userName = decryptFromInt(userName) ?? 'достар';
    this.userId = userId;
    emit(ShakyruCommonState(this.userName));
  }

  final databaseReference = FirebaseDatabase.instance.ref();

  Future<void> saveUser(bool status) async {
    emit(ShakyruLoading());
    try {
      await databaseReference.child(userName).set({
        'username': userName,
        'status': status,
      });
      emit(ShakyruLoaded(userName));
      emit(ShakyruCommonState(userName));
    } catch (e) {
      emit(ShakyruError(e.toString()));
      emit(ShakyruCommonState(userName));
    }
  }
}

@immutable
abstract class ShakyruState {}

class ShakyruCommonState extends ShakyruState {
  final String userName;

  ShakyruCommonState(this.userName);
}

class ShakyruLoading extends ShakyruState {}

class ShakyruLoaded extends ShakyruState {
  final String username;

  ShakyruLoaded(this.username);
}

class ShakyruError extends ShakyruState {
  final String errorMessage;

  ShakyruError(this.errorMessage);
}
