def sign_in
  User.create(name: 'example', email: 'example@domain.com',
              password: 'secret', password_confirmation: 'secret',
              handle: 'handle')
  visit('/sessions/new')
  fill_in('email', with: 'example@domain.com')
  fill_in('password', with: 'secret')
  click_button('Log in')
end

feature 'Feature: logging in' do
  scenario 'user has valid credentials' do
    sign_in
    expect(page).to have_content 'Welcome, example'
  end
end
