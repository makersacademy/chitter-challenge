feature 'login' do
  scenario 'on login page, user can log in' do
    visit('/login')
    expect(page).to have_content "Log back into Chitter!"
    fill_in(:username, with: "JCash")
    fill_in(:password, with: 12345)
    click_on('Login')
    expect(page).to have_content "Catch up on the latest peeps!"
  end
end
