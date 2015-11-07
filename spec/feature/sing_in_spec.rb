feature 'User sign in' do

  let(:user) do
    User.create(email: 'mattia@example.com',
                password: 'mattia',
                password_confirmation: 'mattia')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.name}"
  end
  def sign_in(email:, password:)
    visit '/user/login'
    fill_in 'email', with: email
    fill_in :password, with: password
    click_button 'sing in'
  end

end
