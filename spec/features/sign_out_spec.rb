RSpec.feature 'sign out' do
  scenario 'user needs to be able to sign out' do
    sign_up
    sign_in
    click_button 'Sign Out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, User')
  end
end
