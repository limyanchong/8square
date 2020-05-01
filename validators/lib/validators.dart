class Validators {
  static final RegExp _emailRegExp = RegExp(
    // not same as email sign up for firebase
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static validateEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static validatePassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}
