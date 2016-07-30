# User Story 2:
# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Sign in' do
  let!(:user) do
    User.create(username: 'Jonny',
                email: 'jonny@email.com',
                password: 'somepassword',
                password_confirmation: 'somepassword')
  end

  scenario 'I can sign in with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome back to Chitter, #{user.username}"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
