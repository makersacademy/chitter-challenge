feature 'log out' do
  scenario 'a user logs out of Chitter' do

    visit '/'
    fill_in('username', with: 'stro2275')
    fill_in('password', with: 'password123')
    click_button('Submit')

    click_button("Log Out!")

    expect(page).to have_content "Welcome to Chitter!"
  end
end
