function validateForm() {
  let password = document.getElementById('password').value;
  if(!validPassword(password)) {
    document.getElementById('password-length').innerHTML = 'Password must be at least 6 characters';
    returnToPreviousPage();
    return false;
  }
  document.forms['sign-up'].submit()
}
function validPassword(password) {
  if(password.length < 6) {
    return false;
  }
  return true;
}
