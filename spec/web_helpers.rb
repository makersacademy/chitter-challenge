
def sign_up(email: 'test@test.org.uk', password: 'passyword', password_confirm: 'passyword', username: 'tester', first_name: 'Tester', last_name: 'MacTesterford')
  visit '/sign_up'
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirm', with: password_confirm
  fill_in 'username', with: username
  fill_in 'first_name', with: first_name
  fill_in 'last_name', with: last_name
  click_button 'Sign up!'
end

def sign_in(email: 'test@test.org.uk', password: 'passyword')
  visit '/sign_in'
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Sign in!'
end

def post_peep(peep: "my test peep",tags: "")
  fill_in "peep", with: peep
  fill_in "tags", with: tags
  click_button "Peep!"
end
