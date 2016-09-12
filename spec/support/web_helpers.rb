
module TamsHelper

def register(handle, email)
  visit '/'
  click_button 'Register'
  expect(page.status_code).to eq 200
  expect(page).to have_current_path '/users/new', only_path: true
  fill_in :name, with: 'Someone'
  fill_in :handle, with: handle
  fill_in :email, with: email
  fill_in :password, with: '1234'
  fill_in :password_confirmation, with: '1234'
  click_button 'Sign up!'
  expect(page.status_code).to eq 200
end

def register_mismatched_passwords(handle,email)
  visit '/'
  click_button 'Register'
  expect(page.status_code).to eq 200
  expect(page).to have_current_path '/users/new', only_path: true
  fill_in :name, with: 'Someone'
  fill_in :handle, with: handle
  fill_in :email, with: email
  fill_in :password, with: '1234'
  fill_in :password_confirmation, with: '2222'
  click_button 'Sign up!'
end

def log_in(email, password)
  visit '/'
  click_button 'Log in'
  expect(page).to have_current_path '/users/log-in', only_path: true
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Enter'
end

def post_peep
  visit '/'
  register("sarsar", "sar@sara.com")
  click_button 'New peep'
  fill_in :peep, with: "Got such cheese munchies"
  click_button 'Post Peep!'
end

def post_second_peep
    visit '/'
    click_button 'New peep'
    fill_in :peep, with: "I was this second peep"
    click_button 'Post Peep!'
end

end
