feature 'sign_in' do
  scenario 'user can sign in with username and password' do
    User.create(name: 'Erin', username: 'ES94', email: 'test@test.com', password: 'password123')

    visit '/sessions/signin'
    fill_in 'username', with: 'ES94'
    fill_in 'password', with: 'password123'
    click_button 'log in'

    expect(page).to have_content "Welcome to Chitter Erin"
  end

  scenario "user can't sign in if they don't exist" do
    visit '/sessions/signin'
    fill_in 'username', with: 'Test'
    fill_in 'password', with: 'test'
    click_button 'log in'

    expect(page).to_not have_content "Welcome to Chitter Test"
    expect(page).to have_content "Wrong username/password - please check"
  end
end
