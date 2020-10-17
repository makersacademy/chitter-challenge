def formatted_date(string)
  Time.strptime(string, '%Y-%m-%d %H:%M:%S.%N%z').strftime('%d-%m-%Y %H:%M')
end

def sign_up(username:, name:, email:, password:)
  click_button 'Sign Up'
  fill_in 'username', with: username
  fill_in 'name', with: name
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Sign Up'
end
