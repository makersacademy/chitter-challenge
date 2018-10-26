require 'pry'
feature 'As a user:' do
  scenario 'I can create an account' do
    create_account('jones')
    expect(page).to have_content "Logged in as John"
  end
  scenario 'I cannot have the same username or email' do
    create_account('john')
    click_button 'Logout'
    create_account('john')
    expect(page).to have_content "Username or email already exists"
  end
  scenario 'I can log out' do
    create_account('james')
    click_button 'Logout'
    expect(page).not_to have_content "Logged in as John"
  end
  scenario 'I can log in' do
    create_account('jimmy', 'jimmy')
    click_button 'Logout'
    fill_in('Username', with: 'jimmy')
    fill_in('Password', with: 'runrunrun')
    click_button 'Log In'
    expect(page).to have_content "Logged in as jimmy"
  end
end
