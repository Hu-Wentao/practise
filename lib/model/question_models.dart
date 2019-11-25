/// 判断题 数据集
class JudgeQueSet {
  String type;
  List<JudgeQues> ques;

  JudgeQueSet({this.type, this.ques});

  JudgeQueSet.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['ques'] != null) {
      ques = new List<JudgeQues>();
      json['ques'].forEach((v) {
        ques.add(new JudgeQues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.ques != null) {
      data['ques'] = this.ques.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// 单选题 数据集
class SingleSelectQueSet {
  String type;
  List<SelectQues> ques;

  SingleSelectQueSet({this.type, this.ques});

  SingleSelectQueSet.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['ques'] != null) {
      ques = new List<SelectQues>();
      json['ques'].forEach((v) {
        ques.add(new SelectQues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.ques != null) {
      data['ques'] = this.ques.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// 多选题 数据集
class MultiSelectQueSet {
  String type;
  List<SelectQues> ques;

  MultiSelectQueSet({this.type, this.ques});

  MultiSelectQueSet.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['ques'] != null) {
      ques = new List<SelectQues>();
      json['ques'].forEach((v) {
        ques.add(new SelectQues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.ques != null) {
      data['ques'] = this.ques.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

///
/// 题目类
///
///
abstract class Ques {
  String index;

  Ques({this.index, this.topic, this.type});

  String topic;
  QuesType type;
}

enum QuesType { judge, single_select, multi_select }

///
/// 判断题
///
class JudgeQues extends Ques {
  bool ans;

  JudgeQues({String index, String topic, this.ans})
      : super(index: index, topic: topic, type: QuesType.judge);

  JudgeQues.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    topic = json['topic'];
    ans = json['ans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['topic'] = this.topic;
    data['ans'] = this.ans;
    return data;
  }
}

///
/// 选择题
///
class SelectQues extends Ques {
  Options options;
  List<String> ans;

  SelectQues({index, topic, this.options, this.ans})
      : super(
            index: index,
            topic: topic,
            type: ans.length == 1
                ? QuesType.single_select
                : QuesType.multi_select);

  SelectQues.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    topic = json['topic'];
    options =
        json['options'] != null ? new Options.fromJson(json['options']) : null;
    ans = json['ans'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['topic'] = this.topic;
    if (this.options != null) {
      data['options'] = this.options.toJson();
    }
    data['ans'] = this.ans;
    return data;
  }
}

class Options {
  String a;
  String b;
  String c;
  String d;

  Options({this.a, this.b, this.c, this.d});

  Options.fromJson(Map<String, dynamic> json) {
    a = json['a'];
    b = json['b'];
    c = json['c'];
    d = json['d'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['a'] = this.a;
    data['b'] = this.b;
    data['c'] = this.c;
    data['d'] = this.d;
    return data;
  }
}
