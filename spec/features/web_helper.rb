def time
  time = Time.now
  "#{time.hour}:#{time.min}"
end

def sign_up(email: 'bobsmith@example.com',
            password: '12345',
            password_confirmation: '12345',
            name: 'Bob',
            surname: 'Smith',
            username: 'bobsmith')
  visit '/'
  expect(page.status_code).to eq(200)
  click_button 'Sign Up'
  expect(current_path).to eq '/users/new'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  fill_in :name, with: name
  fill_in :surname, with: surname
  fill_in :username, with: username
  click_button 'Sign up'
  expect(current_path).to eq '/peeps'

end
