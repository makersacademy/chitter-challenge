feature 'index page' do
<<<<<<< HEAD
  scenario 'it has a login form' do
    visit '/login'
    expect(page).to have_field "username"
    expect(page).to have_field "email"
    expect(page).to have_field "password"
    expect(page).to have_button "Register"
  end
=======
>>>>>>> assets

  scenario 'a new user can register' do
    visit '/login'
    fill_in 'username', with: 'fluffybunny82'
    fill_in 'name', with: 'Jemima Rabbit'
    fill_in 'email', with: 'bunny@hotmail.com'
    fill_in 'password', with: 'fluffer82'
    click_button 'Register'
    expect(page).to have_content 'logged in as fluffybunny82' 
  end
end