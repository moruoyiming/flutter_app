import 'dart:js';

main() {
  context.callMethod('alert', ['Hello from Dart!']);

  var object = JsObject(context['Object']);
  object['greeting'] = 'Hello';
  object['greet'] = (name) => "${object['greeting']} $name";
  var message = object.callMethod('greet', ['JavaScript']);
  context['console'].callMethod('log', [message]);


  var jsMap = JsObject.jsify({'a': 1, 'b': 2});
  var jsArray = JsObject.jsify([1, 2, 3]);

}
