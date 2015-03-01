def sign_in user_name = 'SuperMan', password = 'TedTex'
  visit 'sessions/new'
  fill_in :user_name, :with => user_name
  fill_in :password, :with => password
  click_button "Sign in"
end
