feature 'Signing out' do
  scenario 'user signs out' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'username', with: 'Mittens'
    click_button 'Register'
    expect(page).to have_link 'Logout'
    click_link 'Logout'
    expect(page).to have_content 'Sign Up'
    expect(page).not_to have_content 'Hi, Mittens!'
  end
end
