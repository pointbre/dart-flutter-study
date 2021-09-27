// 1. Use bvs to create a file
// 2. Add 'Customer' to @SerializersFor list.
// 3. ..add(Iso8601DateTimeSerializer()) is added to deal with ISO 8601 datetime serialization/deserialization.
import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'customer.dart';

part 'serializers.g.dart';

@SerializersFor([Customer])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
