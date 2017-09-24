def create_peep
  visit 'peeps/new'
  expect(page.status_code).to eq(200)
  fill_in 'title', with: 'Random title'
  fill_in 'message', with: 'Random message'
  click_button 'Create peep'
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name, with: 'James Hughes'
  fill_in :email, with: 'hugjimbo77@gmail.com'
  fill_in :username, with: 'JimboOnFire'
  fill_in :password, with: 'secretpassword'
  click_button('Sign Up')
end
