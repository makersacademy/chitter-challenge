feature 'sign up' do
  scenario 'makers can sign up' do
    visit '/'
    click_button 'Sign up'
    fill_in 'email', with: 'test@testing.com'
    fill_in 'password', with: 'secret'
    fill_in 'name', with: 'Test Bloggs'
    fill_in 'username', with: 'testy'
    click_button 'Submit'
    expect(page).to have_content 'Welcome to Chitter, testy!'
  end
end
