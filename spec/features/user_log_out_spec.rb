feature 'User signs out' do

  before(:each) do
    User.create(full_name: 'Alwin Solanky',
      username: 'alwins',
      email: 'alwins@gmail.com',
      password: 'password123',
      password_confirmation: 'password123')
  end

  scenario 'log out when signed in' do
    sign_in(username: 'alwins', password: 'password123')
    click_button "sign out"
    expect(page).not_to have_content "Welcome, Alwin Solanky"
  end
end
