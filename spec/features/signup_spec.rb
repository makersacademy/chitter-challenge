feature 'Signup Page Loads' do

  scenario 'Page loads with content' do
    visit '/signup' 
    fill_in 'name', with: "Bruce"
    fill_in 'email', with: "Bruce@Bruceiscool.com"
    fill_in 'username', with: "Bruce123"
    fill_in 'password', with: "password"
    click_button 'sign_up'
    expect(page).to have_button "log_in"
  end

end