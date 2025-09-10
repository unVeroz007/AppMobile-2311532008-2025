void main(List<String> arguments) {
  //Object Orinented Programming (OOP)
  //Membuat object
  var car1 = Car();
  car1.color = 'Red';
  car1.brand = 'Toyota';
  car1.year = 2020;
  car1.drive();
  car1.honk();
  print('Car 1: ${car1.color}, ${car1.brand}, ${car1.year}');

  Cat cat1 = Cat();
  cat1.eat();
  cat1.meow();
}

class Car {
  //property
  String color = '';
  String brand = '';
  int year = 0;

  //method
  void drive() {
    print('The $color $brand is driving');
  }

  void honk() {
    print('The $color $brand is honking');
  }
}

//Pewarisan
class Animal {
  void eat() {
    print('The animal is eating');
  }
}

class Dog extends Animal {
  void bark() {
    print('The dog is barking');
  }
}

class Cat extends Animal {
  void meow() {
    print('The cat is meowing');
  }
}
