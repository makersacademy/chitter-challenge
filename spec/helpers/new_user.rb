def new_user
  user = User.create(name: "Guy", handle: 'guy')
  UserPassword.set(user, "password")
end
