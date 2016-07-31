require 'helpers/sessions'

feature 'User sign in' do

  let(:user) do
    User.create(full_name: "Fred Bloggs",
                  user_name: "fredb",
                  email: "fred@bloggs.com",
                  password: "ABC123",
                  password_confirmation: "ABC123")
  end

  scenario 'with correct credentials' do
    sign_in(user_name: user.user_name, password: user.password)
    expect(page).to have_content "Welcome, #{user.user_name}"
  end

  it 'does not authenticate when given an incorrect password' do
  expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
end

end
