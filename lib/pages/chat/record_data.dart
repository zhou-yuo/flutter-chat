import 'dart:math';

class RecordListMockData {
  static List<Map<String, Object>> list(int size) {
    return List<Map<String, Object>>.generate(size, (index) {
      // List 的 generate 方法来构建数组，该方法用于构建指定大小的数组， 可以通过带index输入的回调函数构建对应 index 下标的数组元素。
      return {
        "text": "chat text",
        "isSender": index.isOdd,
        "sent": true,
        "seen": index <= 6
      };
    });
  }
}
