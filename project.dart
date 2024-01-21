import 'dart:io';

void main() {
  List<Map<String, String>> donorList = [];

  while (true) {
    print("\nBlood Bank Management System");
    print("1. Add Donor");
    print("2. Display Donor List");
    print("3. Search Donor by Blood Type");
    print("4. Exit");

    stdout.write("Enter your choice (1-4): ");
    var choice = stdin.readLineSync() ?? '';

    if (choice == '1') {
      addDonor(donorList);
    } else if (choice == '2') {
      displayDonorList(donorList);
    } else if (choice == '3') {
      searchDonorByBloodType(donorList);
    } else if (choice == '4') {
      print("Exiting the Blood Bank Management System. Goodbye!");
      break;
    } else {
      print("Invalid choice. Please enter a number between 1 and 4.");
    }
  }
}

addDonor(List<Map<String, String>> donorList) {
  donorList.add({
    "Name": prompt("Enter donor's name: "),
    "Blood Type": prompt("Enter blood type: "),
  });
  print("Donor added successfully!");
}

displayDonorList(List<Map<String, String>> donorList) {
  print("\nDonor List:");
  donorList.forEach((donor) {
    print("Name: ${donor['Name']}, Blood Type: ${donor['Blood Type']}");
  });
}

searchDonorByBloodType(List<Map<String, String>> donorList) {
  var searchBloodType = prompt("Enter blood type to search: ");
  List<Map<String, String>> matchingDonors = donorList
      .where((donor) => donor['Blood Type'] == searchBloodType)
      .toList();

  if (matchingDonors.isEmpty) {
    print("No donors found with the specified blood type.");
  } else {
    print("\nDonors with Blood Type $searchBloodType:");
    matchingDonors.forEach((donor) {
      print("Name: ${donor['Name']}, Blood Type: ${donor['Blood Type']}");
    });
  }
}

prompt(String promptMessage) {
  stdout.write(promptMessage);
  return stdin.readLineSync() ?? '';
}
