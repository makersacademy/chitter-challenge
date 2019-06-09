feature 'login page' do
  scenario 'a user can login with correct details' do
    visit('/')
    click_button 'login'
    expect(page).to have_content('Enter Email')
    expect(page).to have_content('Enter Password')
  end
end
