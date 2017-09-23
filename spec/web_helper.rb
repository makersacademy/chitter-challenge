def create_peep
  visit ('/peeps/new')
  expect(page.status_code).to eq(200)
  fill_in :title, with: "title"
  fill_in :text, with: "text"
  click_button 'submit'
end

def sign_up
  visit('/users/new')
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'ben@sunderland.eu.com'
  fill_in :password, with: 'password'
  click_button 'Sign up'
end
