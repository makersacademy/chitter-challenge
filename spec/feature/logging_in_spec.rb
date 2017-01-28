feature 'Logging in' do
  scenario 'with correct credentials' do
    correct_sign_up
    click_button 'submit'
    visit '/'
    click_button 'Log-in'
    correct_sign_in
    click_button 'Log-in'
    expect(page).to have_content "Welcome, #{current_user.name}"
  end
end
