def new_user(name="Guy", handle='guy', email='guy@mail.com')
  user = User.create(name: name, handle: "@" + handle, email: email)
  UserPassword.set(user, "password")
end
