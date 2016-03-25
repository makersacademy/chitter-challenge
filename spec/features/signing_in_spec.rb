feature 'Signing in' do
  scenario 'With correct credentials' do
    user = create(:user)
    sign_in(user)
    expect(page).to have_content "Welcome to Chitter, #{user.name}!"
  end

  scenario 'With incorrect credentials' do
    user = create(:user)
    visit '/sessions/new'
    fill_in :email, with: user.email
    fill_in :password, with: 'wrong password'
    click_button 'Log in'
    expect(page).to have_content 'The email or password is incorrect'
  end
end
