def peep_first
  visit '/peeps/new'
  fill_in 'message', with: "I am posting my first peep"
  click_button 'Post peep'
end

def peep_second
  visit '/peeps/new'
  fill_in 'message', with: "This is my second peep"
  click_button 'Post peep'
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'lan@example.com'
  fill_in :username, with: 'Lan'
  fill_in :password, with: 's3cr3t'
  click_button 'Sign up'
end
