def user_sign_up(user, user_name, email_address, password, password_confirmation)
  visit '/users/new'
  fill_in :name, with: user
  fill_in :user_name, with: user_name
  fill_in :email_address, with: email_address
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button "Sign up"
end

def post_peep(content)
  visit '/peeps/new'
  fill_in :content, with: content
  click_button 'Peep this'
end
