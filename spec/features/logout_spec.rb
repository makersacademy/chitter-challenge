feature 'Logging out' do
  scenario 'User logs out' do
    signup
    click_button 'Logout'
    expect(page).to have_content("Hey, Guest!")
  end
end
