part of 'mapper_test_input.dart';

enum DogType { happy, angry }

class SimpleTarget {
  final String text;
  final num number;
  final DogType dogType;

  SimpleTarget(this.text, this.number, this.dogType);
}

class SimpleSource {
  final String text;
  final num number;
  final String dogType;

  SimpleSource(this.text, this.number, this.dogType);
}

@Mapper()
@ShouldGenerate(r'''
class SimpleMapperImpl extends SimpleMapper {
  SimpleMapperImpl() : super();

  @override
  SimpleTarget fromSource(SimpleSource source) {
    final simpletarget = SimpleTarget(
        source.text, source.number, SimpleMapper._mapDogType(source));
    return simpletarget;
  }
}
''')
abstract class SimpleMapper {
  static DogType _mapDogType(SimpleSource model) {
    if (model.dogType == 'angry') return DogType.angry;

    return DogType.happy;
  }

  @Mapping(source: _mapDogType, target: 'dogType')
  SimpleTarget fromSource(SimpleSource source);
}
