
def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :username, with: 'Simon'
  fill_in :email,    with: 'test@test.com'
  fill_in :password, with: '123'
  fill_in :password_confirmation, with: '123'
  click_button 'Submit'
end

def sign_up_not_matching_password
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :username, with: 'Simon'
  fill_in :email,    with: 'test@test.com'
  fill_in :password, with: '123'
  fill_in :password_confirmation, with: '155'
  click_button 'Submit'
end

def sign_up_no_email
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :username, with: 'Simon'
  fill_in :email,    with: ''
  fill_in :password, with: '123'
  fill_in :password_confirmation, with: '123'
  click_button 'Submit'
end

def sign_up_wrong_email_format
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :username, with: 'Simon'
  fill_in :email,    with: 'simon.com'
  fill_in :password, with: '123'
  fill_in :password_confirmation, with: '123'
  click_button 'Submit'
end


def sign_in(email, password)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Submit'
end

def peep(text)
  fill_in :peep, with: text
  click_button("Peep!")
end
