feature 'sign up' do
  scenario 'signup form up for new user' do
    visit('/')
    click_link('login_signup')
    click_link('create_account')
    expect(page).to have_field("fname")
    expect(page).to have_field("lname")
    expect(page).to have_field("email")
    expect(page).to have_field("confirm_email")
    expect(page).to have_field("pwd")
    expect(page).to have_field("confirm_pwd")
  end

  scenario 'submit form' do
    visit('/')
    click_link('login_signup')
    click_link('create_account')

    fill_in('fname', with: 'Abdi')
    fill_in('lname', with: 'Abdi')
    fill_in('email', with: 'abdi@gmail.com')
    fill_in('confirm_email', with: 'abdi@gmail.com')
    fill_in('pwd', with: 'password123')
    fill_in('confirm_pwd', with: 'password123')
    click_button('signup')
    expect(page).to have_content('abdi@gmail.com')
  end
end
