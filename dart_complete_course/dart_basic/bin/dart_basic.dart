import 'package:dart_basic/dart_basic.dart' as dart_basic;

void main(List<String> arguments) {
  try {
    print('Hello world: ${dart_basic.calculate()}! \n'
        'Args sum: ${arguments.fold<int>(0, (previousValue, element) => previousValue + int.parse(element))}');
  } on Exception catch (e) {
    print('Error: $e');
  }
}
