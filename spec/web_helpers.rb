def sign_up
  visit '/sign-up'
  fill_in :name, with: "John Doe"
  fill_in :email, with: "me@email.com"
  fill_in :password, with: "asd123"
  fill_in :password_confirmation, with: "asd123"
  click_button 'Sign up'
end
