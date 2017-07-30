
def send_a_peep
  visit ('/messages')
  fill_in :peep, with: "I am a stupid and vapided peeper"
  click_button "Peep"
end

def todays_date_toady
  time = Time.new
  values = time.to_a
  Time.utc(*values)

end

def sign_up(email: 'sully@example.com',
            password: 'oranges!',
            password_confirmation: 'oranges!')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: 'oranges!'
  click_button 'Sign up'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
