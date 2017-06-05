feature 'allow user to signup' do
  scenario 'user can signup with an email and a password' do
    visit('/signup')
    fill_in('email', with: 'mail@mail.com')
    fill_in('password', with: 'password')
    click_button('Sign up')

    expect(page).to have_content('mail@mail.com')

  end
end

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
