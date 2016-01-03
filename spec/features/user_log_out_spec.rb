feature 'User Log Out' do

  # As a Maker
  # So that I can avoid others posting messages on Chitter as me
  # I want to log out of Chitter

  let(:user) do
    User.create(name:                   'Mr Example',
                username:               '3xampl3',
                email:                  'example@example.com',
                password:               'qwerty',
                password_confirmation:  'qwerty')
  end

  xscenario 'while being signed in' do
    log_in(username: user.username, password: user.password)
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome to Chitter, Mr Example')
  end
end
