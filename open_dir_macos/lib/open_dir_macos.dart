import 'package:flutter/services.dart';
import 'package:open_dir_platform_interface/open_dir_platform_interface.dart';

const MethodChannel _channel = MethodChannel('com.flutter/open-dir-macos');

class OpenDirMacOS extends OpenDirPlatform {
  /// Registers this class as the default instance of [OpenDirPlatform].
  static void registerWith() {
    OpenDirPlatform.instance = OpenDirMacOS();
  }

  @override
  Future<bool?> openNativeDir({required String path, String? highlightedFileName}) async {
    final result = await _channel.invokeMethod<bool>('openNativeDir', {
      'path': path,
      'highlightedFileName': highlightedFileName,
    });
    return result;
  }
}
