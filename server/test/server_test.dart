import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:test/test.dart';
import '../bin/models/models.dart';

void main() {
  final port = '8080';
  final host = 'http://localhost:$port';
  late Process p;

  setUp(() async {
    p = await Process.start(
      'dart',
      ['run', 'bin/server.dart'],
      environment: {'PORT': port},
    );
    // Wait for server to start and print to stdout.
    await p.stdout.first;
  });

  tearDown(() => p.kill());

  group('Vinyl', () {
    test('Get vinyl', () async {
      final response = await get(Uri.parse('$host/vinyl/0'));
      expect(response.statusCode, 200);

      final body = response.body;
      final Vinyl vinyl = Vinyl.fromJson(jsonDecode(body));

      expect(
          vinyl,
          Vinyl(
            id: 0,
            album: 'Unknown',
            author: 'Unknown',
            albumYear: 0,
            plateYear: 0,
            country: 'Unknown',
            genre: ['Unknown'],
            imageFull: 'Unknown',
            imagePreview: 'Unknown',
          ));
    });
  });

  group('User', () {
    test('Add user', () async {
      final response = await post(Uri.parse('$host/user'),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: jsonEncode(User(
                  id: 0,
                  name: 'unknown',
                  email: 'unknown@gmail.com',
                  password: 'unknown')
              .toJson()));
      expect(response.statusCode, 200);
    });

    test('Get user', () async {
      final response = await get(Uri.parse('$host/user/0'));
      expect(response.statusCode, 200);

      final body = response.body;
      final User user = User.fromJson(jsonDecode(body));
      expect(
          user,
          User(
              id: 0,
              name: 'unknown',
              email: 'unknown@gmail.com',
              password: 'unknown'));
    });

    test('Delete user', () async {
      final response = await delete(Uri.parse('$host/user/0'));
      expect(response.statusCode, 200);
    });
  });

  test('404', () async {
    final response = await get(Uri.parse('$host/404foo'));
    expect(response.statusCode, 404);
  });
}
