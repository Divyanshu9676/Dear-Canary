import 'package:dear_canary/screens/Diary/old_diary_entry.dart';


class UserDetail {
  String name = ""; //done
  String username = "";
  String userMobile = ""; //done
  String userCountry = ""; //done
  String userState = ""; //done
  String userPinCode = ""; //done
  String userJob = ""; //done
  String userCurrentDiaryEntry = "";
  DateTime userDateOfBirth = DateTime.now(); //done
  DateTime userDeliveryDate = DateTime.now(); //done
  DateTime userCurrentDiaryEntryTiming = DateTime.now();
  bool userSingleMother = false; //done
  bool userCurrentlyPregnant = false; //done
  bool userDetailsFilled = false; //done
  bool userInitialTestTaken = false; //done
  int userChildNo = 0; //done
  int userAge = 0;
  int userInitialScore = 0; //done
  List<String> userPreferredContacts = [];
  List<String> userDiary = [];
  List<DateTime> userDiaryTiming = [];

  UserDetail.mobileNumber(this.userMobile){
    print(userMobile);
  }

  UserDetail.basicEntryWithDeliveryDate(
      this.name,
      this.userDateOfBirth,
      this.userCurrentlyPregnant,
      this.userDeliveryDate,
      this.userChildNo
  ){
    print('name : $name');
    print('dob: $userDateOfBirth');
    print(userCurrentlyPregnant);
    print(userDeliveryDate);
    print(userChildNo);
    userAge = calculateAge(userDateOfBirth);
    print("age: $userAge");
  }

  UserDetail.basicEntryWithoutDeliveryDate(
      this.name,
      this.userDateOfBirth,
      this.userCurrentlyPregnant,
      this.userChildNo
  );

  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  UserDetail.initialTestTaken(
      this.userInitialTestTaken,
      this.userInitialScore
  );

  UserDetail.remainingEntry(
      this.userCountry,
      this.userState,
      this.userPinCode,
      this.userSingleMother,
      this.userJob,
      this.userDetailsFilled
  );

  UserDetail.addDiaryEntry(this.userCurrentDiaryEntry){
    userCurrentDiaryEntryTiming = DateTime.now();
    userDiary.add(userCurrentDiaryEntry);
    userDiaryTiming.add(userCurrentDiaryEntryTiming);
      for(int i=0; i<userDiary.length; i++){
        print(userDiary[i]);
        print(userDiaryTiming[i]);
      }

      OldDiaryEntry.diaryEntry(userDiary, userDiaryTiming);
  }


  // Future<DocumentReference> addUser(){
  //   return FirebaseFirestore.instance
  //       .collection('userDetails')
  //       .add(<String, dynamic>{
  //           'name': name,
  //           'country': userCountry,
  //           'mobile': userMobile,
  //           'state': userState,
  //           'pincode': userPinCode,
  //           'job': userJob,
  //           'dob': DateFormat('dd-mm-yyyy').format(userDateOfBirth),
  //           'delivery date': DateFormat('dd-mm-yyyy').format(userDeliveryDate),
  //           'single mother': userSingleMother,
  //           'currently pregnant': userCurrentlyPregnant,
  //           'details filled': userDetailsFilled,
  //           'initial test taken': userInitialTestTaken ,
  //           'child no': userChildNo,
  //           'age': userAge,
  //           'initial test score': userInitialScore,
  //   });
  // }

}
