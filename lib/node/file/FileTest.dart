import 'dart:io';
import 'dart:convert';

void main() async {
  // var config = File('config.txt');
  //
  // // Put the whole file in a single string.
  // var stringContents = await config.readAsString();
  // print('The file is ${stringContents.length} characters long.');
  //
  // // Put each line of the file into its own string.
  // var lines = await config.readAsLines();
  // print('The file is ${lines.length} lines long.');

  var config = File('config.txt');
  Stream<List<int>> inputStream = config.openRead();

  var lines = utf8.decoder.bind(inputStream).transform(const LineSplitter());
  try {
    await for (final line in lines) {
      print('Got ${line.length} characters from stream');
    }
    print('file is now closed');
  } catch (e) {
    print(e);
  }

  var dir = Directory('tmp');

  try {
    var dirList = dir.list();
    await for (final FileSystemEntity f in dirList) {
      if (f is File) {
        print('Found file ${f.path}');
      } else if (f is Directory) {
        print('Found dir ${f.path}');
      }
    }
  } catch (e) {
    print(e.toString());
  }
}
