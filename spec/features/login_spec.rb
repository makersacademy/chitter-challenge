feature 'Login' do

  scenario 'As a registered user I can login' do
    User.create(username: 'Tester', email: 'test@mail.com', password: 'password')
    visit '/login'
    fill_in 'username', with: 'Tester'
    fill_in 'password', with: 'password'
    click_button 'Login'
    expect(page).to have_content 'Logged as: Tester'
  end

  scenario "I can't login with a wrong email or password" do
    User.create(username: 'Tester', email: 'test@mail.com', password: 'password')
    visit '/login'
    fill_in 'username', with: 'Tester'
    fill_in 'password', with: 'passwoord'
    click_button 'Login'
    expect(page).to have_content 'The username or the password is incorrect'
 
  end
end
