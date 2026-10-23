// Week 1: Assignment
// Authors: KIRABIRA MOHAMMAD ELIAS                         MAKABUGO J SHAFIC               Kaddu Suudi
// Registration Number: 241-21301-7051                     241-22302-7351                 241-22302-7251
// Bachelors of Computer Science                           Bachelors of Information Technology Bachelors of Computer Science

// ---------- Exercise 3: functions ----------
// isEven written with arrow syntax; returns a bool.
bool isEven(int n) => n % 2 == 0;

// ---------- Exercise 5: null safety ----------
// Returns a nickname, or null when we don't know one.
String? findNickname(String name) {
  if (name == 'Alice') return 'Ally';
  return null;
}

// ---------- Exercise 6: classes ----------
class Person {
  String name;
  int age;
  Person(this.name, this.age);

  void introduce() {
    print('Hi, I am $name and I am $age years old.');
  }
}

class Student extends Person {
  String school;
  Student(String name, int age, this.school) : super(name, age);
}

// Teacher extends Person and adds a subject.
class Teacher extends Person {
  String subject;
  Teacher(String name, int age, this.subject) : super(name, age);

  // @override replaces Person's introduce() with a Teacher version.
  @override
  void introduce() {
    print('Hello, I am $name and I teach $subject.');
  }
}

void main() {
  // ---------- Exercise 1: variables ----------
  final int age = 25;
  // age = 26;
  // ANSWER: uncommenting the line above gives the error
  // "The final variable 'age' can only be set once."
  // WHY: a `final` variable can be assigned only once, so a second
  // assignment is not allowed.
  print('Exercise 1: age is $age');

  // ---------- Exercise 2: control structures ----------
  int score = 95;
  // PREDICTION: 95 -> "Grade: A" (95 >= 90). Change score to 40 and it
  // prints "Grade: F" because no earlier condition matches, so else runs.
  if (score >= 90) {
    print('Exercise 2: Grade: A');
  } else if (score >= 75) {
    print('Exercise 2: Grade: B');
  } else if (score >= 50) {
    print('Exercise 2: Grade: C');
  } else {
    print('Exercise 2: Grade: F');
  }

  // ---------- Exercise 3: functions ----------
  print('Exercise 3: isEven(4) = ${isEven(4)}'); // true
  print('Exercise 3: isEven(7) = ${isEven(7)}'); // false

  // ---------- Exercise 4: collections ----------
  Map<String, int> ages = {'Alice': 25, 'Beatrice': 30};
  ages['David'] = 28; // new person added
  for (final entry in ages.entries) {
    print('Exercise 4: ${entry.key} is ${entry.value} years old');
  }

  // ---------- Exercise 5: null safety ----------
  // ANSWER: my own name is not handled in findNickname, so it returns null.
  // The ?? operator then supplies the fallback, so "Anonymous" is printed.
  print('Exercise 5: ${findNickname('Elias') ?? 'Anonymous'}');
  print('Exercise 5: ${findNickname('Alice') ?? 'Anonymous'}'); // Ally

  // ---------- Exercise 6: classes ----------
  Student student = Student('Sam', 20, 'Makerere University');
  Teacher teacher = Teacher('Beatrice', 35, 'Mathematics');
  student.introduce(); // uses Person's introduce()
  teacher.introduce(); // uses Teacher's overridden introduce()
}
