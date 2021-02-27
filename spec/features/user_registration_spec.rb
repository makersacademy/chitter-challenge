feature 'user registration' do
  scenario 'greeted by username after registering' do
    visit '/'
    click_button 'Sign Up'
    fill_in('name', with: 'test')
    fill_in('username', with: 'test_name')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'Test123')
    click_button 'Get Peeping'

    expect(page).to have_content('Hello test_name!')
    expect(current_path).to be '/peeps'
  end
end
