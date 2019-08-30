feature 'sign up for chitter' do
  scenario 'a user can sign up for chitter' do
    visit '/'
    click_button 'Sign up'
    fill_in(:email, with: 'me@example.com')
    fill_in(:password, with: 'password1234')
    click_button 'Sign up'

    expect(page).to have_current_path('/')
    expect(page).to have_content('me@example.com is now signed up')
  end
end
