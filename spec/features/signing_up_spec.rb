feature 'Signing up for Chitter' do
  scenario 'users should be able to create an account' do
    visit('/')
    click_link('up')
    fill_in('username', with: '@a')
    fill_in('name', with: 'B')
    fill_in('email', with: 'c@d.com')
    fill_in('password', with: '1234')
    fill_in('repassword', with: '1234')
    click_button('submit')
    expect(page).to have_content("sign out @a")
  end
end