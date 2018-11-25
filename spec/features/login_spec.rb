feature 'log in' do
  scenario 'login with existing account' do
    # web_helper signup method
    sign_up

    click_link('login_signup')

    fill_in('email', with: 'abdi@gmail.com')
    fill_in('pwd', with: 'password123')
    expect(page).to have_field("email")
    expect(page).to have_field("pwd")
    click_button('login')

    expect(page).to have_field("Welcome back, Abdi!")
  end
end
