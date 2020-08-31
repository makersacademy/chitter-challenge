feature 'user log in' do
  scenario 'loads the log in page and form' do
    visit '/'
    click_button 'login'
    expect(page).to have_content 'Log in to start peeping'
    expect(page).to have_field 'username'
    expect(page).to have_field 'password'
    expect(page).to have_button 'login'
  end
end
