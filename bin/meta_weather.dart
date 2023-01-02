
void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Syntax: dart bin/main.dart <location>');
    return;
  }

  final location = arguments.first;
  print(location);
}