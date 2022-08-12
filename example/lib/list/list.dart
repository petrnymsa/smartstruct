// SOURCE
import 'package:smartstruct/smartstruct.dart';

part 'list.mapper.g.dart';

class Source {
  final List<int> intList;
  final List<SourceEntry> entryList;
  final List<String> propList;

  Source(this.intList, this.entryList, this.propList);
}

class SourceEntry {
  final String prop;

  SourceEntry(this.prop);
}

// TARGET
class Target {
  final List<int> intList;
  final List<TargetEntry> entryList;

  Target(this.intList, this.entryList);
}

class TargetEntry {
  final String prop;

  TargetEntry(this.prop);
}

@Mapper()
abstract class ListMapper {
  static List<String> _mapPropList(Source source) =>
      source.entryList.map((e) => e.prop).toList();

  @Mapping(target: 'propList', source: _mapPropList)
  Target fromSource(Source source);
  TargetEntry fromSourceEntry(SourceEntry source);
}
