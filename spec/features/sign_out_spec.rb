feature 'sign out' do
  scenario 'able to sign out' do
    sign_in('user@email.com', '1234')
    click_button 'sign_out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end
end
