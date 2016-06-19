feature 'Logging out' do
  scenario 'User logs out' do
    signup
    visit '/logout'
    expect(page).to have_content("Hey, Guest!")
  end
end
