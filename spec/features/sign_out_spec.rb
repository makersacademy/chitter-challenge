feature 'signing out' do
  before do
    sign_up_as_alice_bobson
  end

  scenario 'should change content the user views in the app' do
    expect(page).to have_content 'Hello albob123'
    click_button 'Sign out'
    expect(page).to have_content 'You have signed out.'
    click_button 'View all peeps'
    expect(page).to have_content 'Hello guest'
    expect(page).not_to have_selector 'Sign out'
  end
end
