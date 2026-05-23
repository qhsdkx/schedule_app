part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final Settings settings;
  final String language;

  const SettingsLoaded(this.settings, {this.language = ''});

  @override
  List<Object> get props => [language];
}

class LanguageLoaded extends SettingsState {
  final String message;

  const LanguageLoaded(this.message);
}

class SettingsError extends SettingsState {
  final String message;

  const SettingsError(this.message);
}

class CachedDataDeleted extends SettingsState {
  final String message;

  const CachedDataDeleted(this.message);
}

class FullCachedDataDeleted extends SettingsState {
  final String message;

  const FullCachedDataDeleted(this.message);
}
