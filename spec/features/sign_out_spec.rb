feature 'sign out of chitter' do
  scenario 'can sign out' do
    sign_in
    click_button 'Sign out'
    expect(page).to have_content('You have signed out.')
  end
end
