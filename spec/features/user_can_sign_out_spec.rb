feature 'The user can sign themselves in' do
  scenario 'once they have signed up' do
    log_in_as_billy
    click_button 'Log out'
    expect(page).to have_content 'You are now logged out.'
  end
end
