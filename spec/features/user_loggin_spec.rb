feature 'user loggin in' do
  scenario 'loging in' do
    visit('/login')
    fill_in :username, with: 'hafiz'
    fill_in :password, with: '1234567'
    click_button("Login")
  end
end
