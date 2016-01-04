feature 'User Sign Out' do
  scenario 'a user can sign out when logged in' do
    sign_up
    click_button 'Sign Out!'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Goodbye, Test User'
    expect(page).not_to have_content 'Welcome, Test User'
  end

  scenario 'user cannot sign out when not signed in' do
    visit '/peeps'
    expect(page).not_to have_button 'Sign Out!'
  end
end
