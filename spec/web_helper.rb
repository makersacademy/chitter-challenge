def create_peep
  visit 'peeps/new'
  expect(page.status_code).to eq(200)
  fill_in 'title', with: 'Random title'
  fill_in 'message', with: 'Random message'
  click_button 'Create peep'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
