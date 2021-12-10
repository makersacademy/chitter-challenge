require './lib/user'

feature 'Logging in' do
  scenario 'shows a welcome messsage' do
    User.create(username: 'Sherwin', password: 'password123')
    visit '/'
    fill_in('username', with: 'Sherwin')
    fill_in('password', with: 'password123')
    click_button 'Log In'
    expect(page).to have_content "Welcome, Sherwin!"
    expect(page.current_path).to eq('/messages')
  end
end