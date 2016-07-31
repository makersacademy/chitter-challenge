feature 'Login' do
  scenario 'User can login to Chitter' do
    user = User.new(name: 'Mannie', username: 'mannieg', password: 'test',
             password_confirm: 'test', email: 'mannieg@googlemail.com')
    user.save
    visit '/'
    click_link 'Login'
    fill_in 'username', with: 'mannieg'
    fill_in 'password', with: 'test'
    click_button 'Login'
    expect(page).to have_content 'Welcome to Chitter Mannie'
  end
end
