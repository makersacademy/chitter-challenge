feature 'App can register users' do
  scenario 'Users register with name, username, email and password' do
    visit('/')
    click_button("Register")
    fill_in "name", with: "Test"
    fill_in "username", with: "test"
    fill_in "email", with: "test@hotmail.co.uk"
    fill_in "password", with: "test123"
    click_button("Submit")
    expect(page).to have_content "Successfuly created account Test, log in to post peeps!"   
  end
  scenario 'After registration, a user gets a confirmation message - once' do
    register_user
    visit('/')
    expect(page).not_to have_content "Successfuly created account, log in to post peeps!"
  end
  scenario 'Username already in use - fail message back to register page' do
    visit('/')
    click_button("Register")
    fill_in "name", with: "Test"
    fill_in "username", with: "taran314"
    fill_in "email", with: "test@hotmail.co.uk"
    fill_in "password", with: "test123"
    click_button("Submit")
    expect(page).to have_content "taran314 is already in use, try a different username"
    expect(page).not_to have_content "Welcome to Chitter!"
  end
  scenario 'Email already in use - fail message back to register page' do
    visit('/')
    click_button("Register")
    fill_in "name", with: "Test"
    fill_in "username", with: "taran314"
    fill_in "email", with: "tarandeep-nandhra@hotmail.co.uk"
    fill_in "password", with: "test123"
    click_button("Submit")
    expect(page).to have_content "tarandeep-nandhra@hotmail.co.uk is already in use, try a different email"
    expect(page).not_to have_content "Welcome to Chitter!"
  end
  scenario 'User gives up, can click button to return to homepage' do
    visit('/')
    click_button("Register")
    fill_in "name", with: "Test"
    fill_in "username", with: "zeezee"
    fill_in "email", with: "test@hotmail.co.uk"
    fill_in "password", with: "test123"
    click_button("Submit")
    click_button("Homepage")
    expect(page).to have_content "Welcome to Chitter!"
  end
end
