String? dropdownValidation(String? string) =>
    string == "Select" ? "Select an item" : null;

String? emailValidation(String? email) {
  bool validateEmail = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email!.replaceAll(' ', ''));
  if (!validateEmail) {
    return 'Email is not valid';
  }
  return null;
}

String? passwordValidation(String? string) {
  bool validatePassword =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(string!);
  if (!validatePassword) {
    return 'Min. of 8 chars, 1 uppercase letter & 1 number';
  }

  return null;
}

String? stringValidation(String? string) =>
    string!.length < 2 ? 'Atleast 2 characters is expected' : null;
