// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PhoneNumberType _$home = const PhoneNumberType._('home');
const PhoneNumberType _$mobile = const PhoneNumberType._('mobile');
const PhoneNumberType _$office = const PhoneNumberType._('office');

PhoneNumberType _$PhoneNumberTypeValueOf(String name) {
  switch (name) {
    case 'home':
      return _$home;
    case 'mobile':
      return _$mobile;
    case 'office':
      return _$office;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<PhoneNumberType> _$PhoneNumberTypeValues =
    new BuiltSet<PhoneNumberType>(const <PhoneNumberType>[
  _$home,
  _$mobile,
  _$office,
]);

Serializer<Customer> _$customerSerializer = new _$CustomerSerializer();
Serializer<Address> _$addressSerializer = new _$AddressSerializer();
Serializer<PhoneNumber> _$phoneNumberSerializer = new _$PhoneNumberSerializer();
Serializer<PhoneNumberType> _$phoneNumberTypeSerializer =
    new _$PhoneNumberTypeSerializer();

class _$CustomerSerializer implements StructuredSerializer<Customer> {
  @override
  final Iterable<Type> types = const [Customer, _$Customer];
  @override
  final String wireName = 'Customer';

  @override
  Iterable<Object?> serialize(Serializers serializers, Customer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firstName',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'lastName',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
      'registered',
      serializers.serialize(object.registered,
          specifiedType: const FullType(DateTime)),
    ];
    Object? value;
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.age;
    if (value != null) {
      result
        ..add('age')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Address)));
    }
    value = object.phoneNumbers;
    if (value != null) {
      result
        ..add('phoneNumbers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PhoneNumber)])));
    }
    return result;
  }

  @override
  Customer deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CustomerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'registered':
          result.registered = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'address':
          result.address.replace(serializers.deserialize(value,
              specifiedType: const FullType(Address))! as Address);
          break;
        case 'phoneNumbers':
          result.phoneNumbers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PhoneNumber)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$AddressSerializer implements StructuredSerializer<Address> {
  @override
  final Iterable<Type> types = const [Address, _$Address];
  @override
  final String wireName = 'Address';

  @override
  Iterable<Object?> serialize(Serializers serializers, Address object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'streetAddress',
      serializers.serialize(object.streetAddress,
          specifiedType: const FullType(String)),
      'city',
      serializers.serialize(object.city, specifiedType: const FullType(String)),
      'state',
      serializers.serialize(object.state,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Address deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddressBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'streetAddress':
          result.streetAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PhoneNumberSerializer implements StructuredSerializer<PhoneNumber> {
  @override
  final Iterable<Type> types = const [PhoneNumber, _$PhoneNumber];
  @override
  final String wireName = 'PhoneNumber';

  @override
  Iterable<Object?> serialize(Serializers serializers, PhoneNumber object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(PhoneNumberType)),
      'number',
      serializers.serialize(object.number,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PhoneNumber deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PhoneNumberBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(PhoneNumberType))
              as PhoneNumberType;
          break;
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PhoneNumberTypeSerializer
    implements PrimitiveSerializer<PhoneNumberType> {
  @override
  final Iterable<Type> types = const <Type>[PhoneNumberType];
  @override
  final String wireName = 'PhoneNumberType';

  @override
  Object serialize(Serializers serializers, PhoneNumberType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  PhoneNumberType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PhoneNumberType.valueOf(serialized as String);
}

class _$Customer extends Customer {
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final DateTime registered;
  @override
  final String? gender;
  @override
  final int? age;
  @override
  final Address? address;
  @override
  final BuiltList<PhoneNumber>? phoneNumbers;

  factory _$Customer([void Function(CustomerBuilder)? updates]) =>
      (new CustomerBuilder()..update(updates)).build();

  _$Customer._(
      {required this.firstName,
      required this.lastName,
      required this.registered,
      this.gender,
      this.age,
      this.address,
      this.phoneNumbers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(firstName, 'Customer', 'firstName');
    BuiltValueNullFieldError.checkNotNull(lastName, 'Customer', 'lastName');
    BuiltValueNullFieldError.checkNotNull(registered, 'Customer', 'registered');
  }

  @override
  Customer rebuild(void Function(CustomerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomerBuilder toBuilder() => new CustomerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Customer &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        registered == other.registered &&
        gender == other.gender &&
        age == other.age &&
        address == other.address &&
        phoneNumbers == other.phoneNumbers;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, firstName.hashCode), lastName.hashCode),
                        registered.hashCode),
                    gender.hashCode),
                age.hashCode),
            address.hashCode),
        phoneNumbers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Customer')
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('registered', registered)
          ..add('gender', gender)
          ..add('age', age)
          ..add('address', address)
          ..add('phoneNumbers', phoneNumbers))
        .toString();
  }
}

class CustomerBuilder implements Builder<Customer, CustomerBuilder> {
  _$Customer? _$v;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  DateTime? _registered;
  DateTime? get registered => _$this._registered;
  set registered(DateTime? registered) => _$this._registered = registered;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  int? _age;
  int? get age => _$this._age;
  set age(int? age) => _$this._age = age;

