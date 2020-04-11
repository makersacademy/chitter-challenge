feature 'log in Page Loads' do

  scenario 'Page loads with content' do
    visit '/log_in' 
    fill_in 'user_name', with: "Bruce"
    fill_in 'password', with: "password"
    click_button 'log_in'
    expect(page).to have_content "Peeper: Bill"
  end

end