# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'create a user account' do
  scenario 'Sign up as a user' do
    visit '/'
    click_button('New User')
    fill_in('name', with: 'Ian')
    fill_in('username', with: 'iaquino47')
    fill_in('email', with: 'ianaquino47@gmail.com')
    fill_in('password', with: 'password123')
    click_button('Add Me')
    expect(page).to have_content('Hi iaquino47')
  end
end
