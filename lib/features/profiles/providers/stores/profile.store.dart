import 'package:flutter/foundation.dart';
import 'package:todo/features/profiles/models/profile.model.dart';
import 'package:todo/features/profiles/providers/states/profile.error.state.dart';
import 'package:todo/features/profiles/providers/states/profile.initial.state.dart';
import 'package:todo/features/profiles/providers/states/profile.loaded.state.dart';
import 'package:todo/features/profiles/providers/states/profile.loading.state.dart';
import 'package:todo/features/profiles/providers/states/profile.state.dart';
import 'package:todo/features/profiles/services/profile.service.dart';

class ProfileStore extends ValueNotifier<ProfileState> {
  final ProfileService _service;

  ProfileStore(this._service) : super(ProfileInitial());

  Future<void> getProfiles() async {
    value = ProfileLoading();

    try {
      final List<ProfileModel> profiles = await _service.getProfiles();
      value = ProfileLoaded(
        profiles: profiles,
      );
    } catch (e) {
      value = ProfileError(
        message: e.toString(),
      );
    }
  }
}
