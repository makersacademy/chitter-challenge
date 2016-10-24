feature 'User sign in' do

  let!(:user) do
    User.create(email: 'bob@bob.com',
                password: 'bob123',
                password_confirmation: 'bob123')
  end

  scenario 'with the correct sign in information' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end


  scenario 'does not authenticate when given an incorrect password' do
  expect(User.authenticate(user.email, 'idiot_password')).to be_nil
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

end
