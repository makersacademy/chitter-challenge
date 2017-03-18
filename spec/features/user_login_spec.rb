# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Sign in:' do
  scenario 'User can sign into the system' do
    sign_up
    sign_in
    expect(page).to have_content 'Welcome, test'
  end

  scenario 'Email address is incorrect' do
    sign_up
    sign_in(email: 'wrongemail@email.com')
    expect(page).to have_content 'The email or password is incorrect'
  end

  scenario 'Password is incorrect' do
    sign_up
    sign_in(password: 'wrong password')
    expect(page).to have_content 'The email or password is incorrect'
  end
end
