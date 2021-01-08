class ProjectList {
  int code;
  String msg;
  var msg4Record;
  List<Data> data;
  var retType;
  bool success;

  ProjectList(
      {this.code,
        this.msg,
        this.msg4Record,
        this.data,
        this.retType,
        this.success});

  ProjectList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    msg4Record = json['msg4Record'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    retType = json['retType'];
    success = json['success'];
  }
}

class Data {
  String title;
  String key;
  var author;
  bool isLeaf;
  var icon;
  var logo;
  var href;
  String desc;
  var operName;
  var operType;
  var apiType;
  var template;
  var permissionMode;
  List<Children> children;
  String admins;
  OriginNode originNode;

  Data(
      {this.title,
        this.key,
        this.author,
        this.isLeaf,
        this.icon,
        this.logo,
        this.href,
        this.desc,
        this.operName,
        this.operType,
        this.apiType,
        this.template,
        this.permissionMode,
        this.children,
        this.admins,
        this.originNode});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    key = json['key'];
    author = json['author'];
    isLeaf = json['isLeaf'];
    icon = json['icon'];
    logo = json['logo'];
    href = json['href'];
    desc = json['desc'];
    operName = json['operName'];
    operType = json['operType'];
    apiType = json['apiType'];
    template = json['template'];
    permissionMode = json['permissionMode'];
    if (json['children'] != null) {
      children = new List<Children>();
      json['children'].forEach((v) {
        children.add(new Children.fromJson(v));
      });
    }
    admins = json['admins'];
    originNode = json['originNode'] != null
        ? new OriginNode.fromJson(json['originNode'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['key'] = this.key;
    data['author'] = this.author;
    data['isLeaf'] = this.isLeaf;
    data['icon'] = this.icon;
    data['logo'] = this.logo;
    data['href'] = this.href;
    data['desc'] = this.desc;
    data['operName'] = this.operName;
    data['operType'] = this.operType;
    data['apiType'] = this.apiType;
    data['template'] = this.template;
    data['permissionMode'] = this.permissionMode;
    if (this.children != null) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
    data['admins'] = this.admins;
    if (this.originNode != null) {
      data['originNode'] = this.originNode.toJson();
    }
    return data;
  }
}

class Children {
  String title;
  String key;
  var author;
  bool isLeaf;
  var icon;
  var logo;
  var href;
  String desc;
  var operName;
  var operType;
  var apiType;
  var template;
  var permissionMode;
  List<Children> children;
  String admins;
  OriginNode originNode;

  Children(
      {this.title,
        this.key,
        this.author,
        this.isLeaf,
        this.icon,
        this.logo,
        this.href,
        this.desc,
        this.operName,
        this.operType,
        this.apiType,
        this.template,
        this.permissionMode,
        this.children,
        this.admins,
        this.originNode});

  Children.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    key = json['key'];
    author = json['author'];
    isLeaf = json['isLeaf'];
    icon = json['icon'];
    logo = json['logo'];
    href = json['href'];
    desc = json['desc'];
    operName = json['operName'];
    operType = json['operType'];
    apiType = json['apiType'];
    template = json['template'];
    permissionMode = json['permissionMode'];
    if (json['children'] != null) {
      children = new List<Children>();
      json['children'].forEach((v) {
        children.add(new Children.fromJson(v));
      });
    }
    admins = json['admins'];
    originNode = json['originNode'] != null
        ? new OriginNode.fromJson(json['originNode'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['key'] = this.key;
    data['author'] = this.author;
    data['isLeaf'] = this.isLeaf;
    data['icon'] = this.icon;
    data['logo'] = this.logo;
    data['href'] = this.href;
    data['desc'] = this.desc;
    data['operName'] = this.operName;
    data['operType'] = this.operType;
    data['apiType'] = this.apiType;
    data['template'] = this.template;
    data['permissionMode'] = this.permissionMode;
    if (this.children != null) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
    data['admins'] = this.admins;
    if (this.originNode != null) {
      data['originNode'] = this.originNode.toJson();
    }
    return data;
  }
}

class OriginNode {
  int id;
  String name;
  var customInfo;
  var provinceId;
  var cityId;
  var areaId;
  var address;
  String location;
  String createUserId;
  String createUserName;
  int createTime;
  var fatherProjectId;
  bool enable;
  var secretKey;
  String type;
  var image;
  var permissionMode;
  var template;
  var projectCode;

  OriginNode(
      {this.id,
        this.name,
        this.customInfo,
        this.provinceId,
        this.cityId,
        this.areaId,
        this.address,
        this.location,
        this.createUserId,
        this.createUserName,
        this.createTime,
        this.fatherProjectId,
        this.enable,
        this.secretKey,
        this.type,
        this.image,
        this.permissionMode,
        this.template,
        this.projectCode});

  OriginNode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    customInfo = json['customInfo'];
    provinceId = json['provinceId'];
    cityId = json['cityId'];
    areaId = json['areaId'];
    address = json['address'];
    location = json['location'];
    createUserId = json['createUserId'];
    createUserName = json['createUserName'];
    createTime = json['createTime'];
    fatherProjectId = json['fatherProjectId'];
    enable = json['enable'];
    secretKey = json['secretKey'];
    type = json['type'];
    image = json['image'];
    permissionMode = json['permissionMode'];
    template = json['template'];
    projectCode = json['projectCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['customInfo'] = this.customInfo;
    data['provinceId'] = this.provinceId;
    data['cityId'] = this.cityId;
    data['areaId'] = this.areaId;
    data['address'] = this.address;
    data['location'] = this.location;
    data['createUserId'] = this.createUserId;
    data['createUserName'] = this.createUserName;
    data['createTime'] = this.createTime;
    data['fatherProjectId'] = this.fatherProjectId;
    data['enable'] = this.enable;
    data['secretKey'] = this.secretKey;
    data['type'] = this.type;
    data['image'] = this.image;
    data['permissionMode'] = this.permissionMode;
    data['template'] = this.template;
    data['projectCode'] = this.projectCode;
    return data;
  }
}
