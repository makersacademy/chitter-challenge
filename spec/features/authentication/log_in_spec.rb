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

  context 'with invalid username' do
    scenario 'shows an error message' do
      User.create(username: 'Sherwin', password: 'password123')
      visit '/'
      fill_in('username', with: 'Wrong User')
      fill_in('password', with: 'password123')
      click_button 'Log In'
      expect(page).to have_content "Invalid username or password."
    end
  end

  context 'with invalid password' do
    scenario 'shows an error message' do
      User.create(username: 'Sherwin', password: 'password123')
      visit '/'
      fill_in('username', with: 'Sherwin')
      fill_in('password', with: 'wrongpassword')
      click_button 'Log In'
      expect(page).to have_content "Invalid username or password."
    end
  end
end
