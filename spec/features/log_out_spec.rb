feature 'user can log out' do
  scenario 'user clicks sign out button' do
    sign_up
    click_button 'Log out'
    expect(page).to have_content 'Bye! Come back soon.'
    expect(page).not_to have_content 'Welcome, example26!'
    expect(current_path).to eq('/sessions/new')
  end
end
