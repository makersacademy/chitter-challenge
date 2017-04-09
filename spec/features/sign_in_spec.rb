feature 'User sign in' do

  let!(:user) do
    User.create(name: 'Trish', email: 'Trish@person.com',
                username: 'Wizard_Trish', password: 'password',
                password_confirmation: 'password')
  end

  scenario 'with correct credentials' do
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content("Welcome, #{user.username}")
  end

  def sign_in(username: 'Wizard_Trish', password: 'password')
    visit '/sessions/new'
    fill_in(:username, with: username)
    fill_in(:password, with: password)
    click_button('Sign in')
  end
end
