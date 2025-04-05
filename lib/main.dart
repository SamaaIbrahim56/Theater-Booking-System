import 'dart:io';

void main() {
  TheaterBookingSystem Theater =TheaterBookingSystem();
  Theater.run();
}
class TheaterBookingSystem{
  TheaterBookingSystem._theater();
  static final TheaterBookingSystem theater = TheaterBookingSystem._theater();
  factory TheaterBookingSystem() => theater;



  int i=0;
  int result=0;
  Map<dynamic, dynamic> sama ={};
  List<List<String>> x=List.generate(5, (int index) {
    return ["E", "E", "E", "E", "E"];
  });

  void run(){
    while (i == 0) {
      displayOptions();
      result = int.parse(stdin.readLineSync()!);

      if (result == 1) {
        bookseat(x,sama);
      } else if (result == 2) {
        showSeats(x);
      } else if (result == 3) {
        showUsers(sama);
      } else if (result == 4) {
        i++;
        return ;
      }
    }
  }
}

void displayOptions() {
  print("Welcome to our Theater");
  print("press 1 to book new seat");
  print("press 2 to show the theater seats");
  print("press 3 to show users data");
  print("press 4 to exit");}
void bookseat(List<List<String>> x, Map<dynamic, dynamic> sama) {
  int RowNum;
  int ColumnNum;
  String Name;
  int PhoneNum;
  bool seatBooked = false;
  do {
    do {
      print("Enter row (1 --> 5)");
      RowNum = int.parse(stdin.readLineSync()!);
      if (RowNum < 1 || RowNum > 5) {
        print("This Row Number Invalid :( ");
      }
    } while (RowNum < 1 || RowNum > 5);
    do {
      print("Enter column (1 --> 5):");
      ColumnNum = int.parse(stdin.readLineSync()!);
      if (ColumnNum < 1 || ColumnNum > 5) {
        print("This Column Number Invalid :( ");
      }
    } while (ColumnNum < 1 || ColumnNum > 5);
    if (x[RowNum - 1][ColumnNum - 1] == "B") {
      print("Seat is already booked, please choose another seat.\n");
    } else {
      x[RowNum - 1][ColumnNum - 1] = "B";
      seatBooked = true;
    }
  } while (!seatBooked);
  print("Enter Your Name");
  Name = stdin.readLineSync()!;

  print("Enter Your Phone Number");
  PhoneNum = int.parse(stdin.readLineSync()!);

  sama["$RowNum,$ColumnNum"] = "$Name - $PhoneNum";
  print("Seat booked successfully I wish you an interesting experience :) ");
}

void showSeats(List<List<String>> x) {
  print("\nTheater Seats:");
  x.forEach((item) {
    print(item.join('  '));
  });
}

void showUsers(Map<dynamic, dynamic> sama) {
  if (sama.isEmpty) {
    print("No Booking Seats Yet My Dear :) ");
  } else {
    print("Users Booking Details:");
    sama.forEach((seatposition, userdata) =>
        print("Seat $seatposition: $userdata"));
  }
}
