feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end
end

feature 'password_confirmation' do
scenario 'with a password that does not match' do
  expect { bad_sign_up }.not_to change(User, :count)
  expect(current_path).to eq('/users')
  expect(page).to have_content 'Password and confirmation password do not match'
end
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'alice@example.com'
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'oranges!'
  click_button 'Sign up'
end

def bad_sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'alice@example.com'
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'oranges'
  click_button 'Sign up'
end