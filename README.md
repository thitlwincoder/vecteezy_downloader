# Vecteezy Downloader


[![pub package](https://img.shields.io/pub/v/vecteezy_downloader.svg?logo=dart&logoColor=00b9fc)](https://pub.dev/packages/vecteezy_downloader)
[![Last Commits](https://img.shields.io/github/last-commit/thitlwincoder/vecteezy_downloader?logo=git&logoColor=white)](https://github.com/thitlwincoder/vecteezy_downloader/commits/main)
[![GitHub repo size](https://img.shields.io/github/repo-size/thitlwincoder/vecteezy_downloader)](https://github.com/thitlwincoder/vecteezy_downloader)
[![License](https://img.shields.io/github/license/thitlwincoder/vecteezy_downloader?logo=open-source-initiative&logoColor=green)](https://github.com/thitlwincoder/vecteezy_downloader/blob/master/LICENSE)
<br>
[![Uploaded By](https://img.shields.io/badge/uploaded%20by-thitlwincoder-blue)](https://github.com/thitlwincoder)


Vecteezy Downloader is a Dart library that allows you to download images from Vecteezy with specified quality. It provides functionality to fetch image URLs and download URLs from Vecteezy pages.


## Features

- Fetch image URLs with their quality from a Vecteezy page.
- Retrieve the download URL for an image from a Vecteezy page.


## Usage

Add a dependency in your pubspec.yaml:


```yaml
dart pub add vecteezy_downloader
# or
flutter pub add vecteezy_downloader
```

In your library add the following import:

```dart
import 'package:vecteezy_downloader/vecteezy_downloader.dart';
```

### Fetch Image URLs

To fetch image URLs with their quality from a Vecteezy page, use the `getImages` method:
```dart
void main() async {
    final downloader = VecteezyDownloader();
    final images = await downloader.getImages('url');

    for (final image in images) {
        print('URL: ${image.url}, Quality: ${image.quality}');
    }
}
```

### Retrieve Download URL

To retrieve the download URL for an image from a Vecteezy page, use the `getDownloadUrl` method:

```dart
void main() async {
    final downloader = VecteezyDownloader();
    final downloadUrl = await downloader.getDownloadUrl('url');

    if (downloadUrl != null) {
        print('Download URL: $downloadUrl');
    } else {
        print('Failed to retrieve download URL.');
    }
}
```


## Contribution
Feel free to file an [issue](https://github.com/thitlwincoder/vecteezy_downloader/issues/new) if you find a problem or make pull requests.

All contributions are welcome :)