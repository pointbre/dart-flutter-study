import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';

import 'customer.dart';

part 'serializers.g.dart';

// The following is created with the snipper bvs
// Add Customer to fields
// All of sub objects are automatically included
// Add part 'serializers.g.dart';
// The last line changed to final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
// 1.StandardJsonPlugin() was added to fix the exception: Deserializing '...' to 'Customer' failed due to: type '_InternalLinkedHashMap<String, dynamic>' is not a subtype of type 'Iterable<Object?>' in type cast
// 2.Iso8601DateTimeSerializer is also added to ISO8601 datetime serialization/deserialization
@SerializersFor([
  Customer,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
