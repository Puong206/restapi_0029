import 'package:equatable/equatable.dart';

abstract class HewanState extends Equatable{
  @override
  List<Object?> get props => [];
}

class HewanInitial extends HewanState{}

class HewanLoading extends HewanState{}