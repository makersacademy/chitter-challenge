feature 'Signing in' do
  scenario 'a user signs in' do
    visit '/'
    click_link 'Login'
    fill_in 'username', with: 'Aimee'
    fill_in 'password', with: 'password'
    click_button 'Login'
    expect(page).to have_content 'Hi, Aimee!'
  end
end
