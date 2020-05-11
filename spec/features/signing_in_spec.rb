feature 'signing in' do
  scenario 'user enters their name for the first time' do
    visit '/'
    click_button 'Sign up'
    fill_in('name', with: "Alice")
    fill_in('email', with: "example@example.com")
    fill_in('password', with: "swordfish")
    fill_in('username', with: "A-dog")
    click_button 'Sign up'
    expect(page).to have_content ("A-dog's cheeps")
  end
end
