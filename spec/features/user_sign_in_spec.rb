feature 'User sign in' do

  let!(:user) do
    user = User.create(email: 'user@example.com',
                username: 'example',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: 'secret1234')
    expect(page).to have_content "Welcome to Chitter, #{user.username}"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
