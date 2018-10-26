require 'pry'

feature 'sign up' do
  scenario 'user can sign up with their email address, name, username, and a password' do
    sign_up_user
    # binding.pry
    expect(page).to have_content "chloeverity123's peeps"
  end
end

feature 'another person can sign up' do
  scenario 'a second user can sign up with their email address, name, username, and a password' do
    visit('/sign_up')
    fill_in('name', with: 'Janice Verity')
    fill_in "username", with: "janverity"
    fill_in "emailaddress", with: "janverity@gmail.com"
    fill_in "password", with: "chloeismyfavouritechild"
    click_button "Sign Me Up"
    expect(page).to have_content "janverity's peeps"
  end
end

feature "unique usernames and email addresses" do
  scenario "a user can't sign up if the username or email is taken" do
    sign_up_user
    sign_up_user
    expect(page).to have_content "Username/Password already taken"
  end
end
