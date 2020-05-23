import 'dart:convert';

class Utils {
  // Encodes a message in the format that the elixir server expects
  String encodeMessageJSON(message) {
    return jsonEncode({
      'data': {
        'message': message
      }
    });
  }
}