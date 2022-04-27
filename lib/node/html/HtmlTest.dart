import 'dart:async';
import 'dart:html';

htmlMethod() {
  // Find an element by id (an-id).
  Element idElement = querySelector('#an-id')!;

// Find an element by class (a-class).
  Element classElement = querySelector('.a-class')!;

// Find all elements by tag (<div>).
  List<Element> divElements = querySelectorAll('div');

// Find all text inputs.
  List<Element> textInputElements = querySelectorAll(
    'input[type="text"]',
  );

// Find all elements with the CSS class 'class'
// inside of a <p> that is inside an element with
// the ID 'id'.
  List<Element> specialParagraphElements = querySelectorAll('#id p.class');

  // <!-- In HTML: -->
  // <p>
  // <span class="linux">Words for Linux</span>
  // <span class="macos">Words for Mac</span>
  // <span class="windows">Words for Windows</span>
  // </p>

  // In Dart:
  const osList = ['macos', 'windows', 'linux'];
  final userOs = determineUserOs();

// For each possible OS...
  for (final os in osList) {
    // Matches user OS?
    bool shouldShow = (os == userOs);

    // Find all elements with class=os. For example, if
    // os == 'windows', call querySelectorAll('.windows')
    // to find all elements with the class "windows".
    // Note that '.$os' uses string interpolation.
    for (final elem in querySelectorAll('.$os')) {
      elem.hidden = !shouldShow; // Show or hide.
    }
  }

  //Creating elements
  var elem = ParagraphElement();
  elem.text = 'Creating is easy!';

  //You can also create an element by parsing HTML text. Any child elements are also parsed and created.
  var elem2 = Element.html(
    '<p>Creating <em>is</em> easy!</p>',
  );
  document.body!.children.add(elem2);

  // setting an attribute’s value:
  elem.attributes['someAttribute'] = 'someValue';

  //To add a node as the last child of its parent, use the List add() method:
  querySelector('#inputs')!.nodes.add(elem);

  //To replace a node, use the Node replaceWith() method:
  querySelector('#status')!.replaceWith(elem);

  // To remove a node, use the Node remove() method:
  // Find a node by ID, and remove it from the DOM if it is found.
  querySelector('#expendable')?.remove();

  var elem3 = querySelector('#message')!;
  elem3.classes.add('warning');

  //You can dynamically set an element ID with the id property:
  var message = DivElement();
  message.id = 'message2';
  message.text = 'Please subscribe to the Dart mailing list.';

  var message2 = DivElement()
    ..id = 'message2'
    ..text = 'Please subscribe to the Dart mailing list.';

// Find a button by ID and add an event handler.
  querySelector('#submitInfo')!.onClick.listen((e) {
    // When the button is clicked, it runs this code.
    // submitData();
  });

  document.body!.onClick.listen((e) {
    final clickedElem = e.target;
    // ...
  });
}

determineUserOs() {}

void main() async {
  var url = '';
  String pageHtml = await HttpRequest.getString(url);
  // Do something with pageHtml...
  var jsonUri = '';
  try {
    var data = await HttpRequest.getString(jsonUri);
    // Process data...
  } catch (e) {
    // Handle exception...
  }

  HttpRequest req = await HttpRequest.request(
    url,
    method: 'HEAD',
  );
  if (req.status == 200) {
    // Successful URL access...
  }
  var encodedData = "";

  var request = HttpRequest();
  request
    ..open('POST', url)
    ..onLoadEnd.listen((e) => requestComplete(request))
    ..send(encodedData);
}

requestComplete(HttpRequest request) {}

void initWebSocket([int retrySeconds = 1]) {
  var ws = WebSocket('ws://echo.websocket.org');
  ws.send('Hello from Dart!');
  ws.onMessage.listen((MessageEvent e) {
    print('Received message: ${e.data}');
  });

  var reconnectScheduled = false;

  print('Connecting to websocket');

  void scheduleReconnect() {
    if (!reconnectScheduled) {
      Timer(Duration(seconds: retrySeconds),
          () => initWebSocket(retrySeconds * 2));
    }
    reconnectScheduled = true;
  }

  ws.onOpen.listen((e) {
    print('Connected');
    ws.send('Hello from Dart!');
  });

  ws.onClose.listen((e) {
    print('Websocket closed, retrying in $retrySeconds seconds');
    scheduleReconnect();
  });

  ws.onError.listen((e) {
    print('Error connecting to ws');
    scheduleReconnect();
  });

  ws.onMessage.listen((MessageEvent e) {
    print('Received message: ${e.data}');
  });
}
