feature 'user signs out' do
  before do
    sign_up
  end

  scenario 'while signed in' do
    click_button 'Sign out'
    expect(page).to have_content("Goodbye")
    expect(page).to have_content('Welcome to Chitter!')
    expect(page).not_to have_content('Welcome to Chitter! Sam')
  end
end
