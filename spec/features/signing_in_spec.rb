feature 'Signing in' do

  let!(:user) do
    User.create(name: "Will Jones",
                            email: "wjones@gmail.com",
                            username: "wjones",
                            password: 'pizza123',
                            password_confirmation: 'pizza123')
  end

  def sign_in(username: user.username, password: user.password)
    visit '/session/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button "Sign in"
  end

  scenario 'User can sign in with correct credentials' do
    sign_in
    expect(page).to have_content "Welcome #{user.username}"
  end



end