  AddressBuilder? _address;
  AddressBuilder get address => _$this._address ??= new AddressBuilder();
  set address(AddressBuilder? address) => _$this._address = address;

  ListBuilder<PhoneNumber>? _phoneNumbers;
  ListBuilder<PhoneNumber> get phoneNumbers =>
      _$this._phoneNumbers ??= new ListBuilder<PhoneNumber>();
  set phoneNumbers(ListBuilder<PhoneNumber>? phoneNumbers) =>
      _$this._phoneNumbers = phoneNumbers;

  CustomerBuilder();

  CustomerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _registered = $v.registered;
      _gender = $v.gender;
      _age = $v.age;
      _address = $v.address?.toBuilder();
      _phoneNumbers = $v.phoneNumbers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Customer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Customer;
  }

  @override
  void update(void Function(CustomerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Customer build() {
    _$Customer _$result;
    try {
      _$result = _$v ??
          new _$Customer._(
              firstName: BuiltValueNullFieldError.checkNotNull(
                  firstName, 'Customer', 'firstName'),
              lastName: BuiltValueNullFieldError.checkNotNull(
                  lastName, 'Customer', 'lastName'),
              registered: BuiltValueNullFieldError.checkNotNull(
                  registered, 'Customer', 'registered'),
              gender: gender,
              age: age,
              address: _address?.build(),
              phoneNumbers: _phoneNumbers?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'address';
        _address?.build();
        _$failedField = 'phoneNumbers';
        _phoneNumbers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Customer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Address extends Address {
  @override
  final String streetAddress;
  @override
  final String city;
  @override
  final String state;

  factory _$Address([void Function(AddressBuilder)? updates]) =>
      (new AddressBuilder()..update(updates)).build();

  _$Address._(
      {required this.streetAddress, required this.city, required this.state})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        streetAddress, 'Address', 'streetAddress');
    BuiltValueNullFieldError.checkNotNull(city, 'Address', 'city');
    BuiltValueNullFieldError.checkNotNull(state, 'Address', 'state');
  }

  @override
  Address rebuild(void Function(AddressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressBuilder toBuilder() => new AddressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Address &&
        streetAddress == other.streetAddress &&
        city == other.city &&
        state == other.state;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, streetAddress.hashCode), city.hashCode), state.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Address')
          ..add('streetAddress', streetAddress)
          ..add('city', city)
          ..add('state', state))
        .toString();
  }
}

class AddressBuilder implements Builder<Address, AddressBuilder> {
  _$Address? _$v;

  String? _streetAddress;
  String? get streetAddress => _$this._streetAddress;
  set streetAddress(String? streetAddress) =>
      _$this._streetAddress = streetAddress;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  AddressBuilder();

  AddressBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _streetAddress = $v.streetAddress;
      _city = $v.city;
      _state = $v.state;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Address other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Address;
  }

  @override
  void update(void Function(AddressBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Address build() {
    final _$result = _$v ??
        new _$Address._(
            streetAddress: BuiltValueNullFieldError.checkNotNull(
                streetAddress, 'Address', 'streetAddress'),
            city:
                BuiltValueNullFieldError.checkNotNull(city, 'Address', 'city'),
            state: BuiltValueNullFieldError.checkNotNull(
                state, 'Address', 'state'));
    replace(_$result);
    return _$result;
  }
}

class _$PhoneNumber extends PhoneNumber {
  @override
  final PhoneNumberType type;
  @override
  final String number;

  factory _$PhoneNumber([void Function(PhoneNumberBuilder)? updates]) =>
      (new PhoneNumberBuilder()..update(updates)).build();

  _$PhoneNumber._({required this.type, required this.number}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, 'PhoneNumber', 'type');
    BuiltValueNullFieldError.checkNotNull(number, 'PhoneNumber', 'number');
  }

  @override
  PhoneNumber rebuild(void Function(PhoneNumberBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneNumberBuilder toBuilder() => new PhoneNumberBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneNumber && type == other.type && number == other.number;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, type.hashCode), number.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PhoneNumber')
          ..add('type', type)
          ..add('number', number))
        .toString();
  }
}

class PhoneNumberBuilder implements Builder<PhoneNumber, PhoneNumberBuilder> {
  _$PhoneNumber? _$v;

  PhoneNumberType? _type;
  PhoneNumberType? get type => _$this._type;
  set type(PhoneNumberType? type) => _$this._type = type;

  String? _number;
  String? get number => _$this._number;
  set number(String? number) => _$this._number = number;

  PhoneNumberBuilder();

  PhoneNumberBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _number = $v.number;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhoneNumber other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PhoneNumber;
  }

  @override
  void update(void Function(PhoneNumberBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneNumber build() {
    final _$result = _$v ??
        new _$PhoneNumber._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'PhoneNumber', 'type'),
            number: BuiltValueNullFieldError.checkNotNull(
                number, 'PhoneNumber', 'number'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
