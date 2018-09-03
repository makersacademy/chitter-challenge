require './app'

feature 'user signs in' do
  scenario 'username is displayed on the peep homepage' do
    visit '/'
    click_button 'Sign In'
    fill_in('name', with: 'Name')
    fill_in('username', with: 'Username')
    fill_in('password', with: 'password')
    click_button('Start Peeping')
    expect(page).to have_content 'User: Username'
  end
end
