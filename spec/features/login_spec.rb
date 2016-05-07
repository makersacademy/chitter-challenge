require './app/models/user'

feature 'User signs in' do

  let(:user) do
    User.create(name: 'Bob',
                username: 'bobross',
                email: 'bob@ross.com',
                password: 'bobross',
                password_confirmation: 'bobross')
  end

  scenario 'with correct credentials' do
    sign_in(username: user.username,   password: user.password)
    expect(page).to have_content "Hi, #{user.name}!"
  end

end
