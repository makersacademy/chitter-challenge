# As a user
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'User Log-In' do
  let(:user) do
    User.create(name: 'Joe Bloggs',
                username: 'joeb',
                email: 'joe.bloggs@gmail.com',
                password: 'jo3ble0bl3',
                password_confirmation: 'jo3ble0bl3')
  end

  scenario 'with valid info, is welcomed and redirected to peeps page' do
    sign_in(username: user.username, password: user.password)
    expect(current_path).to eq('/peeps')
    expect(page).to have_content "Welcome, #{user.name}"
  end
end
