require 'pg'

feature 'registering for chitter' do
  scenario 'a user can sign up for chitter' do
    visit('/users/new')
    fill_in('name', with: 'a name')
    fill_in('username', with: 'example username')
    fill_in('psw', with: 'password123')
    fill_in('psw-repeat', with: 'password123')
    click_button('submit')

    expect(page).to have_content "Welcome example username"
  end
end