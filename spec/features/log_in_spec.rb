feature 'Login Page Loads' do

  scenario 'Page loads with content' do
    visit '/login' 
    fill_in 'username', with: "Bruce"
    fill_in 'password', with: "password"
    click_button 'log_in'
    expect(page).to have_content "Peeper: Bill"
  end

end