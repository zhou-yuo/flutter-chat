class ListMockData {
  static List<Map<String, Object>> list(int page, int size) {
    return List<Map<String, Object>>.generate(size, (index) {
      final realIndex = index + (page * size) + 1;
      // List 的 generate 方法来构建数组，该方法用于构建指定大小的数组， 可以通过带index输入的回调函数构建对应 index 下标的数组元素。
      return {
        'nickname': 'Nickname-$realIndex',
        'avatar': 'https://picsum.photos/100/100',
        'message': 'message-$realIndex',
      };
    });
  }
}
