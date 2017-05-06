module Helpers
  def signup(name: "Sophie",
    username: "sophie",
    email: 'sophie@example.com',
    password: "password",
    password_confirmation: "password")
    visit '/users/new'
    fill_in 'name', with: name
    fill_in 'username', with: username
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password_confirmation
    click_button 'Submit'
  end

  def signin(name: "Sophie",
    username: "sophie",
    email: 'sophie@example.com',
    password: "password",
    password_confirmation: "password")
    visit '/sessions/new'
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'Submit'
  end

  def signout
    click_button 'Sign out'
  end
end
