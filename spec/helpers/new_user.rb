def new_user
  user = User.create(name: "Guy", handle: 'guy', email: 'guy@mail.com')
  UserPassword.set(user, "password")
end
