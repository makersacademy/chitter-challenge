feature 'register user' do
  scenario 'fill in registration' do
    visit ('/')
    click_button('Register')
    fill_in('username', with: "jamie123")
    fill_in('password', with: "qwerty")
    fill_in('firstname', with: "jamie")
    fill_in('lastname', with: "rodney")
    fill_in('email', with: "jamie@jamie.com")
    click_button('Register')
    fill_in('username', with: "jamie123")
    fill_in('password', with: "werty")
    click_button('Login')
    expect(page).to have_content "Incorrect username or password"
  end

  scenario 'fill in registration' do
    visit ('/')
    click_button('Register')
    fill_in('username', with: "jamie123")
    fill_in('password', with: "qwerty")
    fill_in('firstname', with: "jamie")
    fill_in('lastname', with: "rodney")
    fill_in('email', with: "jamie@jamie.com")
    click_button('Register')
    fill_in('username', with: "amie123")
    fill_in('password', with: "qwerty")
    click_button('Login')
    expect(page).to have_content "Incorrect username or password"
  end
end
