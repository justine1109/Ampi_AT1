import 'models.dart';

abstract class PetStore<T> {
  List<T> get availablePets;

  T adoptRandom();
  void add(T pet);
}

class DogPetStore extends PetStore<Dog> {
  final List<Dog> availableDogs = [];

  @override
  List<Dog> get availablePets => availableDogs;

  @override
  Dog adoptRandom() {
    availableDogs.shuffle();
    Dog adopted = availableDogs[0];
    availableDogs.removeAt(0);
    return adopted;
  }

  @override
  void add(Dog pet) {
    availablePets.add(pet);
  }
}

class CatPetStore extends PetStore<Cat> {
  final List<Cat> availableCats = [];

  @override
  List<Cat> get availablePets => availableCats;

  @override
  Cat adoptRandom() {
    availableCats.shuffle();
    Cat adopted = availableCats[0];
    availableCats.removeAt(0);
    return adopted;
  }

  @override
  void add(Cat pet) {
    availableCats.add(pet);
  }
}

class BirdPetStore extends PetStore<Bird> {
  final List<Bird> availableBirds = [];

  @override
  List<Bird> get availablePets => availableBirds;

  @override
  Bird adoptRandom() {
    availableBirds.shuffle();
    Bird adopted = availableBirds[0];
    availableBirds.removeAt(0);
    return adopted;
  }

  @override
  void add(Bird pet) {
    availableBirds.add(pet);
  }
}
