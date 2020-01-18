feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in 'name', with: 'Umberto Valente'
    fill_in 'username', with: 'uValente'
    fill_in 'email', with: 'mock@gmail.com'
    fill_in 'password', with: 'psw123'
    click_button 'Register'
    expect(page).to have_content 'Welcome uValente!'
  end
end