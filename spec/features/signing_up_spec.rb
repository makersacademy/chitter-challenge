feature 'signing up' do
  scenario 'user should be able to sign up for Chitter' do
    visit('/chits')
    click_button 'Sign up!'
    fill_in "email", with: "john@connor.com"
    fill_in "name", with: "John Connor"
    fill_in "username", with: "johnconnor"
    fill_in "password", with: "terminated"
    click_button "Become a Chitter"
    expect(page).to have_content "Welcome, you little chitter-er"
  end

  scenario 'should check the username is unique' do
    visit('/chits')
    click_button 'Sign up!'
    fill_in "email", with: "john@connor.com"
    fill_in "name", with: "John Connor"
    fill_in "username", with: "johnconnor"
    fill_in "password", with: "terminated"
    click_button "Become a Chitter"

    click_button 'Sign up!'
    fill_in "email", with: "bob@connor.com"
    fill_in "name", with: "John Connor"
    fill_in "username", with: "johnconnor"
    fill_in "password", with: "terminated"
    click_button "Become a Chitter"
    expect(page).to have_content "Username already in use"
    expect(page).not_to have_content "Welcome, you little chitter-er"
  end
end