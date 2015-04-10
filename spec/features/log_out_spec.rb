feature 'Logging out' do

  before(:each) do
  User.create(email:'test@test.com',
          password:'12345',
          password_confirmation:'12345',
          name:'test_name',
          username:'user_numero_uno')
  end
  scenario 'while logged in' do
    sign_in
    click_button 'Log out'
    expect(page).to have_content('you have logged out successfully')
    expect(page).not_to have_content('Welcome, user_numero_uno')
  end
# visit home page and not have a welcome message

end

def sign_in(email = 'test@test.com', password='12345')
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'log in'
end