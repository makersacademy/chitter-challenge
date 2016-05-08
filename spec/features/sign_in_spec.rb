feature 'Sign in' do
  let(:user) do
    User.create(name: 'Example',
                username: 'example1',
                email: 'user@example.com',
                password: 'secret',
                password_confirmation: 'secret')
  end

  def sign_in(email:, password:)
    visit '/'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  scenario 'correctly sign in' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.name}"
  end
end