feature 'User Log In' do

  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to log in to Chitter

  let(:user) do
    User.create(name:                   'Mr Example',
                username:               '3xampl3',
                email:                  'example@example.com',
                password:               'qwerty',
                password_confirmation:  'qwerty')
  end

  scenario 'with correct credentials' do
    log_in(username: user.username, password: user.password)
    # expect(current_path).to eq('/peeps/index')
    expect(page).to have_content('Welcome to Chitter, Mr Example')
  end
end
