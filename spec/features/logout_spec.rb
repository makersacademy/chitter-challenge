# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter
feature 'Logout' do
  scenario 'User can logout of Chitter' do
    sign_up
    visit '/'
    click_button 'Logout'
    expect(current_path).to eq '/'
    expect(page).to have_content 'You have logged out'
  end
  scenario 'User cannot logout if not logged in' do
    visit '/'
    expect(page).not_to have_selector(:link_or_button, 'Logout')
  end
end
