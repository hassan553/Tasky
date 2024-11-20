part of 'profiel_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetUserProfileLoading extends ProfileState {}

final class GetUserProfileError extends ProfileState {}

final class GetUserProfileSuccess extends ProfileState {}
