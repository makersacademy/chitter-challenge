require_relative '../web_helper.rb'

feature 'User sign in' do
  scenario 'a user can sign in' do
    sign_up
    click_button 'Sign out'
    visit '/sessions/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: 'test@example.com'
    fill_in :password,    with: '12345'
    click_button 'Sign in'
    expect(page).to have_content "Hello, JoeBloggs93"
  end
end
