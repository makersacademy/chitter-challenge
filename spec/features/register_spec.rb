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
    fill_in('password', with: "qwerty")
    click_button('Login')
    expect(page).to have_content "\nHello jamie123"
  end

  scenario 'username already taken' do
    visit ('/')
    click_button('Register')
    fill_in('username', with: "jamie123")
    fill_in('password', with: "qwerty")
    fill_in('firstname', with: "jamie")
    fill_in('lastname', with: "rodney")
    fill_in('email', with: "jamie@jamie.com")
    click_button('Register')
    click_button('Register')
    fill_in('username', with: "jamie123")
    fill_in('password', with: "qwerty")
    fill_in('firstname', with: "jamie")
    fill_in('lastname', with: "rodney")
    fill_in('email', with: "jamie@jamie.com")
    click_button('Register')
    expect(page).to have_content 'Username already exists'
  end
end
