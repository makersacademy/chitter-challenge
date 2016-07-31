# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Signing in to a user account' do

  let(:user) do
    User.create(name: 'luke',
                username: 'luke',
                email: 'luke@luke.com',
                password: 'abc123',
                password_confirmation: 'abc123')
  end

  scenario 'a user can sign in to their account with the correct details' do
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content "Welcome #{user.name}!"
  end

  scenario 'a user can not sign in to an account with the incorrect details' do
    expect(User.authenticate(user.username, 'this_is_not_my_password')).to be_nil
  end

end
