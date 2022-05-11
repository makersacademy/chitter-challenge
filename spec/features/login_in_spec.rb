xfeature "Log in" do
  scenario 'user can log in to use chitter' do
    visit('/signup')
    expect(page).to have_content "Chitter"
    expect(page).to have_content "Please sign up"
    fill_in :user_name, with: "amfibiya17"
    fill_in :password, with: "12345678"
    expect(page).to have_button 'Sign up'
    click_button 'Sign up'
    visit('/login')
    expect(page).to have_content "Please login"
    fill_in :user_name, with: "amfibiya17"
    fill_in :password, with: "12345678"
    expect(page).to have_button 'Login'
    click_button 'Login'
  end
end