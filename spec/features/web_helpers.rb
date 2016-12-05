def sign_up(email: 'test@test.co.uk', password: 'password1234', password_confirm: 'password1234', name: 'Kornelia', handle: 'Kdawg')
  visit '/sign_up'
  expect(page.status_code).to eq(200)
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirm, with: password_confirm
  fill_in :name, with: name
  fill_in :handle, with: handle
  click_button 'Sign Up'
end

def log_in(email: 'test@test.co.uk', password: 'password1234')
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

def add_peep
  visit '/peeps/new'
  fill_in :title, with: 'Help'
  fill_in :message, with: 'Ed Balls'
  click_button 'Add Peep'
end
