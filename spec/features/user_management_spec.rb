feature 'New user sign up' do

  scenario 'I can sign up as a new user' do
    user = build :user
    expect{ sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome to Chitter, MickTheMiller"
  end

  scenario 'password and confirmation must match' do
    user = build(:user, password_confirmation: 'wrong')
    expect{ sign_up(user) }.not_to change(User, :count)
    expect(page).to have_content "Password and confirmation password don't match"
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