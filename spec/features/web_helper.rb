def time
  time = Time.now
  "#{time.hour}:#{time.min}"
end

def sign_up
  visit '/'
  expect(page.status_code).to eq(200)
  click_button 'Sign Up'
  expect(current_path).to eq '/users/new'
  fill_in :email, with: 'bobsmith@example.com'
  fill_in :password, with: 'apples!'
  fill_in :name, with: 'Bob'
  fill_in :surname, with: 'Smith'
  fill_in :username, with: 'bobsmith'
  click_button 'Sign up'
  expect(current_path).to eq '/peeps'

end
