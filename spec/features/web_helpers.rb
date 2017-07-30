def user_sign_up(user, user_name, email_address, password)
  visit '/users/new'
  fill_in :name, with: user
  fill_in :user_name, with: user_name
  fill_in :email_address, with: email_address
  fill_in :password, with: password
  click_button "Sign up"
end

def post_peep(content)
  visit '/peeps/new'
  fill_in :content, with: content
  click_button 'Peep this'
end
