feature 'Sign up' do
  scenario 'User can sign up with an email and password' do
    visit '/'
    click_button "Sign up"
    fill_in 'username', with: 'Daniel'
    fill_in 'email', with: 'example@test.com'
    fill_in 'password', with: '12345'
    click_button 'Sign up'
    expect(page).to have_content 'Sign up successful!'
  end
end
