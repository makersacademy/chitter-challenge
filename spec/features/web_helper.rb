def create_peep
  visit '/peeps/new'
  expect(page.status_code).to eq(200)
  fill_in 'message', with: 'Setting up Chitter. This is my first peep.'
  click_button 'Post'
end

def sign_up(name: 'Zoe Hopkins',
            username: 'diaryofdiscoveries',
            email: 'zoe@example.com',
            password: 'orange!',
            password_confirmation: 'orange!')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name,     with: name
  fill_in :username, with: username
  fill_in :email,    with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
