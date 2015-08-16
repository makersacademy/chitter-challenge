feature 'User signs in' do

  let(:user) do
    User.create(username: 'Teeohbee',
                password: '12345678',
                email: 'toby@example.com',
                password_confirmation: '12345678')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'
  end
end
