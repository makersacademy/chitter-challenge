feature 'logout' do
  scenario 'after registering you can log out' do
    visit ('/')
    click_button('Register')
    fill_in('username', with: "jamie123")
    fill_in('password', with: "qwerty")
    fill_in('firstname', with: "jamie")
    fill_in('lastname', with: "rodney")
    fill_in('email', with: "jamie@jamie.com")
    click_button('Register')
    click_on 'Logout'
    expect(page).to_not have_button 'content'
  end

  scenario 'after logging in you can log out' do
    visit ('/')
    click_button('Register')
    fill_in('username', with: "fred")
    fill_in('password', with: "qwerty")
    fill_in('firstname', with: "jamie")
    fill_in('lastname', with: "rodney")
    fill_in('email', with: "fred@jamie.com")
    click_button('Register')
    click_on 'Logout'
    expect(page).to_not have_button 'Logout'
  end
end
