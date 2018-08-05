feature 'authentication' do
  scenario 'allows a user to log in' do
    User.create(username: 'John', name: 'John', email: 'john@doe.com', password: 'everypasswordever')
    visit '/sessions/new'
    fill_in("email", :with => 'john@doe.com')
    fill_in("password", :with => 'everypasswordever')
    click_button("Log in")
    expect(page).to have_content 'Hi, John!'
  end

  it 'a user can sign out' do
    User.create(username: 'John', name: 'John', email: 'john@doe.com', password: 'everypasswordever')
    visit '/sessions/new'
    fill_in("email", :with => 'john@doe.com')
    fill_in("password", :with => 'everypasswordever')
    click_button("Log in")
    click_button('Log out')
    expect(page).not_to have_content 'Hi, John!'
    expect(page).to have_content 'Please sign in'
  end
end
