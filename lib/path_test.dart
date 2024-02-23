import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// @author : mr.pan
/// @createTime : 2022/8/29 15:29
/// @describe : 
class FilePathUtils {

  ///
  static void getDirectory() async {
    final Directory? directory = await getExternalStorageDirectory();
    print(directory?.path);
  }

}
