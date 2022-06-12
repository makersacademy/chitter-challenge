feature 'user loggin in' do
  scenario 'loging in' do
    visit('/login')
    fill_in :username_id, with: 'hafiz'
    fill_in :password_id, with: '1234567'
    click_button("Login")
  end
end
