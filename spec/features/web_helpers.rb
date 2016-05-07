def sign_up(params)
  visit("/users/new")
  fill_in :name, with: params[:name]
  fill_in :username, with: params[:username]
  fill_in :email, with: params[:email]
  fill_in :password, with: params[:password]
  click_button "Sign up"
end
