import 'package:riverpod/riverpod.dart';
import 'database.dart';
import 'controller.dart';

final dogPetStoreProvider = Provider<DogPetStore>((ref) {
  return DogPetStore();
});

final catPetStoreProvider = Provider<CatPetStore>((ref) {
  return CatPetStore();
});

final birdPetStoreProvider = Provider<BirdPetStore>((ref) {
  return BirdPetStore();
});

final storesControllerProvider = Provider<StoresController>((ref) {
  final dogPetStore = ref.read(dogPetStoreProvider);
  final catPetStore = ref.read(catPetStoreProvider);
  final birdPetStore = ref.read(birdPetStoreProvider);
  return StoresController(dogPetStore, catPetStore, birdPetStore);
});
