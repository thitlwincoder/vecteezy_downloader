import 'package:html/parser.dart';
import 'package:requests/requests.dart';

/// [Link]
class Link {
  /// Link Constructor
  Link({required this.url, required this.quality});

  /// image url
  final String url;

  /// image quality
  final String quality;

  /// Link to map
  Map<String, dynamic> toMap() => {'url': url, 'quality': quality};
}

/// [VecteezyDownloader]
class VecteezyDownloader {
  /// get images with quality from url
  Future<List<Link>> getImages(String url) async {
    try {
      // parse uri
      final uri = Uri.tryParse(url);

      // if not uri throw exception
      if (uri == null) throw Exception('url is not uri');

      final r = await Requests.get(url);
      r.raiseForStatus();

      // parse html body
      final body = parse(r.content());

      final preload = body.querySelector('link[as="image"]');
      final imagesrcset = preload?.attributes['imagesrcset'] ?? '';

      final links = <Link>[];

      for (final e in imagesrcset.split(',')) {
        final srcset = e.trim().split(' ');
        if (srcset.length == 2) {
          final src = srcset[0];
          final size = srcset[1];
          links.add(Link(url: src, quality: size));
        }
      }

      return links;
    } catch (e) {
      return [];
    }
  }

  /// get download url
  Future<String?> getDownloadUrl(String url) async {
    try {
      // parse uri
      final uri = Uri.tryParse(url);

      // if not uri throw exception
      if (uri == null) throw Exception('url is not uri');

      var r = await Requests.get(url);
      r.raiseForStatus();

      // parse html body
      final body = parse(r.content());

      final download = body.querySelector('section.ez-resource-show');
      final attr = download?.attributes ?? {};
      final path = attr['data-download-download-path-value'];

      r = await Requests.get('https://www.vecteezy.com$path');
      r.raiseForStatus();

      return r.json()['url'] as String;
    } catch (e) {
      return null;
    }
  }
}
