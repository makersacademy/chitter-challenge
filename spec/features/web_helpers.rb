def sign_up
  visit('/users/new')
  fill_in('name', with: 'Example Name')
  fill_in('username', with: 'exampleusername')
  fill_in('email', with: 'example@example.com')
  fill_in('password', with: 'examplepassword')
  click_button('Submit')
end

def post_peep
  visit('/peeps/new')
  fill_in('peep', with: 'Here is a test peep')
  click_button('Submit')
end
