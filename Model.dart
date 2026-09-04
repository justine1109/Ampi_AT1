abstract class Pet {
  final String name;
  int hunger = 100;
  int thirst = 100;
  int happiness = 100;

  Pet(this.name, this.hunger, this.thirst, this.happiness);

  static const HUNGER_TICK_DECREASE = 5;
  static const THIRST_TICK_DECREASE = 5;
  static const HAPPINESS_TICK_DECREASE = 5;

  void giveFood(final int amount) {
    tick();
    hunger += amount;
    print("$name was fed: $amount");
    if (hunger > 100) hunger = 100;
  }
  void giveWater(final int amount) {
    tick();
    thirst += amount;
    print("$name drunk: $amount");
    if (thirst > 100) thirst = 100;
  }
  void play(final int amount) {
    tick();
    happiness += amount;
    print("$name had fun: $amount");
    if (happiness > 100) happiness = 100;
  }
  void status() {
    print("Name: $name");
    print("Hunger: $hunger%");
    print("Thirst: $thirst%");
    print("Happiness: $happiness%");
  }
  void tick() {
    hunger -= HUNGER_TICK_DECREASE;
    thirst -= THIRST_TICK_DECREASE;
    happiness -= HAPPINESS_TICK_DECREASE;
  }

  void makeNoise();
}

class Dog extends Pet {
  Dog(super.name, super.hunger, super.thirst, super.happiness);

  @override
  void makeNoise() {
    print("Arf! Arf! Arf!");
  }
}

class Cat extends Pet {
  Cat(super.name, super.hunger, super.thirst, super.happiness);

  @override
  void makeNoise() {
    print("Meow! Meow! Meow!");
  }
}

class Bird extends Pet {
  Bird(super.name, super.hunger, super.thirst, super.happiness);

  @override
  void makeNoise() {
    print("Cacaw! Cacaw! Cacaw!");
  }
}
