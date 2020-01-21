//It validates different input fields

class Validators {
  String validateName(String value) {
    if (value.isEmpty) return "Name is required";
    String trimmedUserName = value.trim();
    final RegExp nameExp = new RegExp(r'^[A-za-z]+ {0,1}[A-za-z]*$');
    final RegExp spacesAtStart = new RegExp(r'( )');

    if (!nameExp.hasMatch(trimmedUserName)) {
      return "Please enter valid Name";
    }
    if (spacesAtStart.hasMatch(value[0])) {
      return "This must not contain any spaces at start.";
    }
    return null;
  }

  String validateEmail(String value) {
    if (value.isEmpty) return "Email is required";
    String trimmedEmail = value.trim();
    final RegExp nameExp = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\“]+(\.[^<>()[\]\\.,;:\s@\“]+)*)|(\“.+\“))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    final RegExp onlySpaces = new RegExp(r'\s');

    if (onlySpaces.hasMatch(trimmedEmail))
      return "Email must not contain any spaces";
    if (!nameExp.hasMatch(trimmedEmail)) return "Invalid email address.";
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) return "Please choose a password";
    String trimmedPassword = value.trim();
    if (trimmedPassword.length < 6)
      return "Password must be atleast 6 characters long.";
    if (trimmedPassword.length > 20)
      return "Password must be atmost 20 characters long.";
    return null;
  }

  String validateMobileNumber(String value) {
    RegExp phoneNumberExp = new RegExp(r'^\+[1-9][0-9]{8,13}$',
        caseSensitive: false, multiLine: false);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!phoneNumberExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String validateDropDowns(int value) {
    if (value == null)
      return "Please choose a value";
    else
      return null;
  }

  String validateIsNotNull(String value) {
    if (value.isEmpty)
      return "field cannot be empty";
    else
      return null;
  }
}
