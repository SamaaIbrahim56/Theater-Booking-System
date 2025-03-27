import 'dart:io';
main(){
  int i =0;
  int result;
  int RowNum;
  int ColumnNum;
  String Name;
  int PhoneNum;

  Map<dynamic,dynamic>sama={};
  List<List<String>>x=List.generate(5, (int index){
    return ["E","E","E","E","E"];
  });

  while(i==0){
  print("Welcome to our Theater");
  print("press 1 to book new seat");
  print("press 2 to show the theater seats");
  print("press 3 to show users data");
  print("press 4 to exit");
  result= int.parse(stdin.readLineSync()!);

 if(result==1){
     do {
       print("Enter row (1 --> 5)");
       RowNum = int.parse(stdin.readLineSync()!);
       if(RowNum < 1 || RowNum > 5){
         print("This Row Number Invalid :( ");}
       }while(RowNum < 1 || RowNum > 5);

     do{
       print("Enter column (1 --> 5):");
       ColumnNum= int.parse(stdin.readLineSync()!);
       if(ColumnNum<1 || ColumnNum>5){
         print("This Column Number Invalid :( ");}
       }while(ColumnNum<1 || ColumnNum>5);

         print("Enter Your Name");
         Name=stdin.readLineSync()!;

         print("Enter Your Phone Number");
         PhoneNum= int.parse(stdin.readLineSync()!);

       x[RowNum - 1][ColumnNum - 1] = "B";
       sama["$RowNum,$ColumnNum"] = "$Name - $PhoneNum";

       print("Seat booked successfully I wish you an interesting experience :) ");}

 else if(result==2){
       x.forEach((item){
      print(item.join('  '));});
     }

 else if (result == 3) {
     if (sama.isEmpty) {
       print("No Booking Seats Yet My Dear :) ");
     } else {
       print("Users Booking Details:");
       sama.forEach((seatposition, userdata) => print("Seat $seatposition: $userdata"));
     }
   }

 else if(result==4){
    i++;
    return 0;

  }
}



}