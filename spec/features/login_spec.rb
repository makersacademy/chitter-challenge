feature 'log in' do
  scenario 'login with existing account' do

    # web_helper signup method
    user_info = {'first_name' => 'abdi', 'last_name' => 'abdi','email' => 'abdi2@gmail.com', 'password' => 'password123'}
    User.create(user_info)

    visit('/')
    click_link('login_signup')

    fill_in('email', with: 'abdi2@gmail.com')
    fill_in('pwd', with: 'password123')
    expect(page).to have_field("email")
    expect(page).to have_field("pwd")
    click_button('login')

    expect(page).to have_content("abdi2@gmail.com")
  end
end
