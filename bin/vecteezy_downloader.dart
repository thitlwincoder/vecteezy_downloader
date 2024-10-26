import 'dart:convert';
import 'dart:developer';

import 'package:vecteezy_downloader/vecteezy_downloader.dart';

Future<void> main() async {
  const url =
      'https://www.vecteezy.com/vector-art/677402-neon-fluid-background-with-geometric-shapes';

  final vecteezy = VecteezyDownloader();

  final links = await vecteezy.getImages(url);
  log(jsonEncode(links.map((e) => e.toMap()).toList()));

  final downloadUrl = await vecteezy.getDownloadUrl(url);
  log('downloadUrl: $downloadUrl');
}
