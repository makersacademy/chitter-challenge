def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'kavita@example.com'
  fill_in :password, with: 'makers'
  fill_in :name, with: 'Kavita'
  fill_in :username, with: 'kkavita92'
  click_button 'Sign Up'
end

def post_new_peep
  visit('/posts/new')
  fill_in('new_peep', :with => 'Hello world!')
  click_button('PEEP')
end
