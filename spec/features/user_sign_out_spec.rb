feature 'User sign out' do
  scenario 'User can sign out of website' do
    sign_up
    sign_in
    click_button 'sign out'
    expect(page).to have_content 'Goodbye!'
  end
end
