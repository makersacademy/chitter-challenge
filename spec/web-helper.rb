def sign_up
  visit '/sign_up'
  fill_in 'name', with: "Maker Star"
  fill_in 'email', with: "maker@gmail.com"
  fill_in 'username', with: "maker"
  fill_in 'password', with: "12345"
  click_button 'Sign up'
end

def wrong_email_sign_up
  visit '/sign_up'
  fill_in 'name', with: "Maker Star"
  fill_in 'email', with: "ma"
  fill_in 'username', with: "maker"
  fill_in 'password', with: "12345"
  click_button 'Sign up'
end
