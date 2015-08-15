feature 'user sign in' do

  scenario 'user can see sign in at home page' do
    visit '/'
    expect(page).to have_button 'Sign in'
  end

  scenario 'user can sign in with username' do
    user = create :user
    visit '/session/new'
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content "Hello #{user.email}"
  end

  scenario 'cannot sign in with wrong password' do
    user = create :user
    visit '/session/new'
    fill_in 'username', with: user.username
    fill_in 'password', with: user.username
    click_button 'Sign in'
    expect(page).to have_content 'Password or username is incorrect'
  end
end
