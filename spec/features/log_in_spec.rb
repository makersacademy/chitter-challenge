feature 'Log In' do

  scenario 'I can log in and then see my Username' do
    visit('/')
    fill_in("username", with: "test")
    click_button 'Sign In'
    expect(page).to have_content "Welcome, test !"
  end

end
