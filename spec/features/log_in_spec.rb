feature 'Log in page' do
  scenario 'User logs into chitter successfully' do
    sign_up
    visit('/peeps/login')
    fill_in('username', with: 'james_smith')
    fill_in('password', with: 'Password123')
    click_button 'Log in'

    expect(page).to have_content 'Chitter Feed'
  end
end
