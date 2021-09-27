import 'package:test/test.dart';

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:built_value_for_json_modeling/customer.dart';
import 'package:built_value_for_json_modeling/serializers.dart';

void main() {
  group('Create/Copy Built Value', () {
    test(
        'Instance creation without mandatory fields causes only BuiltValueNullFieldError in runtime.',
        () {
      // Use throwA to match exceptoin. See https://pub.dev/documentation/test_api/latest/expect/throwsA.html for more detail.
      expect(
          () => Customer((c) => c
            ..lastName = "Doe"
            ..gender = "male"
            ..age = 29),
          throwsA(isA<BuiltValueNullFieldError>()));
    });

    test('Single Built Value object without optional fields.', () {
      // Built Value supports only ISO8601(UTC)
      DateTime utcDateTime2 = DateTime.utc(1980, 1, 2, 3, 4, 5, 6, 7);

      // Create a new customer without address and phone numbers
      // Deliberately using `var` instead of `final` for testing purpose
      final customer2 = Customer((c) => c
        ..firstName = "Jane"
        ..lastName = "Doe"
        ..registered = utcDateTime2);

      // Check what we've got.
      // Please note that expect() is executed only in debug mode.
      expect(customer2.firstName, equals("Jane"));
      expect(customer2.lastName, equals("Doe"));
      expect(customer2.registered, equals(utcDateTime2));
      expect(customer2.age, equals(null));
      expect(customer2.gender, equals(null));
      expect(customer2.address, equals(null));
      expect(customer2.phoneNumbers, equals(null));

      // Serialise the created customer object and then deserialize again to check if 2 objects are same
      final serializedCustomer2 = customer2.toJson();
      final Customer recoveredCustomer2 =
          Customer.fromJson(serializedCustomer2)!;
      expect(customer2, equals(recoveredCustomer2));
      expect(customer2.firstName, equals(recoveredCustomer2.firstName));
      expect(customer2.lastName, equals(recoveredCustomer2.lastName));
      expect(customer2.registered, equals(recoveredCustomer2.registered));
      expect(customer2.age, equals(recoveredCustomer2.age));
      expect(customer2.gender, equals(recoveredCustomer2.gender));
      expect(customer2.address, equals(recoveredCustomer2.address));
      expect(customer2.phoneNumbers, equals(recoveredCustomer2.phoneNumbers));

      // Create a new customer from the customer 2 using rebuild
      // Deliberately using `var` instead of `final` for testing purpose
      final rebuilt1FromCustomer2 =
          customer2.rebuild((c) => c..firstName = "Hannah");
      expect(customer2 != rebuilt1FromCustomer2, true);
      expect(customer2.firstName, equals("Jane"));
      expect(customer2.lastName, equals("Doe"));
      expect(customer2.registered, equals(utcDateTime2));
      expect(customer2.age, equals(null));
      expect(customer2.address, equals(null));
      expect(customer2.phoneNumbers, equals(null));
      expect(rebuilt1FromCustomer2.firstName, equals("Hannah"));
      expect(rebuilt1FromCustomer2.lastName, equals("Doe"));
      expect(rebuilt1FromCustomer2.registered, equals(utcDateTime2));
      expect(rebuilt1FromCustomer2.age, equals(null));
      expect(rebuilt1FromCustomer2.address, equals(null));
      expect(rebuilt1FromCustomer2.phoneNumbers, equals(null));
      expect(customer2.firstName != rebuilt1FromCustomer2.firstName, true);

      // Create a new customer from the customer 2 using toBuilder() & build() later
      // Deliberately using `var` instead of `final` for testing purpose
      final builderOfCustomer2 = customer2.toBuilder();
      builderOfCustomer2.firstName = "Hannah";
      final rebuilt2FromCustomer2 = builderOfCustomer2.build();
      expect(customer2 != rebuilt2FromCustomer2, true);
      expect(customer2.firstName, equals("Jane"));
      expect(customer2.lastName, equals("Doe"));
      expect(customer2.registered, equals(utcDateTime2));
      expect(customer2.age, equals(null));
      expect(customer2.address, equals(null));
      expect(customer2.phoneNumbers, equals(null));
      expect(rebuilt2FromCustomer2.firstName, equals("Hannah"));
      expect(rebuilt2FromCustomer2.lastName, equals("Doe"));
      expect(rebuilt2FromCustomer2.registered, equals(utcDateTime2));
      expect(rebuilt2FromCustomer2.age, equals(null));
      expect(rebuilt2FromCustomer2.address, equals(null));
      expect(rebuilt2FromCustomer2.phoneNumbers, equals(null));
      expect(customer2.firstName != rebuilt2FromCustomer2.firstName, true);
    });

    test('Single Built Value object with all of optional fields.', () {
      // Built Value supports only ISO8601(UTC)
      DateTime utcDateTime3 = DateTime.utc(1980, 1, 2, 3, 4, 5, 6, 7);

      // Create a new customer without address and phone numbers
      // We're using EnumClass in PhoneNumber.type, so we can't use unregistered string value there due to compilation error.
      final customer3 = Customer(
        (c) => c
          ..firstName = "John"
          ..lastName = "Doe"
          ..registered = utcDateTime3
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
      final recoveredCustomer3 = Customer.fromJson(serializedCustomer3)!;
      expect(customer3 == recoveredCustomer3, true);
      expect(customer3.firstName, equals(recoveredCustomer3.firstName));
      expect(customer3.lastName, equals(recoveredCustomer3.lastName));
      expect(customer3.registered, equals(recoveredCustomer3.registered));
      expect(customer3.age, equals(recoveredCustomer3.age));
      expect(customer3.gender, equals(recoveredCustomer3.gender));
      expect(customer3.address, equals(recoveredCustomer3.address));
      expect(customer3.phoneNumbers, equals(recoveredCustomer3.phoneNumbers));
    });
  });

  group('Top level list of Built Value objects', () {
    test('Serialization/Deserialzation', () {
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
      // Built Value supports only ISO8601(UTC)
      DateTime utcDateTime2 = DateTime.utc(1980, 1, 2, 3, 4, 5, 6, 7);

      // Create a new customer without address and phone numbers
      // Deliberately using `var` instead of `final` for testing purpose
      final customer2 = Customer((c) => c
        ..firstName = "Jane"
        ..lastName = "Doe"
        ..registered = utcDateTime2);

      final customer3 = Customer(
        (c) => c
          ..firstName = "John"
          ..lastName = "Doe"
          ..registered = utcDateTime2
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
            ],
          ),
      );

      final customers = <Customer>[customer2, customer3];
      final customersJson =
          customers.map((customer) => customer.toJson()).toList().toString();
      BuiltList<Customer> recoveredCustomers = BuiltList.from(json
          .decode(customersJson)
          .map((customer) =>
              serializers.deserializeWith(Customer.serializer, customer))
          .toList(growable: false));
      expect(customer2, equals(recoveredCustomers.elementAt(0)));
      expect(customer3, equals(recoveredCustomers.elementAt(1)));
    });
  });
}
