feature 'Logging out' do
  scenario 'signing out after singing in' do
    correct_sign_up
    click_button 'submit'
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
  end
end
