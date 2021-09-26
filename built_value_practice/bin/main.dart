import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'customer.dart';
import 'serializers.dart';

// Run this by pressing F5 in debugging mode to make sure all of assert statements are executed.
void main(List<String> arguments) {
  // It's still possible to create an object even when the mandatory fields(firstName, lastName, registered) is not provided.
  // However, it will cause runtime exception - BuiltValueNullFieldError
  try {
    Customer((c) => c
      ..lastName = "Doe"
      ..gender = "male"
      ..age = 29);
  } on Error catch (e) {
    assert(e is BuiltValueNullFieldError);
  }

  // Built Value supports only ISO8601(UTC)
  DateTime utcDateTime = DateTime.utc(1980, 1, 2, 3, 4, 5, 6, 7);

  // Create a new customer without address and phone numbers
  // Deliberately using `var` instead of `final` for testing purpose
  var customer2 = Customer((c) => c
    ..firstName = "Jane"
    ..lastName = "Doe"
    ..registered = utcDateTime
    ..gender = "female");

  // Check what we've got.
  // Please note that assert() is executed only in debug mode.
  assert(customer2.firstName == "Jane");
  assert(customer2.lastName == "Doe");
  assert(customer2.registered == utcDateTime);
  assert(customer2.age == null);
  assert(customer2.gender == "female");
  assert(customer2.address == null);
  assert(customer2.phoneNumbers == null);

  // Serialise the created customer object and then deserialize again to check if 2 objects are same
  final serializedCustomer2 = customer2.toJson();
  final recoveredCustomer2 = Customer.fromJson(serializedCustomer2);
  assert(customer2 == recoveredCustomer2);
  assert(customer2.firstName == recoveredCustomer2!.firstName);
  assert(customer2.lastName == recoveredCustomer2!.lastName);
  assert(customer2.registered == recoveredCustomer2!.registered);
  assert(customer2.age == recoveredCustomer2!.age);
  assert(customer2.gender == recoveredCustomer2!.gender);
  assert(customer2.address == recoveredCustomer2!.address);
  assert(customer2.phoneNumbers == recoveredCustomer2!.phoneNumbers);

  // Create a new customer from the customer 2 using rebuild
  // Deliberately using `var` instead of `final` for testing purpose
  var rebuilt1FromCustomer2 = customer2.rebuild((c) => c..firstName = "Hannah");
  assert(customer2 != rebuilt1FromCustomer2);
  assert(customer2.firstName == "Jane");
  assert(customer2.lastName == "Doe");
  assert(customer2.registered == utcDateTime);
  assert(customer2.age == null);
  assert(customer2.gender == "female");
  assert(customer2.address == null);
  assert(customer2.phoneNumbers == null);
  assert(rebuilt1FromCustomer2.firstName == "Hannah");
  assert(rebuilt1FromCustomer2.lastName == "Doe");
  assert(rebuilt1FromCustomer2.registered == utcDateTime);
  assert(rebuilt1FromCustomer2.age == null);
  assert(rebuilt1FromCustomer2.gender == "female");
  assert(rebuilt1FromCustomer2.address == null);
  assert(rebuilt1FromCustomer2.phoneNumbers == null);

  // Create a new customer from the customer 2 using toBuilder() & build() later
  // Deliberately using `var` instead of `final` for testing purpose
  final builderOfCustomer2 = customer2.toBuilder();
  builderOfCustomer2.firstName = "Hannah";
  var rebuilt2FromCustomer2 = builderOfCustomer2.build();
  assert(customer2 != rebuilt2FromCustomer2);
  assert(customer2.firstName == "Jane");
  assert(customer2.lastName == "Doe");
  assert(customer2.registered == utcDateTime);
  assert(customer2.age == null);
  assert(customer2.gender == "female");
  assert(customer2.address == null);
  assert(customer2.phoneNumbers == null);
  assert(rebuilt2FromCustomer2.firstName == "Hannah");
  assert(rebuilt2FromCustomer2.lastName == "Doe");
  assert(rebuilt2FromCustomer2.registered == utcDateTime);
  assert(rebuilt2FromCustomer2.age == null);
  assert(rebuilt2FromCustomer2.gender == "female");
  assert(rebuilt2FromCustomer2.address == null);
  assert(rebuilt2FromCustomer2.phoneNumbers == null);

  // Create a new customer without address and phone numbers
  // We're using EnumClass in PhoneNumber.type, so we can't use unregistered string value there due to compilation error.
  final customer3 = Customer(
    (c) => c
      ..firstName = "John"
      ..lastName = "Doe"
      ..registered = utcDateTime
      ..gender = "male"
      ..age = 29
      ..address.update((a) => a
        ..streetAddress = "110 Nowhere street"
        ..city = "Los Angeles"
        ..state = "CA")
      ..phoneNumbers.addAll(
        [
          PhoneNumber((p) => p
            ..type = PhoneNumberType.home
            ..number = "123"),
          PhoneNumber((p) => p
            ..type = PhoneNumberType.mobile
            ..number = "456"),
          // We can't use arbitrary value in type as this must be the PhoneNumberType EnumClass.
          // PhoneNumber((p) => p
          // ..type = "office"
          // ..number = "456"),
        ],
      ),
  );

  // Serialise the created customer object and then deserialize again to check if 2 objects are same
  final serializedCustomer3 = customer3.toJson();
  final recoveredCustomer3 = Customer.fromJson(serializedCustomer3);
  assert(customer3 == recoveredCustomer3);
  assert(customer3.firstName == recoveredCustomer3!.firstName);
  assert(customer3.lastName == recoveredCustomer3!.lastName);
  assert(customer3.registered == recoveredCustomer3!.registered);
  assert(customer3.age == recoveredCustomer3!.age);
  assert(customer3.gender == recoveredCustomer3!.gender);
  assert(customer3.address == recoveredCustomer3!.address);
  assert(customer3.phoneNumbers == recoveredCustomer3!.phoneNumbers);

  // To use the list of object at top level, we need to use different approach.
  // See https://stackoverflow.com/questions/49453226/dart-built-value-deserialize-list-of-objects
  //
  // 1. The top level item is not a list. This works fine with built_value without trick.
  // {
  //   "topLevelItem": [
  //     {
  //        "subItem1": "xxx"
  //        "subItem2": "xxx"
  //     },
  //     {
  //        "subItem1": "yyy"
  //        "subItem2": "yyy"
  //     }
  //   ]
  // }
  //
  // 2. The top level item is a list. This requires the following trick.
  // [
  //   {
  //      "subItem1": "xxx"
  //      "subItem2": "xxx"
  //   },
  //   {
  //      "subItem1": "yyy"
  //      "subItem2": "yyy"
  //   }
  // ]
  //
  // Serialise the ;ost of 2 customer objects and then deserialize again to check if 2 objects in the list are same
  final customers = <Customer>[customer2, customer3];
  final customersJson =
      customers.map((customer) => customer.toJson()).toList().toString();
  BuiltList<Customer> recoveredCustomers = BuiltList.from(json
      .decode(customersJson)
      .map((customer) =>
          serializers.deserializeWith(Customer.serializer, customer))
      .toList(growable: false));
  assert(customer2 == recoveredCustomers.elementAt(0));
  assert(customer3 == recoveredCustomers.elementAt(1));
}
