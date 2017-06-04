feature 'User Sign Up' do
  scenario 'user can sign up with a username, name, email address and password' do
    visit('/sign_up')
    fill_in 'username', with: 'wemmm'
    fill_in 'name', with: 'Jenny'
    fill_in 'email', with: 'jenny@wem.com'
    fill_in 'password', with: '1234'
    click_button('Submit')
    expect(page).to have_content "Hi Jenny! Welcome to Chitter!"
    expect(User.count).to eq 1
  end
end
