feature 'Homepage' do
  scenario 'Displays basic info' do
    visit '/'
    expect(page).to have_content('Welcome to Chitter')
    expect(page).to have_selector(:link_or_button, 'Sign Up')
    expect(page).to have_selector(:link_or_button, 'Sign In')
  end

  scenario 'Displays existing users' do
    sign_up('name', 'user1', 'mail@test.test', '2', '2')
    sign_out
    sign_up('name2', 'user2', 'mail2@test.test', '2', '2')
    sign_out
    expect(page).to have_content('user1')
    expect(page).to have_content('user2')
  end
end
