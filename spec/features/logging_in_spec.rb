def sign_in
  visit('/sessions/new')
  fill_in('email', with: 'example')
  fill_in('password', with: 'secret')
  click_button('Log in')
end

feature 'Feature: logging in' do
  let(:user) do 
    User.create(name: 'example', email: 'example@domain.com',
                password: 'secret', password_confirmation: 'secret',
                handle: 'handle')
  end

  scenario 'user has valid credentials' do
    sign_in
    expect(page).to have_content 'Hello, example'
  end
end
