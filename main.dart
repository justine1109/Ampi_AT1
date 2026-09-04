import 'dart:io';
import 'package:riverpod/riverpod.dart';
// NOTE: Adjust the package name in imports to match your project name in pubspec.yaml!
import 'package:at_1_dart_console_application/providers.dart';

final container = ProviderContainer();
final controller = container.read(storesControllerProvider);

void loadDefaultPets() {
  controller.addDog("Justine", 100, 100, 100);
  controller.addDog("ampi", 100, 100, 100);
  controller.addDog("bacuag", 100, 100, 100);
  controller.addDog("katy", 100, 100, 100);
  controller.addDog("usian", 100, 100, 100);

  controller.addCat("jerry", 100, 100, 100);
  controller.addCat("Tomy", 100, 100, 100);
  controller.addCat("argus", 100, 100, 100);
  controller.addCat("Putye", 100, 100, 100);
  controller.addCat("Kit", 100, 100, 100);

  controller.addBird("trunad", 100, 100, 100);
  controller.addBird("sad", 100, 100, 100);
  controller.addBird("halpy", 100, 100, 100);
  controller.addBird("happy", 100, 100, 100);
  controller.addBird("joy", 100, 100, 100);
}

void adoptNewPet() {
  bool selectingPet = true;

  while(selectingPet) {
    print("----------------------------------------------------");
    print("Which type of pet do you want to adopt?");
    print("[1] dog");
    print("[2] cat");
    print("[3] bird");

    stdout.write("Select an option [1-3]: ");
    String? choice = stdin.readLineSync()?.trim();
    
    switch (choice) {
      case '1':
        print("Dog adopted!");
        controller.adoptDogRandom();
        selectingPet = false;
      case '2':
        print("Cat adopted!");
        controller.adoptCatRandom();
        selectingPet = false;
      case '3':
        print("Bird adopted!");
        controller.adoptBirdRandom();
        selectingPet = false;
      default:
        print("Error: Invalid Option");
    }

    controller.currentPet?.status();
  }
}

const HUNGER_EAT_INCREASE = 20;
const THIRST_DRINK_INCREASE = 20;
const HAPPINESS_PLAY_INCREASE = 20;

void interactWithPet() {
  bool interacting = true;

  while(interacting) {
    print("----------------------------------------------------");
    print("You are home.");
    print("What do you want to do with your pet?");
    print("[1] feed");
    print("[2] drink water mineral");
    print("[3] play");
    print("[4] status");
    print("[5] return to petstore");

    stdout.write("Select an option [1-3]: ");
    String? choice = stdin.readLineSync()?.trim();
    
    switch (choice) {
      case '1':
        controller.currentPet?.giveFood(HUNGER_EAT_INCREASE);
      case '2':
        controller.currentPet?.giveWater(THIRST_DRINK_INCREASE);
      case '3':
        controller.currentPet?.play(HAPPINESS_PLAY_INCREASE);
      case '4':
        controller.currentPet?.status();
      case '5':
        print("Returning to Store...");
        interacting = false;
      default:
        print("Error: Invalid Option");
    }
  }
}

void main(List<String> arguments) {
  loadDefaultPets();

  adoptNewPet();

  bool playing = true;

  while(playing) {
    print("----------------------------------------------------");
    print("You are at the petstore.");
    print("What do you want to do?");
    print("[1] adopt the pet");
    print("[2] go home ");
    print("[3] exit");

    stdout.write("Select an option [1-3]: ");
    String? choice = stdin.readLineSync()?.trim();

    switch (choice) {
      case '1':
        controller.adoptOut();
        adoptNewPet();
      case '2':
        interactWithPet();
      case '3':
        playing = false;
      default:
        print("Error: Invalid Option");
    }

  }

  print("----------------------------------------------------");
  print("Program ended, goodbye!");
}
