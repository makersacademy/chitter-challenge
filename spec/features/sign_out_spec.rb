feature 'Can log out' do
  scenario 'can only sign out when signed in' do
    visit('/')
    expect(page).not_to have_content("Log Out")
  end

  scenario 'can sign out once signed in' do
    sign_in
    click_button 'Log Out'
    expect(page).to have_content('Log In')
    expect(page).not_to have_content("Sample")
  end
end