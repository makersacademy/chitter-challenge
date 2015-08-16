feature 'User sign in' do

  let(:user) do
    User.create(username: 'Teeohbee',
                password: '12345678',
                email: 'toby@example.com',
                password_confirmation: '12345678')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  def sign_in
    visit '/sessions/new'
end
