feature 'User sign in' do
  let!(:user) do
    User.create(email: 'an@example.com',
                name: 'MAKER',
                password: '1234',
                password_confirmation: '1234')
  end

  scenario 'with correct credentials' do
    sign_up(name: user.name, password: user.password)
    expect(page).to have_content "ONLINE: #{user.name}"
  end

  def sign_up(name:, password:)
    visit '/sessions/new'
    fill_in :name, with: name
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
