def fill_in_sign_up_form(params)
  name      =params[:name]
  email     =params[:email]
  password  =params[:password]
  username  =params[:username]

  fill_in('email',    with: email)
  fill_in('username', with: username)
  fill_in('password', with: password)
  fill_in('name',     with: name)

end
