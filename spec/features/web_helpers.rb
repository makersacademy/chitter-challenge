def sign_up
  visit '/'
  fill_in :name, with: "Harry Potter"
  fill_in :user_name, with: "Scarface"
  fill_in :email, with: "hpotter@gmail.com"
  fill_in :password, with: "Password123"
  click_button 'Sign up'
end
