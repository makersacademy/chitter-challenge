def sign_up(name: "Sample", email: "sample@email.com",
  username: "sample1234", password: "password1234",
  password_confirmation: "password1234")
  visit '/sign_up'
  expect(page.status_code).to eq 200
  fill_in(:name, with: name)
  fill_in(:email, with: email)
  fill_in(:username, with: username)
  fill_in(:password, with: password)
  fill_in(:password_confirmation, with: password_confirmation)
  click_button('Sign Up')
end

def sign_in
  User.create(name: 'Sample', email: 'sample@email.com',
    username: 'sample1235', password: 'password1234',
    password_confirmation: 'password1234')
  visit('/log_in')
  fill_in :username, with: 'sample1235'
  fill_in :password, with: 'password1234'
  within(:css, "form") do
    click_button 'Log In'
  end
end