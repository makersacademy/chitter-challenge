feature 'post message' do

    scenario 'submit and see message' do
      visit ('/')
      click_button('Register')
      fill_in('username', with: "jamie123")
      fill_in('password', with: "qwerty")
      click_button('Register')
      fill_in('username', with: "jamie123")
      fill_in('password', with: "qwerty")
      click_button('Login')
      fill_in('content', with: 'Test message')
      click_button('Submit')
      expect(page).to have_content('Test message')
  end

  scenario 'submit message and see messages in reverse order' do
    visit ('/')
    click_button('Register')
    fill_in('username', with: "jamie123")
    fill_in('password', with: "qwerty")
    click_button('Register')
    fill_in('username', with: "jamie123")
    fill_in('password', with: "qwerty")
    click_button('Login')
    fill_in('content', with: 'Test message')
    click_button('Submit')
    fill_in('content', with: 'Test message    number 2')
    click_button('Submit')
    expect(page).to have_content("Test message number2")
end
end
