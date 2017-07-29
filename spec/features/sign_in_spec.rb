feature 'User: Sign in ' do

  let!(:user) do
    User.create(email: 'user@user.com',
                password: 'pass',
                password_confirmation: 'pass')
  end

  def sign_in(email:, password:)
    visit 'sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  scenario 'can sign into a user account' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content 'Welcome, user@user.com'
  end
end
