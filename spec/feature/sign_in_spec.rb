# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'User sign in' do

  let(:user) do
    User.create(email: 'hello@hello.com',
                password: 'abcd')
  end

  scenario 'user signs in with correct email and password' do
    sign_in(email: 'hello@hello.com', password: 'abcd', password_confirmation: 'abcd')
    expect(page).to have_content "Welcome, #{user.name}"

  end

  def sign_in(email:, password:, password_confirmation:)
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button('Sign in')
  end

end
