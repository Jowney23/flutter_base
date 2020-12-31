/// user : "$user"
/// token : ""
/// theme : 5678
/// cache : "$cacheConfig"
/// lastLogin : ""
/// locale : ""

class Profile {
  String _user;
  String _token;
  int _theme;
  String _cache;
  String _lastLogin;
  String _locale;

  String get user => _user;
  String get token => _token;
  int get theme => _theme;
  String get cache => _cache;
  String get lastLogin => _lastLogin;
  String get locale => _locale;

  Profile({
      String user, 
      String token, 
      int theme, 
      String cache, 
      String lastLogin, 
      String locale}){
    _user = user;
    _token = token;
    _theme = theme;
    _cache = cache;
    _lastLogin = lastLogin;
    _locale = locale;
}

  Profile.fromJson(dynamic json) {
    _user = json["user"];
    _token = json["token"];
    _theme = json["theme"];
    _cache = json["cache"];
    _lastLogin = json["lastLogin"];
    _locale = json["locale"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["user"] = _user;
    map["token"] = _token;
    map["theme"] = _theme;
    map["cache"] = _cache;
    map["lastLogin"] = _lastLogin;
    map["locale"] = _locale;
    return map;
  }

}