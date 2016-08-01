def sign_up(password_confirmation: 'hungover!', email: 'thady@example.com')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :user_name, with: 'CONDOTH1'
  fill_in :email,    with: email
  fill_in :name, with: 'Thady Condon'
  fill_in :password, with: 'hungover!'
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def sign_in(user_name: 'CONDOTH1', password: 'hungover!')
  visit '/sessions/new'
  fill_in :user_name, with: user_name
  fill_in :password, with: password
  click_button 'Sign in'
end

def recover_password
  visit '/users/recovery'
  fill_in :email, with: "thady@example.com"
  click_button "Submit"
end

def new_password
  recover_password
  visit("/users/reset_password?token=#{user.password_token}")
  fill_in :password, with: "newpword"
  fill_in :password_confirmation, with: "newpword"
  click_button "Submit"
end
