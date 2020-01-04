// @author: lencx
// @create_at: Jan 04, 2020

class Validate {
  String notEmpty(String val, String errorText) {
    return val.trim().isNotEmpty ? null : errorText;
  }
}