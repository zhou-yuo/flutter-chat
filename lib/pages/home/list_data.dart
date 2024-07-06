/// 首页-动态：mock 数据
import 'dart:math';

randomGen(min, max) {
  //nextInt 方法生成一个从 0（包括）到 max（不包括）的非负随机整数
  var x = Random().nextInt(max) + min;

  //如果您不想返回整数，只需删除 floor() 方法
  return x.floor();
}

class ListMockData {
  static List<Map<String, Object>> list(int page, int size) {
    return List<Map<String, Object>>.generate(size, (index) {
      // List 的 generate 方法来构建数组，该方法用于构建指定大小的数组， 可以通过带index输入的回调函数构建对应 index 下标的数组元素。
      return {
        'title': '标题${index + (page - 1) * size + 1}：这是一个列表标题，最多两行，多处部分将会被截取',
        'imageUrl': 'https://picsum.photos/200/200',
        'viewCount': randomGen(100, 1000),
      };
    });
  }
}
