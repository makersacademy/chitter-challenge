feature 'User sign out' do

  scenario 'Successful sign out' do
    sign_up
    sign_in
    click_button 'Log out'
    expect(page).to have_content 'Goodbye!'
    expect(page).not_to have_content 'Welcome, Ruan'
  end
end
