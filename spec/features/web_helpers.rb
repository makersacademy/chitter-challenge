

def fill_in_sign_up_form(params)
  name      =params[:name]
  email     =params[:email]
  password  =params[:password]
  username  =params[:username]
  password_confirmation =params[:password_confirmation]
  visit '/users/new'

  fill_in('email',    with: email)
  fill_in('username', with: username)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  fill_in('name',     with: name)
end

def create_user(params)
  fill_in_sign_up_form(params)
  click_button 'Sign Up'
end
