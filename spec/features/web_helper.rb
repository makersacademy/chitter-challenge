def create_new_peep
  visit('/peeps/new')
  fill_in('new_peep', :with => 'test')
  click_button('PEEP')
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'andrewclarke982@gmail.com'
  fill_in :password, with: 'banana123'
  click_button 'Sign Up'
end
