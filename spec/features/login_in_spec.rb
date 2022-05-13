feature "Log in" do
  scenario 'user can log in to use chitter' do

    sign_up
    
    visit('/login')
    fill_in :user_name, with: "amfibiya17"
    fill_in :password, with: "12345678"
    expect(page).to have_button 'Please login'
    click_button 'Please login'
  end
end