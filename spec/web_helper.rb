def sign_up
  visit '/'
  expect(page.status_code).to eq(200)
  click_button "Create new account"
  fill_in :username, with: "spock45"
  fill_in :email, with: "spock@starfleet.com"
  fill_in :name, with: "Spock"
  fill_in :password, with: "l0gicaL"
  fill_in :password_confirmation, with: "l0gicaL"
  click_button 'Sign up'
end
