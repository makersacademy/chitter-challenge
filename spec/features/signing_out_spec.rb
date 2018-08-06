feature 'Signing out' do
  scenario 'Lets a user sign out' do
    sign_in_and_enter
    click_button 'Peep out'
    expect(page).to have_content 'Welcome, to Chitter, a place for all!'
  end
end
