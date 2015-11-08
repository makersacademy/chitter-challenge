# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'User sign in' do

  let(:user) do
    User.create(email: 'hello@hello.com',
                password: 'abcd',
                password_confirmation: 'abcd')
  end

  it 'authenticates when given a valid email address and password' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
  end

  def sign_in(email:, password:)
    visit '/signin/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button('Sign in')
  end

end
