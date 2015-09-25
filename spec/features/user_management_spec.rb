feature 'New user sign up' do

  let(:user){build :user}

  scenario 'I can sign up as a new user' do
    expect{ sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome to Chitter, MickTheMiller"
  end

  def sign_up(user)
    visit ('/')
    click_button 'Sign up'
    fill_in 'email',    with: user.email
    fill_in 'name',     with: user.name
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    fill_in 'password_confirmation', with: user.password_confirmation
    click_button 'Register'
  end

end