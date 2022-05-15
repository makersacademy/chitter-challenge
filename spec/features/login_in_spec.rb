feature "Log in" do
  scenario 'user can log in to use chitter' do
    sign_up
    
    visit('/login')
    fill_in :user_name, with: "amfibiya17"
    fill_in :password, with: "12345678"
    expect(page).to have_button 'Please login'
    click_button 'Please login'
  end

  scenario "user can't login" do
    sign_up
    
    visit('/login')
    fill_in :user_name, with: "amfibiya7"
    fill_in :password, with: "1234568"
    click_button 'Please login'

    expect(page).to have_content "Wrong login or password"
  end
end