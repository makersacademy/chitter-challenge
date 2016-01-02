# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to sign out of Chitter

feature 'Client signs out' do
  scenario 'succesfully' do
    sign_up
    sign_in(email: 'test@email.com', password: 'secret_password')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@email.com')
  end
end
