feature 'Incorrect sign in' do
  scenario "i can see a message when i sign in incorrectly" do
    visit('/')
    fill_in('username', with: 'fake username')
    fill_in('password', with: 'fake password')
    click_button('Sign In')
    expect(page).to have_content "Incorrect Username or Password"
  end
end
