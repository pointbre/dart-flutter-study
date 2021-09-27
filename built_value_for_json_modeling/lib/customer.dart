// 1. Use bvtsf to create Customer including import and part declarations.
// 2. Use bvts to create Address and then change _$AddressSerializer -> _$addressSerializer
// 3. Use bvts to create PhoneNumber and then change _$PhoneNumberSerializer -> _$phoneNumberSerializer
// 4. Use bves to create PhoneNumberType and then change: _$PhoneNumberTypeSerializer -> _$phoneNumberTypeSerializer.
// 5. Run build task by pressing ctrl + p --> Tasks: Run Build Task.
//    The build task will run built_value_generator to generate customer.g.dart and serializer.g.dart.
// 6. Once serializers.g.dart is created, import it in this file.
// 7. Modify classes' toJson() and fromJson() like the following
// String toJson() {
//   return json.encode(serializers.serializeWith(Customer.serializer, this));
// }
//
//static Customer? fromJson(String jsonString) {
//   return serializers.deserializeWith(Customer.serializer, json.decode(jsonString));
// }
// 8. Remove the following 2 unnecessary lines from PhoneNumberType
// String serialize() {
//   return serializers.serializeWith(PhoneNumberType.serializer, this);
// }
//
// static PhoneNumberType deserialize(String string) {
//   return serializers.deserializeWith(PhoneNumberType.serializer, string);
// }
// 9. Once customer.g.dart and serializers.g.dart is created, it's ready for your work, so add fields/constants.
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'customer.g.dart';

abstract class Customer implements Built<Customer, CustomerBuilder> {
  // The mandatory fields without '?'.
  // It's possible to explicitly specify the property name if you want.
  @BuiltValueField(wireName: 'firstName')
  String get firstName;
  String get lastName;
  DateTime get registered;

  // The optional fields with '?'
  String? get gender;
  int? get age;
  Address? get address;
  // You can't use List here. Use BuiltList instead.
  BuiltList<PhoneNumber>? get phoneNumbers;

  Customer._();
  factory Customer([void Function(CustomerBuilder) updates]) = _$Customer;

  String toJson() {
    return json.encode(serializers.serializeWith(Customer.serializer, this));
  }

  static Customer? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Customer.serializer, json.decode(jsonString));
  }

  static Serializer<Customer> get serializer => _$customerSerializer;
}

abstract class Address implements Built<Address, AddressBuilder> {
  String get streetAddress;
  String get city;
  String get state;

  Address._();
  factory Address([void Function(AddressBuilder) updates]) = _$Address;

  String toJson() {
    return json.encode(serializers.serializeWith(Address.serializer, this));
  }

  static Address? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Address.serializer, json.decode(jsonString));
  }

  static Serializer<Address> get serializer => _$addressSerializer;
}

abstract class PhoneNumber implements Built<PhoneNumber, PhoneNumberBuilder> {
  PhoneNumberType get type;
  String get number;

  PhoneNumber._();
  factory PhoneNumber([void Function(PhoneNumberBuilder) updates]) =
      _$PhoneNumber;

  String toJson() {
    return json.encode(serializers.serializeWith(PhoneNumber.serializer, this));
  }

  static PhoneNumber? fromJson(String jsonString) {
    return serializers.deserializeWith(
        PhoneNumber.serializer, json.encode(jsonString));
  }

  static Serializer<PhoneNumber> get serializer => _$phoneNumberSerializer;
}

class PhoneNumberType extends EnumClass {
  static const PhoneNumberType home = _$home;
  static const PhoneNumberType mobile = _$mobile;
  static const PhoneNumberType office = _$office;

  const PhoneNumberType._(String name) : super(name);

  static BuiltSet<PhoneNumberType> get values => _$PhoneNumberTypeValues;
  static PhoneNumberType valueOf(String name) => _$PhoneNumberTypeValueOf(name);

  static Serializer<PhoneNumberType> get serializer =>
      _$phoneNumberTypeSerializer;
}
