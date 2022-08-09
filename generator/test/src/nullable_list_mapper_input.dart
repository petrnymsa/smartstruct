part of 'mapper_test_input.dart';

class NullableListSource {
  final List<ListSubSource>? list;
  final List<ListSubSource>? list2;

  NullableListSource(this.list, this.list2);
}

class NullableListTarget {
  final List<ListSubTarget>? list;
  final List<ListSubTarget> list2;

  NullableListTarget(this.list, this.list2);
}

@Mapper()
@ShouldGenerate(r'''
class NullableListMapperImpl extends NullableListMapper {
  NullableListMapperImpl() : super();

  @override
  NullableListTarget fromSource(NullableListSource source) {
    final nullablelisttarget = NullableListTarget(
        source.list?.map(fromSubSource).toList(),
        source.list2?.map(fromSubSource).toList() ?? []);
    return nullablelisttarget;
  }

  @override
  ListSubTarget fromSubSource(ListSubSource source) {
    final listsubtarget = ListSubTarget(source.text);
    return listsubtarget;
  }
}
''')
abstract class NullableListMapper {
  NullableListTarget fromSource(NullableListSource source);
  ListSubTarget fromSubSource(ListSubSource source);
}
