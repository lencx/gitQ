/// author: lencx
/// jtm: JSON to modles
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

const TAG = "\$";
const SRC = "json"; // JSON files directories
const DIST = "lib/models"; // output directories
const TEMPLATE = "import 'package:json_annotation/json_annotation.dart';\r\n"
  + "%t\npart '%s.g.dart';\r\n\r\n"
  + "@JsonSerializable()\r\n"
  + "class %s {\r\n"
  + "  %s();\r\n\r\n"
  + "  %sfactory %s.fromJson(Map<String, dynamic> json) => _\$%sFromJson(json);\r\n\r\n"
  + "  Map<String, dynamic> toJson() => _\$%sToJson(this);\r\n}\r\n";

/// json to model
/// `srcDir` json files directories
/// `distDir` output directories
void jtm(srcDir, distDir) {
  // create if folder does not exist
  new Directory(distDir).create();

  // traversing the JSON directory to generate templates
  final src = new Directory(srcDir);
  final list = src.listSync();

  File file;
  list.forEach((f) {
    if (FileSystemEntity.isFileSync(f.path)) {
      file = new File(f.path);
      var paths = path.basename(f.path).split('.');
      String name = paths.first;
      if (paths.last.toLowerCase() != 'json' || name.startsWith('_')) return;
      if (name.startsWith('_')) return;

      // generated template
      var map = json.decode(file.readAsStringSync());
      // to prevent repeated import of package names, use `Set` to save the generated `import` statement
      var set = new Set<String>();
      StringBuffer attrs = new StringBuffer();
      (map as Map<String, dynamic>).forEach((key, v) {
        if (key.startsWith('_')) return;
        // when `key` contains underscores, convert to camelCase and add `@JsonKey(name="key")`
        if (key.contains('_')) {
          attrs.write('@JsonKey(name: "$key")');
          attrs.write('\r\n  ');
          attrs.write(getType(v, set, name));
          attrs.write(' ');
          attrs.write(changeToCamelCase(key, false));
          attrs.writeln(';');
          attrs.write('\r\n  ');
        } else {
          attrs.write(getType(v, set, name));
          attrs.write(' ');
          attrs.write(key);
          attrs.writeln(';');
          attrs.write('\r\n  ');
        }
      });
      String className = '';
      // `className` contains underscores
      if (name.contains('_')) {
        className = changeToCamelCase(name, true);
      } else {
        className = name[0].toUpperCase() + name.substring(1);
      }
      var dist = format(TEMPLATE, [
        name,
        className,
        className,
        attrs.toString(),
        className,
        className,
        className
      ]);
      var _import = set.join(';\r\n');
      _import += _import.isEmpty ? '' : ';';
      dist = dist.replaceFirst('%t', _import);
      // output the generated template to the specified folder
      new File('$distDir/$name.dart').writeAsStringSync(dist);
    } else {
      // json file directories recursively
      if (FileSystemEntity.isDirectorySync(f.path)) {
        final dirs = f.path.split(SRC);
        jtm(f.path, '$distDir${dirs[1]}');
      }
    }
  });
}

/// CamelName
/// the parameter `big` is bool, whether the first letter capitalized
String changeToCamelCase(String word, bool big) {
  if (word.contains('_')) {
    String result = '';
    List<String> words = word.split('_');
    for (var value in words) {
      result += (value[0].toUpperCase() + value.substring(1).toLowerCase());
    }
    return big ? result : (result[0].toLowerCase() + result.substring(1));
  } else {
    return big
      ? word[0].toUpperCase() + word.substring(1)
      : word[0].toLowerCase() + word.substring(1);
  }
}

String changeFirstChar(String str, [bool upper = true]) => (
  (upper ? str[0].toUpperCase() : str[0].toLowerCase()) + str.substring(1)
);

/// convert JSON type to dart type
String getType(v, Set<String> set, String current) {
  current = current.toLowerCase();
  if (v is bool) {
    return 'bool';
  } else if (v is num) {
    return 'num';
  } else if (v is Map) {
    return 'Map<String, dynamic>';
  } else if (v is List) {
    return 'List';
  } else if (v is String) {
    // DateTime type
    try {
      DateTime dateTime = DateTime.parse(v);
      if (dateTime != null) {
        return 'DateTime';
      }
    } catch (e) {}

    // handling special signs
    if (v.startsWith('$TAG[]')) {
      var className = changeFirstChar(v.substring(3), false);
      if (className.toLowerCase() != current) {
        set.add('import "$className.dart"');
      }
      return 'List<${changeToCamelCase(className, true)}>';
    } else if (v.startsWith(TAG)) {
      var fileName = changeFirstChar(v.substring(1), false);
      if (fileName.toLowerCase() != current) {
        set.add('import "$fileName.dart"');
      }
      return changeToCamelCase(fileName, true);
    }
    return 'String';
  } else {
    return 'String';
  }
}

/// replace template placeholder
String format(String fmt, List<Object> params) {
  int matchIndex = 0;
  String replace(Match m) {
    if (matchIndex < params.length) {
      switch (m[0]) {
        case '%s':
          return params[matchIndex++].toString();
      }
    } else {
      throw new Exception('Missing parameter for string format');
    }
    throw new Exception('Invalid format string: ${m[0].toString()}');
  }
  return fmt.replaceAllMapped('%s', replace);
}

void main() {
  jtm(SRC, DIST);
}