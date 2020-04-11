feature 'Login Page Loads' do

  scenario 'Page loads with content' do
    visit '/login' 
    fill_in 'username', with: "Bruce"
    fill_in 'password', with: "password"
    click_button 'log_in'
    expect(page).to have_content "Peep Central"
    visit '/home' 
    expect(page).to have_button 'logout'
    expect(page).not_to have_button 'log_in'
    click_button 'log_in'
    expect(page).not_to have_button 'logout'
    expect(page).to have_button 'log_in'
  end

end